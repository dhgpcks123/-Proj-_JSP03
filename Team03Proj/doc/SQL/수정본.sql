--�Ҽ��� �Է��� ���� NUMBER(10) -> NUMBER�� �����Ѵ�
ALTER TABLE userlocation
MODIFY uy NUMBER;

ALTER TABLE userlocation
MODIFY ux NUMBER;


ALTER TABLE areainfo
MODIFY ay NUMBER;

ALTER TABLE areainfo
MODIFY ax NUMBER;


-- ������ ǥ���ϱ� ���� ��ǥ�� x, y�� �����Ѵ�
UPDATE AREAINFO
SET ax= 33.42437961506556, ay=126.93110026765497
WHERE ano=1;

UPDATE AREAINFO
SET ax=33.375636521547264, ay= 126.5685862198309
WHERE ano=2;

UPDATE AREAINFO
SET ax=33.1727671789905 , ay= 126.27293207589577
WHERE ano=3;

UPDATE AREAINFO
SET ax=33.199804357744014, ay=126.29243666800144
WHERE ano=4;

UPDATE AREAINFO
SET ax=33.47555396363046, ay= 126.41899092409558
WHERE ano=5;

UPDATE AREAINFO
SET ax=33.54252580986714, ay=126.66618655416492
WHERE ano=6;

UPDATE AREAINFO
SET ax=33.24462498540053, ay=126.40604683881358
WHERE ano=7;

UPDATE AREAINFO
SET ax=33.46164828897533, ay=126.9346003676563
WHERE ano=8;

UPDATE AREAINFO
SET ax=33.23574587023389, ay=126.36351258114277
WHERE ano=9;

UPDATE AREAINFO
SET ax=33.250525250847936, ay=126.42445768114317
WHERE ano=10;

UPDATE AREAINFO
SET ax=33.51307971275873, ay=126.52142654066962
WHERE ano=11;

UPDATE AREAINFO
SET ax=33.251745497098426, ay=126.42565332716656
WHERE ano=12;

UPDATE AREAINFO
SET ax=33.518037668945176, ay=126.52284210749815
WHERE ano=13;

UPDATE AREAINFO
SET ax=33.49019207658534, ay=126.48501679464566
WHERE ano=14;

UPDATE AREAINFO
SET ax=33.255174417839335, ay=126.56479441182559
WHERE ano=15;

UPDATE AREAINFO
SET ax=33.46714133094259, ay=126.5457129811507
WHERE ano=16;


-- review ���̺� ano �� ���� (������̺� �ִ� �������� ���� �ۼ� �����Ͽ� ��ҹ�ȣ�� ���ְ�, rx ,ry �߰��ؾ� ��)
-- ���� review�� ����� �� �� ��� mno �߰�
DROP TABLE rphoto;
DROP TABLE review;
-- �����������̺�

create table review (
    rno NUMBER(10) -- �۹�ȣ
        CONSTRAINT REVIEW_RNO_PK PRIMARY KEY,
    mno NUMBER(10) -- ȸ����ȣ
        CONSTRAINT REVIEW_MNO_FK REFERENCES member(mno)
        CONSTRAINT REVIEW_MNO_NN NOT NULL,
    rtitle VARCHAR2(50 CHAR)
        CONSTRAINT REVIEW_TITLE_NN NOT NULL,   -- �� ����
    rbody VARCHAR2(500 CHAR)
        CONSTRAINT REVIEW_BODY_NN NOT NULL, -- �� ����
    rpno NUMBER(10)
        CONSTRAINT REVIEW_RPNO_UK UNIQUE
        CONSTRAINT REVIEW_RPNO_NN NOT NULL, -- ���ε� ����
    rdate DATE  DEFAULT sysdate
        CONSTRAINT REVIEW_RDATE_NN NOT NULL,
    rgrade NUMBER
        CONSTRAINT REVIEW_GRADE_NN NOT NULL
        CONSTRAINT REVIEW_GRADE_CK CHECK ( rgrade IN (0, 0.5 , 1 , 1.5 , 2 , 2.5 , 3 , 3.5 , 4 , 4.5 , 5)), -- ��� ����
    rhit NUMBER(10) DEFAULT 0
        CONSTRAINT REVIEW_HIT_NN NOT NULL,
    isshow CHAR(1) DEFAULT 'Y'
        CONSTRAINT REVIEW_ISSHOW_NN NOT NULL,
    rx NUMBER
        CONSTRAINT REVIEW_RX_NN NOT NULL,
    ry NUMBER
        CONSTRAINT REVIEW_RY_NN NOT NULL
);


INSERT INTO
    review
VALUES(
    (SELECT NVL(MAX(rno)+1,1) FROM review),1002,'��� ���� �ٳ�Ծ��~','������ �ƴ϶� ���� ���ƿ�. �׷��� �ʹ� �Ƹ��ٿ��� ���� �͵� �ؾ���ϴ�.',
    (SELECT NVL(MAX(rpno)+1,1) FROM review),'2020/10/31',5,50,'Y',33.375636521547264,126.5685862198309
);

INSERT INTO
    review
VALUES(
    (SELECT NVL(MAX(rno)+1,1) FROM review),1003,'û������ ���� �ֳ׿�','û����, ��ä��, �ĵ��� ��ȭ �ְ�!!',
    (SELECT NVL(MAX(rpno)+1,1) FROM review),'2020/10/31',5,30,'Y' , 33.1727671789905 ,  126.27293207589577
);

INSERT INTO
    review
VALUES(
    (SELECT NVL(MAX(rno)+1,1) FROM review),1007,'�����ȣ�� �ٳ�Ծ��~','��� ���� ������ �� ��γ׿�.. �׷��� ���� �߾��� �Ǿ� �ູ�մϴ�. ',
    (SELECT NVL(MAX(rpno)+1,1) FROM review),'2020/08/01',4,20,'Y', 33.24462498540053, 126.40604683881358
);

INSERT INTO
    review
VALUES(
    (SELECT NVL(MAX(rno)+1,1) FROM review),1009,'�λ����� ��Ʒ� ��������','�񸰰��� �Ⱦ��ϴµ� ���������� �����߳׿�. ',
    (SELECT NVL(MAX(rpno)+1,1) FROM review),'2019/05/01',5,65,'Y', 33.23574587023389, 126.36351258114277
);

INSERT INTO
    review
VALUES(
    (SELECT NVL(MAX(rno)+1,1) FROM review),1010,'TV�� ���� ������ ���ٴ�','���� ���ƿ��� �濡 �������� ����, �Ǹ԰� �ͳ׿� ',
    (SELECT NVL(MAX(rpno)+1,1) FROM review),'2018/07/01',4.5,34,'Y' , 33.250525250847936, 126.42445768114317
);

INSERT INTO
    review
VALUES(
    (SELECT NVL(MAX(rno)+1,1) FROM review),1001,'���� �� ġ�� �ı�','������ ���µ� ġ�ư� �ʹ� ���ļ� ġ�� �ٳ�Ծ��. 
    ���п� ���� ��������� ',
    (SELECT NVL(MAX(rpno)+1,1) FROM review),'2017/07/01',3.5,25,'Y', 33.251745497098426, 126.42565332716656
);

INSERT INTO
    review
VALUES(
    (SELECT NVL(MAX(rno)+1,1) FROM review),1002,'���ǿ��� �ٳ�Խ��ϴ�. ','������ ��ģ���ؼ� �������� ���� ���� �ʽ��ϴ�. ',
    (SELECT NVL(MAX(rpno)+1,1) FROM review),'2018/06/11',3,15,'Y' , 33.518037668945176, 126.52284210749815
);

INSERT INTO
    review
VALUES(
    (SELECT NVL(MAX(rno)+1,1) FROM review),1004,'�״� ��Ƴ���� ','�㿡 ���ϰ� ü�ϴ� �ٶ��� 
    ���� ���� ���ϴٰ� ���޽��� �ٳ�Խ��ϴ�. ',
    (SELECT NVL(MAX(rpno)+1,1) FROM review),'2019/11/11',4,53,'Y', 33.255174417839335, 126.56479441182559
);



-- ����������̺�
CREATE TABLE rphoto(
    rpno NUMBER(10)
        CONSTRAINT RPHOTO_RPNO_FK REFERENCES review(rpno)
        CONSTRAINT RPHOTO_RPNO_NN NOT NULL,
    rponame VARCHAR2(100 CHAR) DEFAULT 'noimage.jpg'
        CONSTRAINT RPHOTO_ONAME_NN NOT NULL,
    rpsname VARCHAR2(100 CHAR) DEFAULT 'noimage.jpg'
        CONSTRAINT RPHOTO_SNAME_NN NOT NULL,
    rpsize NUMBER(10) DEFAULT 200*100
        CONSTRAINT RPHOTO_SIZE_NN NOT NULL,
    rpdir VARCHAR2(100 CHAR) DEFAULT '/img/review'
        CONSTRAINT RPHOTO_DIR_NN NOT NULL,
    rtno NUMBER(10)
        CONSTRAINT RPHOTO_RTNO_FK REFERENCES areatype(atno)
        CONSTRAINT RPHOTO_RTNO_NN NOT NULL
        CONSTRAINT RPHOTO_RTNO_CK CHECK (rtno IN (10,20,30,40,50))
);

INSERT INTO
    rphoto
VALUES(
    1,'noimage.jpg','������1.jpg',200*100,'img/review/',10
);

INSERT INTO
    rphoto
VALUES(
    1,'noimage.jpg','������3.jpg',200*100,'img/review/',10
);

INSERT INTO
    rphoto
VALUES(
    2,'noimage.jpg','���ĵ�3.jpg',200*100,'img/review/',10
);

INSERT INTO
    rphoto
VALUES(
    2,'noimage.jpg','���ĵ�4.jpg',200*100,'img/review/',10
);

INSERT INTO
    rphoto
VALUES(
    3,'noimage.jpg','�����ȣ��.jpg',200*100,'img/review/',20
);

INSERT INTO
    rphoto
VALUES(
    4,'noimage.jpg','��Ʒ���������2.jpg',200*100,'img/review/',30
);

INSERT INTO
    rphoto
VALUES(
    5,'noimage.jpg','�Ѷ󱹼�2.jpg',200*100,'img/review/',30
);

INSERT INTO
    rphoto
VALUES(
    6,'noimage.jpg','ġ���ı�.jpg',200*100,'img/review/',40
);

INSERT INTO
    rphoto
VALUES(
    7,'noimage.jpg','���ǿ�.jpg',200*100,'img/review/',40
);

INSERT INTO
    rphoto
VALUES(
    8,'noimage.jpg','noimage.jpg',200*100,'img/review/',50
);



commit;


SELECT * FROM member;
SELECT * FROM grade;
SELECT * FROM userlocation;
SELECT * FROM disease;
SELECT * FROM userdisease;
SELECT * FROM areatype;
SELECT * FROM areainfo;
SELECT * FROM aphoto;
SELECT * FROM review;
SELECT * FROM rphoto;