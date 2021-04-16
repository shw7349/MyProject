-- TABLE member
CREATE TABLE member (
   id VARCHAR2(20) PRIMARY KEY
 , pwd VARCHAR2(20) NOT NULL
 , nickname VARCHAR2(50) NOT NULL UNIQUE
 , email VARCHAR2(50) NOT NULL UNIQUE
 , joindate DATE DEFAULT SYSDATE
);

-- TABLE notice
DROP TABLE notice CASCADE CONSTRAINTS;

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