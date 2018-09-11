         
CREATE TABLE friend (
     userid       VARCHAR2(20),
     friendid     VARCHAR2(20) constraints fk_member references member(id),
     nickname     VARCHAR2(20),
     name         VARCHAR2(20),
     gender       VARCHAR2(10) CHECK (gender in ('male', 'female')),
     age          NUMBER,
     job          VARCHAR2(100),
     hobby        VARCHAR2(2000),
     type         NUMBER
);

create sequence friend_seq;

insert into friend values('1', 'abc123', 'abc123', '도우조', 'male', '30', '학생', '수영);

create sequence friend_seq;