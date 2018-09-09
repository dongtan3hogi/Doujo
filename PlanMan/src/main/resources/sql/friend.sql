CREATE TABLE friend (
         friendnum    number  primary key,
         id                 VARCHAR2(20) NOT NULL,
         nickname    VARCHAR2(20) NOT NULL,
         name           VARCHAR2(20) NOT NULL,
         gender         VARCHAR2(10) CHECK (gender in ('male', 'female')),
         age              NUMBER NOT NULL,
         job               VARCHAR2(100) NOT NULL,
         hobby          VARCHAR2(2000)
);
         
insert into friend values('1', 'abc123', 'abc123', '도우조', 'male', '30', '학생', '수영);

create sequence friend_seq;