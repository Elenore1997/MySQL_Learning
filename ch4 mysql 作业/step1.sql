CREATE TABLE `department` (	-- 先建立department的表，因为它要当做 student表的参照
  `dept_name` varchar(45) NOT NULL,
  `building` varchar(45) DEFAULT NULL,
  `budget` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `student` (
  `ID` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `age` int(10) unsigned DEFAULT NULL,
  `emotion_state` varchar(45) DEFAULT NULL,
  `dept_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_student_1_idx` (`dept_name`),	-- dept_name作为外键，参照的是department里面的dept_name
  CONSTRAINT `fk_student_1` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `exam` (
  `student_ID` int(11) NOT NULL,
  `exam_Name` varchar(45) NOT NULL,
  `grade` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`student_ID`,`exam_Name`),-- 主键为student_ID和exam_Name，ID是外键，参照的表是student
  CONSTRAINT `fk_exam_1` FOREIGN KEY (`student_ID`) REFERENCES `student` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

