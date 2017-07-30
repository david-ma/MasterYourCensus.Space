<?php
require_once('.config.php');

$myc = new mysqli('localhost', DB_USER, DB_PASS, DB_SCHEMA);

$question = (object) array();

if ($result = $myc->query("SELECT * FROM question ORDER BY rand() LIMIT 1")) {
  while($row = $result->fetch_object()) {
    $question->id = $row->id;
    $question->type = $row->question_type;
    $question->question = $row->question;
    $question->endMessage = $row->end_message;
  }
}

if ($result = $myc->query("SELECT * FROM question_option WHERE question_id = " . $question->id . " ORDER BY answer DESC")) {
  while($row = $result->fetch_object()) {
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

$result->close();
$myc->close();

header("Content-Type: application/json");
print json_encode($question);
