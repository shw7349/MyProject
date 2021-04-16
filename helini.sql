CREATE TABLE GUESTBOOK
(
GB_NO NUMBER(15,0) PRIMARY KEY
, GB_ID VARCHAR2(15) NOT NULL
, GB_PASS VARCHAR2(15) NOT NULL
, GB_CON VARCHAR2(1000)
, GB_DATE DATE DEFAULT SYSDATE
, READCOUNT NUMBER(5, 0) NOT NULL
, BNUM NUMBER(5, 0) NOT NULL
, LVL NUMBER(5, 0) NOT NULL
, STEP NUMBER(5, 0) NOT NULL
, NREF NUMBER(5, 0) NOT NULL
);

CREATE TABLE notice (
    articleNO     NUMBER(10)    PRIMARY KEY
  , parentNO      NUMBER(10)    DEFAULT 0
  , title         VARCHAR2(300) NOT NULL
  , content       VARCHAR2(3000)
  , imageFileName VARCHAR2(30)
  , writeDate     DATE          DEFAULT SYSDATE NOT NULL
  , id            VARCHAR2(10)
  , notice_yn     VARCHAR2(1)
  , CONSTRAINTS FK_ID FOREIGN KEY (id) REFERENCES member(id)
);