DROP TABLE leaderboard;
CREATE TABLE leaderboard (
  email VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL,
  school VARCHAR(255) NOT NULL,
  score int unsigned,
  created_on timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (email),
  KEY id (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO leaderboard (name, school, score, email) VALUES ("Bobby Clark","Fitzroy High School","15","cherriesstudent@gmail.com");
INSERT INTO leaderboard (name, school, score, email) VALUES ("Debra Wright","Kilvington Baptist Girls' Grammar School","14","hospitalstudent@gmail.com");
INSERT INTO leaderboard (name, school, score, email) VALUES ("Patrick Mitchell","Mount Eliza Secondary College","13","studenthungarian@gmail.com");
INSERT INTO leaderboard (name, school, score, email) VALUES ("Jerry Jenkins","Donvale Christian College","9","pumpkinsstudent@gmail.com");
INSERT INTO leaderboard (name, school, score, email) VALUES ("Joyce Roberts","Kew High School","7","studentsenses@gmail.com");
INSERT INTO leaderboard (name, school, score, email) VALUES ("John Davis","Peter Lalor Secondary College","5","studentcatered@gmail.com");
INSERT INTO leaderboard (name, school, score, email) VALUES ("Philip Patterson","Heathmont College","5","snowboardstudent@gmail.com");
INSERT INTO leaderboard (name, school, score, email) VALUES ("Albert Flores","Donvale Christian College","5","precipitatestudent@gmail.com");
INSERT INTO leaderboard (name, school, score, email) VALUES ("Earl Gonzales","Albert Park College","5","studentchunder@gmail.com");
INSERT INTO leaderboard (name, school, score, email) VALUES ("Jane Cook","Kilvington Baptist Girls' Grammar School","4","studentslimy@gmail.com");
INSERT INTO leaderboard (name, school, score, email) VALUES ("Carolyn Smith","Eltham High School","4","studentgaia@gmail.com");
INSERT INTO leaderboard (name, school, score, email) VALUES ("Eric Bennett","Braybrook College","3","lepestudent@gmail.com");
INSERT INTO leaderboard (name, school, score, email) VALUES ("Chris Adams","Brighton Grammar School","3","studentdistinct@gmail.com");
INSERT INTO leaderboard (name, school, score, email) VALUES ("Willie Turner","Balwyn High School","2","roosterstudent@gmail.com");
INSERT INTO leaderboard (name, school, score, email) VALUES ("Rebecca Phillips","Balwyn High School","2","studenthematoma@gmail.com");
INSERT INTO leaderboard (name, school, score, email) VALUES ("Mark Perez","Eltham College of Education","2","studentanthropic@gmail.com");
INSERT INTO leaderboard (name, school, score, email) VALUES ("Phyllis Butler","Frankston High School","2","studentunsure@gmail.com");
INSERT INTO leaderboard (name, school, score, email) VALUES ("Ann Hill","Heatherhill Secondary College","2","nurturedcat@gmail.com");
INSERT INTO leaderboard (name, school, score, email) VALUES ("Katherine Gray","Ivanhoe Girls' Grammar School","1","cateyes@gmail.com");
INSERT INTO leaderboard (name, school, score, email) VALUES ("Lois Scott","John Monash Science School","1","catgreat@gmail.com");
