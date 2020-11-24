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
    1,'test01.jpg','������3.jpg',200*100,'img/review/',10
);

INSERT INTO
    rphoto
VALUES(
    2,'test02.jpg','���ĵ�3.jpg',200*100,'img/review/',10
);

INSERT INTO
    rphoto
VALUES(
    2,'test03.jpg','���ĵ�4.jpg',200*100,'img/review/',10
);

INSERT INTO
    rphoto
VALUES(
    3,'test04.jpg','�����ȣ��.jpg',200*100,'img/review/',20
);

INSERT INTO
    rphoto
VALUES(
    3,'test10.jpg','�����ȣ��.jpg',200*100,'img/review/',20
);

INSERT INTO
    rphoto
VALUES(
    4,'test05.jpg','��Ʒ���������2.jpg',200*100,'img/review/',30
);

INSERT INTO
    rphoto
VALUES(
    4,'test11.jpg','��Ʒ���������2.jpg',200*100,'img/review/',30
);
INSERT INTO
    rphoto
VALUES(
    4,'test12.jpg','��Ʒ���������2.jpg',200*100,'img/review/',30
);

INSERT INTO
    rphoto
VALUES(
    4,'test13.jpg','��Ʒ���������2.jpg',200*100,'img/review/',30
);

INSERT INTO
    rphoto
VALUES(
    5,'test06.jpg','�Ѷ󱹼�2.jpg',200*100,'img/review/',30
);
INSERT INTO
    rphoto
VALUES(
    5,'test12.jpg','�Ѷ󱹼�2.jpg',200*100,'img/review/',30
);

INSERT INTO
    rphoto
VALUES(
    6,'test07.jpg','ġ���ı�.jpg',200*100,'img/review/',40
);
INSERT INTO
    rphoto
VALUES(
    6,'test13.jpg','ġ���ı�.jpg',200*100,'img/review/',40
);

INSERT INTO
    rphoto
VALUES(
    7,'test08.jpg','���ǿ�.jpg',200*100,'img/review/',40
);

INSERT INTO
    rphoto
VALUES(
    7,'test14.jpg','���ǿ�.jpg',200*100,'img/review/',40
);

INSERT INTO
    rphoto
VALUES(
    8,'test09.jpg','noimage.jpg',200*100,'img/review/',50
);
INSERT INTO
    rphoto
VALUES(
    8,'test15.jpg','noimage.jpg',200*100,'img/review/',50
);


--APHOTO ���� ������Ʈ

UPDATE aphoto
SET aponame='test01.jpg'
WHERE apsname='��������1.jpg';

UPDATE aphoto
SET aponame='test02.jpg'
WHERE apsname='��������2.jpg';

UPDATE aphoto
SET aponame='test03.jpg'
WHERE apsname='������1.jpg';

UPDATE aphoto
SET aponame='test04.jpg'
WHERE apsname='������2.jpg';

UPDATE aphoto
SET aponame='test05.jpg'
WHERE apsname='���ĵ�1.jpg';

UPDATE aphoto
SET aponame='test06.jpg'
WHERE apsname='���ĵ�4.jpg';

UPDATE aphoto
SET aponame='test07.jpg'
WHERE apsname='�۾ǻ�1.jpg';

UPDATE aphoto
SET aponame='test08.jpg'
WHERE apsname='�۾ǻ�2.jpg';

UPDATE aphoto
SET aponame='test09.jpg'
WHERE apsname='������ȣ��.jpg';


UPDATE aphoto
SET aponame='test10.jpg'
WHERE apsname='��ž������ȣ��.jpg';

UPDATE aphoto
SET aponame='test11.jpg'
WHERE apsname='�����ȣ��.jpg';

UPDATE aphoto
SET aponame='test12.jpg'
WHERE apsname='�����ž.jpg';

UPDATE aphoto
SET aponame='test13.jpg'
WHERE apsname='��Ʒ� ��������.jpg';

UPDATE aphoto
SET aponame='test14.jpg'
WHERE apsname='�����Ѷ󱹼�1.jpg';

UPDATE aphoto
SET aponame='test15.jpg'
WHERE apsname='�����Ѷ󱹼�2.jpg';

UPDATE aphoto
SET aponame='test16.jpg'
WHERE apsname='���;系��.jpg';

UPDATE aphoto
SET aponame='test17.jpg'
WHERE apsname='��ġ���ǿ�.jpg';

UPDATE aphoto
SET aponame='test18.jpg'
WHERE apsname='�ٳ����ǿ�.jpg';

UPDATE aphoto
SET aponame='test19.jpg'
WHERE apsname='�����Ѷ󺴿� ���޽�.jpg';

UPDATE aphoto
SET aponame='test20.jpg'
WHERE apsname='�������Ƿ�� ���޽�.jpg';

UPDATE aphoto
SET aponame='test01.jpg'
WHERE apsname='���ִ��б����� ���޽�.jpg';


INSERT INTO aphoto
VALUES(4, 'test02.jpg', '�۾ǻ�3.jpg', 20000, '/img/area/','10')
;

INSERT INTO aphoto
VALUES(5, 'test20.jpg', '������.jpg', 20000, '/img/area/','20')
;

INSERT INTO aphoto
VALUES(6, 'test19.jpg', '����.jpg', 20000, '/img/area/','20')
;

INSERT INTO aphoto
VALUES(7, 'test18.jpg', '����2.jpg', 20000, '/img/area/','20')
;

INSERT INTO aphoto
VALUES(8, 'test17.jpg', '����3.jpg', 20000, '/img/area/','30')
;

INSERT INTO aphoto
VALUES(9, 'test16.jpg', '����1.jpg', 20000, '/img/area/','30')
;
INSERT INTO aphoto
VALUES(9, 'test17.jpg', '����1.jpg', 20000, '/img/area/','30')
;
INSERT INTO aphoto
VALUES(9, 'test18.jpg', '����1.jpg', 20000, '/img/area/','30')
;
INSERT INTO aphoto
VALUES(9, 'test19.jpg', '����1.jpg', 20000, '/img/area/','30')
;

INSERT INTO aphoto
VALUES(11, 'test01.jpg', '����2.jpg', 20000, '/img/area/','40')
;
INSERT INTO aphoto
VALUES(12, 'test02.jpg', '����3.jpg', 20000, '/img/area/','40')
;
INSERT INTO aphoto
VALUES(12, 'test07.jpg', '����3.jpg', 20000, '/img/area/','40')
;
INSERT INTO aphoto
VALUES(13, 'test03.jpg', '����4.jpg', 20000, '/img/area/','40')
;
INSERT INTO aphoto
VALUES(14, 'test04.jpg', '����53.jpg', 20000, '/img/area/','50')
;
INSERT INTO aphoto
VALUES(15, 'test05.jpg', '����6.jpg', 20000, '/img/area/','50')
;
INSERT INTO aphoto
VALUES(15, 'test06.jpg', '����7.jpg', 20000, '/img/area/','50')
;
INSERT INTO aphoto
VALUES(15, 'test07.jpg', '����8.jpg', 20000, '/img/area/','50')
;


INSERT INTO review
VALUES(
    9, 1004, '��Ʒ� ��', '�����̶� ���ֵ� ��� �迡 �԰� �Դµ� �� ������. ������ ������. �����ؾ��ؼ� ���ִ� �� ���̴µ� �� �������� ���� �� ����;;',
    9, sysdate, 4, 15, 'Y', 33.23574587023389,126.36351258114277
);
INSERT INTO rphoto
VALUES(
    9, 'test01.jpg', 'test01.jpg', 20000, 'img/review/', 30
);
INSERT INTO rphoto
VALUES(
    9, 'test02.jpg', 'test01.jpg', 20000, 'img/review/', 30
);
INSERT INTO rphoto
VALUES(
    9, 'test03.jpg', 'test01.jpg', 20000, 'img/review/', 30
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