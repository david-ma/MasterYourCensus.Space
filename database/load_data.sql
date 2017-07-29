INSERT INTO question (question_type, category, question, end_message) VALUES (
'More/Less',
'Education',
'Did you know? A whopping 30% of Sandringham residents in schools. Do you think Glen Waverleyians are more or less than that?',
'BAD LUCK - you thought too highly of Sandringham');
INSERT INTO question_option (question_id, description, answer) VALUES
(LAST_INSERT_ID(), 'More', TRUE),
(LAST_INSERT_ID(), 'Less', FALSE)
;
