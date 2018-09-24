         
CREATE TABLE friend (
     userid       VARCHAR2(20),
     friendid     VARCHAR2(20),
     nickname     VARCHAR2(20),
     name         VARCHAR2(20),
     gender       VARCHAR2(10) CHECK (gender in ('male', 'female')),
     age          NUMBER,
     job          VARCHAR2(100),
     hobby        VARCHAR2(2000),
     type         NUMBER
);

create table board(
	 id VARCHAR2(20) not null,
	 title VARCHAR2(200) not null,
	 content VARCHAR2(2000) not null,
	 location VARCHAR2(100) not null,
	 originalfile VARCHAR2(200),
	 savedfile VARCHAR2(200),
	 happiness number,
	 sadness number,
	 surprise number,
	 neutral number
);

create sequence friend_seq;

