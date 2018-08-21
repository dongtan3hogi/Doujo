CREATE TABLE job (
    job VARCHAR2(20) PRIMARY KEY
);

insert into job values('학생');

CREATE TABLE member (
    id VARCHAR2(20) PRIMARY KEY,
    password VARCHAR2(20) NOT NULL,
    nickname VARCHAR2(20) NOT NULL,
    name VARCHAR2(20) NOT NULL,
    gender VARCHAR2(10) CHECK (gender in ('male', 'female')),
    age NUMBER NOT NULL,
    job VARCHAR2(100) REFERENCES job(job),
    hobby VARCHAR2(2000),
    height NUMBER,
    weight NUMBER
);

insert into member values('abc123', 'abc123', 'abc123', '도우조', 'male', '30', '학생', null, null, null);
