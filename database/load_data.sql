INSERT INTO question (question_type, category, question, end_message) VALUES (
'More/Less',
'Education',
'Did you know? A whopping 30% of Sandringham residents in schools. Do you think Glen Waverleyians are more or less than that?',
'BAD LUCK - you thought too highly of Sandringham');
INSERT INTO question_option (question_id, description, answer) VALUES
(LAST_INSERT_ID(), 'More', TRUE),
(LAST_INSERT_ID(), 'Less', FALSE)
;
INSERT INTO question (question_type, category, question, end_message) VALUES (
'Slider',
'Religion',
'How many people in Glen Waverley are seeking Buddhist enlightenment?',
'Unfortunately, you won\'t reach nirvana with that religion!');
INSERT INTO question_option (question_id, answer, description, slider_unit, slider_min, slider_max, slider_threshold) VALUES
(LAST_INSERT_ID(), TRUE, '10', '%', 0, 100, 20);
INSERT INTO leaderboard (tla, score) VALUES ('HAL', 1);
INSERT INTO leaderboard (tla, score) VALUES ('GLX', 42);

