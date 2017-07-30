<?php
require_once('.config.php');

$question = (object) array();
$question_id = "";

if ($_SERVER['REQUEST_METHOD'] == 'GET') {
  if (isset($_REQUEST['id'])) {
    if(preg_match("/^[0-9]+$/", $_REQUEST['id'])) {
      $question_id = $_REQUEST['id'];
    }
  }
  $question = getResponses($question_id);
}

function getResponses($id) {
  $myc = new mysqli('localhost', DB_USER, DB_PASS, DB_SCHEMA);
  $question_id = $id != "" ? trim($id) : "";
  
  $questions = array();
  $question = (object) array();
  
  $sql = "SELECT * FROM question" . (is_numeric($question_id) ? " WHERE id = " . $question_id : "");

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

      $sql = "SELECT question_id, sum(correct) as correct, sum(if(correct, 0 ,1)) as incorrect";
      $sql.= " FROM question_response WHERE question_id = " . $question->id;
      $sql.= " GROUP BY question_id";

      if ($result_rs = $myc->query($sql)) {
        while($row = $result_rs->fetch_object()) {
          $question->correct = $row->correct;
          $question->incorrect = $row->incorrect;
        }
      }
      $result_rs->close();
    }
    $questions[] = $question;
  }
 
  $result_q->close();
  $myc->close();

  return $questions;
}

header("Content-Type: application/json");
print json_encode($question);
