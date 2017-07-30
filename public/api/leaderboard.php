<?php
require_once('.config.php');

$leaderboard = (object) array();
$name = "";
$school = "";
$score = "";
$email = "";

if ($_SERVER['REQUEST_METHOD'] != 'GET' && $_SERVER['REQUEST_METHOD'] != 'POST') {
  exit;
}

if ($_SERVER['REQUEST_METHOD'] == 'GET') {
  $leaderboard = getLeaderboard();
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
  $le_post = file_get_contents("php://input");
  $le_json = json_decode($le_post, true);

  if (isset($le_json['name'])) {
    if(preg_match("/^.{1,255}$/", $le_json['name'])) {
      $name = $le_json['name'];
    }
  }
  if (isset($le_json['school'])) {
    if(preg_match("/^.{1,255}$/", $le_json['school'])) {
      $school = $le_json['school'];
    }
  }
  if (isset($le_json['score'])) {
    if(preg_match("/^[0-9]+$/", $le_json['score'])) {
      $score = $le_json['score'];
    }
  }
  if (isset($le_json['email'])) {
    if(preg_match("/^.{1,255}$/", $le_json['email'])) {
      $email = $le_json['email'];
    }
  }

  $leaderboard = postLeaderboard($name, $school, $score, $email);

  if (!array_key_exists("error", $leaderboard)) {
   $leaderboard = getLeaderboard();
  }
}

function getLeaderboard() {
  $myc = new mysqli('localhost', DB_USER, DB_PASS, DB_SCHEMA);

  $leaderboard = array();

  if ($result = $myc->query("SELECT * FROM leaderboard ORDER BY score DESC, created_on ASC")) {
    while($row = $result->fetch_object()) {
      $leaderboard[] = (object) array("name" => $row->name,
                                    "school" => $row->school,
                                     "score" => $row->score,
                                     "email" => $row->email,
                                   "created" => $row->created_on);
    }
  }

  $result->close();
  $myc->close();

  return $leaderboard;
}

function postLeaderboard($name, $school, $score, $email) {
  $myc = new mysqli('localhost', DB_USER, DB_PASS, DB_SCHEMA);
  
  if ($name == "") {
    return array("error" => "Missing name.");
  }
  if ($school == "") {
    return array("error" => "Missing school.");
  }
  if ($score == "") {
    return array("error" => "Invalid score.");
  }
  if ($email == "") {
    return array("error" => "Invalid email.");
  }


  $stmt = $myc->prepare("INSERT INTO leaderboard (name, school, score, email) VALUES (?, ?, ?, ?) ON DUPLICATE KEY UPDATE score = IF(score < ?, ?, score) ");
  $stmt->bind_param("ssisii", $name, $school, $score, $email, $score, $score);
  $stmt->execute();

  $stmt->close();
  $myc->close();

  return array();
}

header("Content-Type: application/json");
print json_encode($leaderboard);
