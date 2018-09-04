CREATE TABLE health_Food (
    NUTR_CONT3 number,
    NUTR_CONT2 number,
    NUTR_CONT1 number,
    BGN_YEAR number,
    NUTR_CONT9 number,
    NUTR_CONT8 number,
    FOOD_CD number,
    NUTR_CONT7 number,
    NUTR_CONT6 number,
    NUTR_CONT5 number,
    NUTR_CONT4 number,
    DESC_KOR VARCHAR2(100),
    SERVING_WT number,
    FDGRP_NM VARCHAR2(100),
    NUM number primary key,
    ANIMAL_PLANT VARCHAR2(20)
);

CREATE table health_Eatfood(
    id VARCHAR2(20) not null
    , EATNUM NUMBER primary key
    , DESC_KOR VARCHAR2(100)
    , COUNTDAY DATE
    , SERVING_WT NUMBER
    , NUTR_CONT1 NUMBER
    , NUTR_CONT2 NUMBER
    , NUTR_CONT3 NUMBER
    , NUTR_CONT4 NUMBER
    , NUTR_CONT5 NUMBER
    , NUTR_CONT6 NUMBER
    , NUTR_CONT7 NUMBER
    , NUTR_CONT8 NUMBER
    , NUTR_CONT9 NUMBER
);

CREATE sequence health_Eatseq;

CREATE table health_Mynut(
    id VARCHAR2(20) not null
    , COUNTDAY DATE
    , kacl NUMBER	
    , carbo NUMBER	
    , protein NUMBER	
    , fat NUMBER	
    , sugar NUMBER	
    , sodium NUMBER	
    , cholesterol NUMBER	
    , fatty NUMBER	
    , transfat NUMBER	
);

CREATE table health_Activity(
    actseq number primary key
    , id VARCHAR2(20) not null
    , COUNTDAY date
    , act varchar2(100)
    , kacl NUMBER
);

create sequence health_actseq;