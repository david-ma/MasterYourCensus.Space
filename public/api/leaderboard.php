<?php
require_once('.config.php');

$leaderboard = (object) array();
$tla = "";
$score = "";

if ($_SERVER['REQUEST_METHOD'] != 'GET' && $_SERVER['REQUEST_METHOD'] != 'POST') {
  exit;
}

if ($_SERVER['REQUEST_METHOD'] == 'GET') {
  $leaderboard = getLeaderboard();
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
  $le_post = file_get_contents("php://input");
  $le_json = json_decode($le_post, true);

  if (isset($le_json['tla'])) {
    if(preg_match("/^[A-Z]{3}$/", $le_json['tla'])) {
      $tla = $le_json['tla'];
    }
  }
  if (isset($le_json['score'])) {
    if(preg_match("/^[0-9]+$/", $le_json['score'])) {
      $score = $le_json['score'];
    }
  }

  $leaderboard = postLeaderboard($tla, $score);

  if (!array_key_exists("error", $leaderboard)) {
   $leaderboard = getLeaderboard();
  }
}

function getLeaderboard() {
  $myc = new mysqli('localhost', DB_USER, DB_PASS, DB_SCHEMA);

  $leaderboard = array();

  if ($result = $myc->query("SELECT * FROM leaderboard ORDER BY score DESC, created_on ASC")) {
    while($row = $result->fetch_object()) {
      $leaderboard[] = (object) array("tla" => $row->tla, "score" => $row->score, "created" => $row->created_on);
    }
  }

  $result->close();
  $myc->close();

  return $leaderboard;
}

function postLeaderboard($tla, $score) {
  $myc = new mysqli('localhost', DB_USER, DB_PASS, DB_SCHEMA);
  
  if ($tla == "") {
    return array("error" => "Invalid TLA");
  }

  if ($score == "") {
    return array("error" => "Invalid score.");
  }

  $stmt = $myc->prepare("REPLACE INTO leaderboard (tla, score) VALUES (?, ?)");
  $stmt->bind_param("si", $tla, $score);
  $stmt->execute();

  $stmt->close();
  $myc->close();

  return array();
}

header("Content-Type: application/json");
print json_encode($leaderboard);
