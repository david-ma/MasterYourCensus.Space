DROP TABLE leaderboard;
CREATE TABLE leaderboard (
  name VARCHAR(255) NOT NULL,
  school VARCHAR(255) NOT NULL,
  score int unsigned,
  created_on timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (name, school),
  KEY id (name, school)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO leaderboard (name, school, score) VALUES ("Bobby Clark", "Fitzroy High School", "15");
INSERT INTO leaderboard (name, school, score) VALUES ("Debra Wright", "Kilvington Baptist Girls' Grammar School", "14");
INSERT INTO leaderboard (name, school, score) VALUES ("Patrick Mitchell", "Mount Eliza Secondary College", "13");
INSERT INTO leaderboard (name, school, score) VALUES ("Jerry Jenkins", "Donvale Christian College", "9");
INSERT INTO leaderboard (name, school, score) VALUES ("Joyce Roberts", "Kew High School", "7");
INSERT INTO leaderboard (name, school, score) VALUES ("John Davis", "Peter Lalor Secondary College", "5");
INSERT INTO leaderboard (name, school, score) VALUES ("Philip Patterson", "Heathmont College", "5");
INSERT INTO leaderboard (name, school, score) VALUES ("Albert Flores", "Donvale Christian College", "5");
INSERT INTO leaderboard (name, school, score) VALUES ("Earl Gonzales", "Albert Park College", "5");
INSERT INTO leaderboard (name, school, score) VALUES ("Jane Cook", "Kilvington Baptist Girls' Grammar School", "4");
INSERT INTO leaderboard (name, school, score) VALUES ("Carolyn Smith", "Eltham High School", "4");
INSERT INTO leaderboard (name, school, score) VALUES ("Eric Bennett", "Braybrook College", "3");
INSERT INTO leaderboard (name, school, score) VALUES ("Chris Adams", "Brighton Grammar School", "3");
INSERT INTO leaderboard (name, school, score) VALUES ("Willie Turner", "Balwyn High School", "2");
INSERT INTO leaderboard (name, school, score) VALUES ("Rebecca Phillips", "Balwyn High School", "2");
INSERT INTO leaderboard (name, school, score) VALUES ("Mark Perez", "Eltham College of Education", "2");
INSERT INTO leaderboard (name, school, score) VALUES ("Phyllis Butler", "Frankston High School", "2");
INSERT INTO leaderboard (name, school, score) VALUES ("Ann Hill", "Heatherhill Secondary College", "2");
INSERT INTO leaderboard (name, school, score) VALUES ("Katherine Gray", "Ivanhoe Girls' Grammar School", "1");
INSERT INTO leaderboard (name, school, score) VALUES ("Lois Scott", "John Monash Science School", "1");
