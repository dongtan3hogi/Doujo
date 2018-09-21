create table work_word(
 id varchar2(20) references member(id),
 keyword varchar2(20) not null,
 searchDate varchar2(20) default to_char(sysdate, 'YYYY-MM-DD')
);

create table work_memo(
    id varchar2(20) references member(id),
    memo varchar2(2000),
    startdate varchar2(20) default to_char(sysdate, 'YYYY-MM-DD'),
    enddate varchar2(20) not null
);
    
create table work_favorites(
id varchar2(20) references member(id),
title varchar2(200) not null,
locations varchar2(1000)
);