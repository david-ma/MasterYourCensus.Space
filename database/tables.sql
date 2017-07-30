DROP TABLE IF EXISTS question_option;
DROP TABLE IF EXISTS question;
CREATE TABLE question (
  id bigint(20) NOT NULL AUTO_INCREMENT,
  question_type TEXT NOT NULL,
  category TEXT NOT NULL,
  question TEXT NOT NULL,
  end_message TEXT NOT NULL,
  created_on timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  KEY id (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE question_option (
  id bigint(20) NOT NULL AUTO_INCREMENT,
  question_id bigint(20) NOT NULL,
  description TEXT NOT NULL,
  answer BOOL NOT NULL DEFAULT FALSE,
  slider_unit VARCHAR(255),
  slider_min int unsigned,
  slider_max int unsigned,
  slider_threshold int unsigned,
  FOREIGN KEY (question_id)
    REFERENCES question (id),
  PRIMARY KEY (id),
  KEY id (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE question_response (
  id bigint(20) NOT NULL AUTO_INCREMENT,
  question_id bigint(20) NOT NULL,
  correct BOOL NOT NULL DEFAULT FALSE,
  answer TEXT NOT NULL,
  FOREIGN KEY (question_id)
    REFERENCES question (id),
  PRIMARY KEY (id),
  KEY id (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE leaderboard (
  id bigint(20) NOT NULL AUTO_INCREMENT,
  tla char(3) NOT NULL,
  score int unsigned,
  created_on timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  KEY id (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
