<?php
require_once('.config.php');

$myc = new mysqli('localhost', DB_USER, DB_PASS, DB_SCHEMA);

if ($_SERVER['REQUEST_METHOD'] == 'GET') {
  $leaderboard= (object) array();

  if ($result = $myc->query("SELECT * FROM leaderboard ORDER BY score DESC, created_on ASC")) {
    while($row = $result->fetch_object()) {
      $leaderboard[]->tla = $row->tla;
      $leaderboard[]->score = $row->score;
      $leaderboard[]->created_on = $row->created_on;
    }
  }

  $result->close();
}

$myc->close();

header("Content-Type: application/json");
print json_encode($leaderboard);
