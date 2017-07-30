INSERT INTO question (question_type, category, question, end_message) VALUES (
'Multiple Choice',
'Demographic',
'Alex is a median person in Glen Waverley. Alex lives a median life in a median house with a median number of cars at home. What do you think Alex\'s age is?',
'Not a median answer');
INSERT INTO question_option (question_id, description, answer) VALUES
(LAST_INSERT_ID(), '41', TRUE),
(LAST_INSERT_ID(), '40', FALSE),
(LAST_INSERT_ID(), '42', FALSE),
(LAST_INSERT_ID(), '43', FALSE)
;
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
'Multiple Choice',
'Education',
'Out of all students from prep to Year 12 in Glen Waverley, what type of educational institutions are they most likely at (when they aren\'t wagging)?',
'Sorry! Government primary schools are where it\'s at!');
INSERT INTO question_option (question_id, description, answer) VALUES
(LAST_INSERT_ID(), 'Primary - Government', TRUE),
(LAST_INSERT_ID(), 'Secondary - Government', FALSE),
(LAST_INSERT_ID(), 'Primary - Catholic', FALSE),
(LAST_INSERT_ID(), 'Secondary - Catholic', FALSE)
;
INSERT INTO question (question_type, category, question, end_message) VALUES (
'Multiple Choice',
'Income',
'Richie Rich wants to live in the suburb with the highest income. Which of the following suburbs earns the most money annually?',
"Ah...Richie Rich doesn't think that's right - he'd prefer to live in Point Cook!");
INSERT INTO question_option (question_id, description, answer) VALUES
(LAST_INSERT_ID(), 'Point Cook', TRUE),
(LAST_INSERT_ID(), 'Glen Waverly', FALSE),
(LAST_INSERT_ID(), 'Rowville', FALSE),
(LAST_INSERT_ID(), 'Toorak', FALSE)
;
INSERT INTO question (question_type, category, question, end_message) VALUES (
'Multiple Choice',
'Income',
"Glen Waverley's average income is..? (Hint: it ends with three zeroes)",
'Think lower. Much lower.');
INSERT INTO question_option (question_id, description, answer) VALUES
(LAST_INSERT_ID(), '28,000', TRUE),
(LAST_INSERT_ID(), '52,000', FALSE),
(LAST_INSERT_ID(), '200,000', FALSE),
(LAST_INSERT_ID(), '1,000,000', FALSE)
;
INSERT INTO question (question_type, category, question, end_message) VALUES (
'Multiple Choice',
'Demographic',
"What's the difference between the popularity.. I mean, population, of Glen Waverley and Northcote?",
'Oops! Looks like it was more than you thought - a lot more!');
INSERT INTO question_option (question_id, description, answer) VALUES
(LAST_INSERT_ID(), '15,766', TRUE),
(LAST_INSERT_ID(), '13,241', FALSE),
(LAST_INSERT_ID(), '12,781', FALSE),
(LAST_INSERT_ID(), '14,221', FALSE)
;
INSERT INTO question (question_type, category, question, end_message) VALUES (
'Multiple Choice',
'Religion',
'What religion is the most popular in Glen Waverley?',
'Come on, this was a freebie');
INSERT INTO question_option (question_id, description, answer) VALUES
(LAST_INSERT_ID(), 'Christianity', TRUE),
(LAST_INSERT_ID(), 'Buddhism', FALSE),
(LAST_INSERT_ID(), 'Hinduism', FALSE),
(LAST_INSERT_ID(), 'Islam', FALSE)
;
INSERT INTO question (question_type, category, question, end_message) VALUES (
'Multiple Choice',
'Demographic',
"What is the third most popular language spoken in Glen Waverley?",
"It's a Sin(halese) you didn't know that one.");
INSERT INTO question_option (question_id, description, answer) VALUES
(LAST_INSERT_ID(), 'Sinhalese', TRUE),
(LAST_INSERT_ID(), 'Mandarin', FALSE),
(LAST_INSERT_ID(), 'Cantonese', FALSE),
(LAST_INSERT_ID(), 'Tamil', FALSE)
;
INSERT INTO question (question_type, category, question, end_message) VALUES (
'Multiple Choice',
'Demographic',
"Alex's mother lives in Glen Waverley - where was she most likely to have been born?",
"NAH MATE! Strayan all the way");
INSERT INTO question_option (question_id, description, answer) VALUES
(LAST_INSERT_ID(), 'Australia', TRUE),
(LAST_INSERT_ID(), 'China', FALSE),
(LAST_INSERT_ID(), 'India', FALSE),
(LAST_INSERT_ID(), 'Malaysia', FALSE)
;
INSERT INTO question (question_type, category, question, end_message) VALUES (
'More/Less',
'Housing',
"Given that 48% of Australians are married - are Glen Waverleyians more likely to be married than the wider population?",
"Nope! Glen Waverlyians are bucking the trend and saying: together, forever!");
INSERT INTO question_option (question_id, description, answer) VALUES
(LAST_INSERT_ID(), 'More', TRUE),
(LAST_INSERT_ID(), 'Less', FALSE)
;
INSERT INTO question (question_type, category, question, end_message) VALUES (
'Multiple Choice',
'Cultural Diversity',
"Nearly 68% of Australians speak only English at home - how about in Glen Waverley?",
"Try again! Only 40% of households speak English exclusively - what a diverse bunch!");
INSERT INTO question_option (question_id, description, answer) VALUES
(LAST_INSERT_ID(), '40', TRUE),
(LAST_INSERT_ID(), '50', FALSE),
(LAST_INSERT_ID(), '30', FALSE),
(LAST_INSERT_ID(), '20', FALSE)
;
INSERT INTO question (question_type, category, question, end_message) VALUES (
'Multiple Choice',
'Housing',
"RENT BATTLE: Who has it worse?",
"Ah...unfortunately not! Glen Waverly residents pay $462 per week on rent, whereas Clayton residents pay $331 per week on average");
INSERT INTO question_option (question_id, description, answer) VALUES
(LAST_INSERT_ID(), 'Glen Waverley', TRUE),
(LAST_INSERT_ID(), 'Clayton', FALSE)
;
INSERT INTO question (question_type, category, question, end_message) VALUES (
'Multiple Choice',
'Demographic',
"If each of these age groups were armies, which one would be able to overwhelm the others on pure numbers?",
"NAH FAM! Bow to your teenage overlords");
INSERT INTO question_option (question_id, description, answer) VALUES
(LAST_INSERT_ID(), '15-19', TRUE),
(LAST_INSERT_ID(), '45-49', FALSE),
(LAST_INSERT_ID(), '20-24', FALSE),
(LAST_INSERT_ID(), '35-39', FALSE)
;
INSERT INTO question (question_type, category, question, end_message) VALUES (
'Multiple Choice',
'Demographic',
"In Glen Waverley, internet disconnected denizens number in the:",
"Damn! Actually, thousands of disconnected denizens are denied data ");
INSERT INTO question_option (question_id, description, answer) VALUES
(LAST_INSERT_ID(), 'Thousands', TRUE),
(LAST_INSERT_ID(), 'Hundreds', FALSE),
(LAST_INSERT_ID(), 'Tens of thousands', FALSE),
(LAST_INSERT_ID(), 'Tens', FALSE)
;
INSERT INTO question (question_type, category, question, end_message) VALUES (
'Multiple Choice',
'Demographic',
"How many centenarians are there in Glen Waverley?",
"Sorry, game over! Did you not know what a centenarian was? ");
INSERT INTO question_option (question_id, description, answer) VALUES
(LAST_INSERT_ID(), '7', TRUE),
(LAST_INSERT_ID(), '287', FALSE),
(LAST_INSERT_ID(), '7432', FALSE),
(LAST_INSERT_ID(), '1', FALSE)
;
INSERT INTO question (question_type, category, question, end_message) VALUES (
'Multiple Choice',
'Income',
"Negative income is when your investment produces a loss! How many people earn negative income in Glen Waverley?",
"It was actually 200 people. Poor, poor people...");
INSERT INTO question_option (question_id, description, answer) VALUES
(LAST_INSERT_ID(), '200', TRUE),
(LAST_INSERT_ID(), '100', FALSE),
(LAST_INSERT_ID(), '0', FALSE),
(LAST_INSERT_ID(), '2000', FALSE)
;

INSERT INTO question (question_type, category, question, end_message) VALUES (
'Slider',
'Religion',
'How many people in Glen Waverley are seeking Buddhist enlightenment?',
'Unfortunately, you won\'t reach nirvana with that religion!');
INSERT INTO question_option (question_id, answer, description, slider_unit, slider_min, slider_max, slider_threshold) VALUES
(LAST_INSERT_ID(), TRUE, '10', '%', 0, 100, 20);
INSERT INTO leaderboard (tla, score) VALUES ('HAL', 1);
