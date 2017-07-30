<?php
require_once('.config.php');

$question = (object) array();
$question_id = "";
$correct = "";
$answer = "";


if ($_SERVER['REQUEST_METHOD'] != 'GET' && $_SERVER['REQUEST_METHOD'] != 'POST') {
  exit;
}

if ($_SERVER['REQUEST_METHOD'] == 'GET') {
  if (isset($_REQUEST['id'])) {
    if(preg_match("/^[0-9]+$/", $_REQUEST['id'])) {
      $question_id = $_REQUEST['id'];
    }
  }
  $question = getQuestion($question_id);
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
  $le_post = file_get_contents("php://input");
  $le_json = json_decode($le_post, true);

  if (isset($le_json['question_id'])) {
    if(preg_match("/^[0-9]+$/", $le_json['question_id'])) {
      $question_id = $le_json['question_id'];
    }
  }
  if (isset($le_json['correct'])) {
    if(preg_match("/^(true|false)$/", $le_json['correct'])) {
      $correct = $le_json['correct'];
    }
  }
  if (isset($le_json['answer'])) {
    if(preg_match("/^.+$/", $le_json['answer'])) {
      $answer = $le_json['answer'];
    }
  }

  $question = getQuestion($question_id);

  if ($question->id == $question_id) {
    $question = postResponse($question, $correct, $answer);

    if ($question == null) {
      $question = getQuestion($question_id);
    }
  } else {
    $question = (object) array("error"=>"Question not found.");
  }
}

function getQuestion($id) {
  $myc = new mysqli('localhost', DB_USER, DB_PASS, DB_SCHEMA);
  $question_id = $id != "" ? trim($id) : "";
  
  $question = (object) array();
  
  $sql = "SELECT * FROM question" . (is_numeric($question_id) ? " WHERE id = " . $question_id : " ORDER BY rand() LIMIT 1");

  if ($result_q = $myc->query($sql)) {
    while($row = $result_q->fetch_object()) {
      $question->id = $row->id;
      $question->type = $row->question_type;
      $question->question = $row->question;
      $question->endMessage = $row->end_message;

      if ($result_qo = $myc->query("SELECT * FROM question_option WHERE question_id = " . $question->id . " ORDER BY answer DESC")) {
        while($row = $result_qo->fetch_object()) {
          if ($question->type == 'Slider') {
            $question->correctAnswer = floatval($row->description);
            $question->unit = $row->slider_unit;
            $question->min = floatval($row->slider_min);
            $question->max = floatval($row->slider_max);
          } else {
            if ($row->answer == true) {
              $question->correctAnswer = $row->description;
            } else {
              $question->otherAnswers[]= $row->description;
            }
          }
        }
      }
      $result_qo->close();
    }
  }
  
  $result_q->close();
  $myc->close();

  return $question;
}

function postResponse($question, $correct, $answer) {
  $myc = new mysqli('localhost', DB_USER, DB_PASS, DB_SCHEMA);
  
  if ($answer === "") {
    return (object) array("error" => "Invalid answer.");
  }

  $correct = ($correct == "true" ? 1 : 0);

  if ($correct === "") {
    return (object) array("error" => "Correctness value isn't correct lol.");
  }

  if ($question->type == "Slider") {
    if (!is_numeric($answer)) {
      return (object) array("error" => "Expected the Slider answer to be a number.");
    }
    $answer = floatval($answer);
  } else {
    # check whether the answer exists
    if ($correct) {
      if ($answer != $question->correctAnswer) {
        return (object) array("error" => "Don't lie to me!");
      }
    } else {
      if (!in_array($answer, $question->otherAnswers)) {
        return (object) array("error" => "That answer doesn't exist. But thanks anyway.");
      } 
    }
  }

  $response_stmt = $myc->prepare("INSERT INTO question_response (question_id, correct, answer) VALUES (?, ?, ?)");
  $response_stmt->bind_param("iis", $question->id, $correct, $answer);
  $response_stmt->execute();

  $response_stmt->close();
  $myc->close();

  return null;
}

header("Content-Type: application/json");
print json_encode($question);
