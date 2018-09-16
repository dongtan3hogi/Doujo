-- CREATE ]==============================================================================
CREATE TABLE quiz(
    quizseq number PRIMARY KEY,
	type VARCHAR2(20) CHECK(type in('multiplechoice','shortanswer')),
	question VARCHAR2(1000) NOT NULL,
    answer1 VARCHAR2(200) NOT NULL,
   	answer2 VARCHAR2(200),
    answer3 VARCHAR2(200),
    answer4 VARCHAR2(200),
	answernumber NUMBER,
    id VARCHAR2(20) REFERENCES member(id)
);

CREATE TABLE quizrecordlist(
	quizrecordcode VARCHAR2(50) PRIMARY KEY,
    id VARCHAR2(20) REFERENCES member(id),
	quizrecordname VARCHAR2(30) NOT NULL
);

CREATE TABLE quizrecord(
	quizrecordcode VARCHAR2(50) REFERENCES quizrecordlist(quizrecordcode),
	quizseq NUMBER REFERENCES quiz(quizseq),
	correctcount NUMBER DEFAULT 0,
	wrongcount NUMBER DEFAULT 0
);


CREATE TABLE groups(
    groupname VARCHAR2(20) NOT NULL,
    groupseq NUMBER PRIMARY KEY,
    groupleader VARCHAR2(20) REFERENCES member(id),
    groupteg VARCHAR2(200),
    groupsecret VARCHAR2(20) check(groupsecret in ('public','private')),
    groupalert VARCHAR2(200)
);

CREATE TABLE groupmember(
    groupseq NUMBER REFERENCES groups(groupseq),
    id VARCHAR2(20) REFERENCES member(id)
);

CREATE SEQUENCE quizseq;
CREATE SEQUENCE groupseq;


insert into member(id, password, name, nickname, gender, age, job)
values('karulin', '1111', 'karulin', 'karulin', 'male', 20, 'student');
commit;


