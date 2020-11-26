-- system ���� (sj > ���ϴ� �������� ����)
CREATE USER sj identified by hello;
grant create session to sj;
grant create table to sj;
alter user sj default tablespace users quota unlimited on users;


-- ����� ���� sj 
-- ȸ���������̺�
create table member(
    mno NUMBER(10)
        CONSTRAINT MB_MNO_PK PRIMARY KEY,
    id VARCHAR2(30 CHAR)
        CONSTRAINT MB_ID_UK UNIQUE
        CONSTRAINT MB_ID_NN NOT NULL,
    mname VARCHAR2(30 CHAR)
        CONSTRAINT MB_MNAME_NN NOT NULL,
    pw VARCHAR2(20 CHAR)
        CONSTRAINT MB_PW_NN NOT NULL,
    mail VARCHAR2(50 CHAR)
        CONSTRAINT MB_MAIL_UK UNIQUE
        CONSTRAINT MB_MAIL_NN NOT NULL,
    tel VARCHAR2(13)
        CONSTRAINT MB_TEL_UK UNIQUE
        CONSTRAINT MB_TEL_NN NOT NULL,
    joindate DATE DEFAULT sysdate
        CONSTRAINT MB_JDATE_NN NOT NULL,
    gen CHAR(1)
        CONSTRAINT MB_GEN_NN NOT NULL
        CONSTRAINT MB_GEN_CK CHECK (gen IN ('M','F')),
    isshow CHAR(1) DEFAULT 'Y'
        CONSTRAINT MB_ISSHOW_NN NOT NULL
        CONSTRAINT MB_ISSHOW_CK CHECK (isshow IN ('Y', 'N')),
    blood1 VARCHAR2(3 CHAR) 
        CONSTRAINT MB_BLOOD1_NN NOT NULL
        CONSTRAINT MB_BLOOD1_CK CHECK (blood1 IN ('A','B','AB','O')),
    blood2 VARCHAR2(3 CHAR) 
        CONSTRAINT MB_BLOOD2_NN NOT NULL
        CONSTRAINT MB_BLOOD2_CK CHECK (blood2 IN ('RH+','RH-')),
    birth DATE 
        CONSTRAINT MB_BIRTH_NN NOT NULL,
    sos VARCHAR2(13 CHAR)
        CONSTRAINT MB_SOS_NN NOT NULL
);




INSERT INTO member
VALUES(
    (SELECT NVL(MAX(mno)+1,1001) FROM member),
    'jang','�����','12345','jang@increpas.com','010-1234-5677',sysdate,'F','Y','B','RH+','92/11/02','010-1234-5678'
);

INSERT INTO member
VALUES(
    (SELECT NVL(MAX(mno)+1,1001) FROM member),
    'chan','������','12345','chan@increpas.com','010-1111-1111',sysdate,'M','Y','A','RH+','93/01/02','010-1111-1118'
);

INSERT INTO member
VALUES(
    (SELECT NVL(MAX(mno)+1,1001) FROM member),
    'wook','������','12345','wook@increpas.com','010-2222-2222',sysdate,'M','Y','O','RH+','92/08/02','010-2222-2228'
);

INSERT INTO member
VALUES(
    (SELECT NVL(MAX(mno)+1,1001) FROM member),
    'joseph','�����','12345','joseph@increpas.com','010-3333-3333',sysdate,'M','Y','O','RH+','88/07/02','010-3333-3338'
);

INSERT INTO member
VALUES(
    (SELECT NVL(MAX(mno)+1,1001) FROM member),
    'jiwoo','������','12345','jiwoo@increpas.com','010-4444-4444',sysdate,'M','Y','A','RH+','95/05/12','010-4444-4448'
);

INSERT INTO member
VALUES(
    (SELECT NVL(MAX(mno)+1,1001) FROM member),
    'jjang','�强ȯ','12345','jjang@increpas.com','010-5555-5555',sysdate,'M','Y','AB','RH+','97/05/12','010-5555-5558'
);

INSERT INTO member
VALUES(
    (SELECT NVL(MAX(mno)+1,1001) FROM member),
    'sun','�ǿ���','12345','sun@increpas.com','010-6666-6666',sysdate,'F','Y','B','RH+','99/05/12','010-6666-6668'
);


INSERT INTO member
VALUES(
    (SELECT NVL(MAX(mno)+1,1001) FROM member),
    'joo','���ֿ�','12345','joo@increpas.com','010-7777-7777',sysdate,'F','Y','B','RH+','97/05/12','010-7777-7778'
);


INSERT INTO member
VALUES(
    (SELECT NVL(MAX(mno)+1,1001) FROM member),
    'hong','ȫ�浿','12345','hong@increpas.com','010-8888-8888',sysdate,'M','Y','AB','RH-','90/06/12','010-8888-8880'
);

INSERT INTO member
VALUES(
    (SELECT NVL(MAX(mno)+1,1001) FROM member),
    'tess','�׽���','12345','tess@increpas.com','010-9999-9999',sysdate,'M','Y','AB','RH-','30/06/12','010-9999-9990'
);

SELECT * FROM member;

-- ȸ��������̺�
CREATE TABLE grade(
    grade VARCHAR2 (6 CHAR)
        CONSTRAINT GRADE_GRADE_CK CHECK (grade IN ('FAMILY', 'GOLD', 'VIP', 'VVIP')),
    low NUMBER,
    high NUMBER
);


-- FAMILY, GOLD, VIP, VVIP

INSERT INTO 
    grade
VALUES(
    'FAMILY',0,15
);

INSERT INTO 
    grade
VALUES(
    'GOLD',15,30
);

INSERT INTO 
    grade
VALUES(
    'VIP',30,60
);

INSERT INTO 
    grade
VALUES(
    'VVIP',60,100
);

SELECT * FROM grade;

--ȸ����ġ���̺�
CREATE TABLE userlocation(
    uno NUMBER(10) 
        CONSTRAINT ULOC_UNO_PK PRIMARY KEY,
    mno NUMBER(10) 
        CONSTRAINT ULOC_MNO_FK REFERENCES member(mno),
    ux NUMBER(10),
    uy NUMBER(10),
    uloc VARCHAR2(50 CHAR),
    utime DATE DEFAULT sysdate
);



INSERT INTO
    userlocation
VALUES(
    (SELECT NVL(MAX(uno)+1,1) FROM userlocation),1001,6,8,'���� ���ֽ� 516�� 2596',sysdate
);

INSERT INTO
    userlocation
VALUES(
    (SELECT NVL(MAX(uno)+1,1) FROM userlocation),1002,7,9,'���� �������� ������ ���긮 1',sysdate
);

INSERT INTO
    userlocation
VALUES(
    (SELECT NVL(MAX(uno)+1,1) FROM userlocation),1003,19,39,'���� �������� ������ ���ĸ� 600',sysdate
);

INSERT INTO
    userlocation
VALUES(
    (SELECT NVL(MAX(uno)+1,1) FROM userlocation),1004,1,9,'���� �������� ������ ���ĸ�',sysdate
);


INSERT INTO
    userlocation
VALUES(
    (SELECT NVL(MAX(uno)+1,1) FROM userlocation),1005,17,9,'���� ���ֽ� ������ 16',sysdate
);

INSERT INTO
    userlocation
VALUES(
    (SELECT NVL(MAX(uno)+1,1) FROM userlocation),1006,7,90,'���� ���ֽ� �Ѹ��� ���縮 2497-1',sysdate
);


INSERT INTO
    userlocation
VALUES(
    (SELECT NVL(MAX(uno)+1,1) FROM userlocation),1007,87,90,'���� ���ֽ� ��õ�� �����ؾȷ� 525',sysdate
);


INSERT INTO
    userlocation
VALUES(
    (SELECT NVL(MAX(uno)+1,1) FROM userlocation),1008,74,80,'���� ���ֽ� ��õ�� ����5�� 6',sysdate
);

INSERT INTO
    userlocation
VALUES(
    (SELECT NVL(MAX(uno)+1,1) FROM userlocation),1009,4,88,'���ֽ� ������ �����׷� 26',sysdate
);

INSERT INTO
    userlocation
VALUES(
    (SELECT NVL(MAX(uno)+1,1) FROM userlocation),1010,39,20,'���� �������� �ȴ��� âõ�� 564',sysdate
);

SELECT  * FROM userlocation;


--�����з����̺�
CREATE TABLE disease(
    dno NUMBER(10) 
        CONSTRAINT DISEASE_DNO_PK PRIMARY KEY,
    dname VARCHAR2(100)
        CONSTRAINT DISEASE_DNAME_NN NOT NULL
);

INSERT INTO
    disease
VALUES(
    (SELECT NVL(MAX(dno)+1,1) FROM disease),'�ĵ���'
);


INSERT INTO
    disease
VALUES(
    (SELECT NVL(MAX(dno)+1,1) FROM disease),'����'
);

INSERT INTO
    disease
VALUES(
    (SELECT NVL(MAX(dno)+1,1) FROM disease),'���μ� ���� ���ı�'
);
INSERT INTO
    disease
VALUES(
    (SELECT NVL(MAX(dno)+1,1) FROM disease),'����'
);

INSERT INTO
    disease
VALUES(
    (SELECT NVL(MAX(dno)+1,1) FROM disease),'����'
);

INSERT INTO
    disease
VALUES(
    (SELECT NVL(MAX(dno)+1,1) FROM disease),'���'
);

INSERT INTO
    disease
VALUES(
    (SELECT NVL(MAX(dno)+1,1) FROM disease),'��ȭ�ҷ�'
);

INSERT INTO
    disease
VALUES(
    (SELECT NVL(MAX(dno)+1,1) FROM disease),'��Ȳ���'
);

INSERT INTO
    disease
VALUES(
    (SELECT NVL(MAX(dno)+1,1) FROM disease),'�ɱٰ����'
);

INSERT INTO
    disease
VALUES(
    (SELECT NVL(MAX(dno)+1,1) FROM disease),'�索��'
);

INSERT INTO
    disease
VALUES(
    (SELECT NVL(MAX(dno)+1,1) FROM disease),'����'
);

INSERT INTO
    disease
VALUES(
    (SELECT NVL(MAX(dno)+1,1) FROM disease),'ġ����'
);

INSERT INTO
    disease
VALUES(
    (SELECT NVL(MAX(dno)+1,1) FROM disease),'�˷�����'
);

INSERT INTO
    disease
VALUES(
    (SELECT NVL(MAX(dno)+1,1) FROM disease),'������'
);

SELECT * FROM disease;

-- ȸ���������̺�
CREATE TABLE userdisease(
    mno NUMBER(10)
        CONSTRAINT UDISEASE_MNO_FK REFERENCES member(mno),
    dno NUMBER(10)
        CONSTRAINT UDISEASE_DNO_FK REFERENCES disease(dno)
);

INSERT INTO 
    userdisease
VALUES(
    1001,1
);

INSERT INTO 
    userdisease
VALUES(
    1002,2
);

INSERT INTO 
    userdisease
VALUES(
    1003,3
);

INSERT INTO 
    userdisease
VALUES(
    1004,4
);

INSERT INTO 
    userdisease
VALUES(
    1005,5
);

INSERT INTO 
    userdisease
VALUES(
    1006,6
);


INSERT INTO 
    userdisease
VALUES(
    1007,7
);

INSERT INTO 
    userdisease
VALUES(
    1008,8
);

INSERT INTO 
    userdisease
VALUES(
    1009,9
);

INSERT INTO 
    userdisease
VALUES(
    1010,10
);

SELECT * FROM userdisease;




-- ����������̺�
CREATE TABLE areatype(
      atno NUMBER(2)
        CONSTRAINT ATYPE_ATNO_PK PRIMARY KEY
        CONSTRAINT ATYPE_ATNO_CK CHECK (atno IN (10,20,30,40,50)),
      atname VARCHAR2(2 CHAR)
        CONSTRAINT ATYPE_ATNAME_NN NOT NULL
        CONSTRAINT AYTPE_ATNAME_CK CHECK (atname IN ('����','����','�Ĵ�','����','����'))
);

INSERT INTO
    areatype
VALUES(
    10,'����'
);


INSERT INTO
    areatype
VALUES(
    20,'����'
);
INSERT INTO
    areatype
VALUES(
    30,'�Ĵ�'
);
INSERT INTO
    areatype
VALUES(
    40,'����'
);
INSERT INTO
    areatype
VALUES(
    50,'����'
);



SELECT * FROM AREATYPE;
-- ����������̺�
create table areainfo(
    ano NUMBER(10) 
        CONSTRAINT AINFO_ANO_PK PRIMARY KEY,
    aname VARCHAR2(30 CHAR)
        CONSTRAINT AINFO_ANAME_NN NOT NULL,
    aloc VARCHAR2(50 CHAR)
        CONSTRAINT AINFO_ALOC_NN NOT NULL,  
    atel  VARCHAR2(14 CHAR)
        CONSTRAINT AINFO_ATEL_UK UNIQUE,
    atno NUMBER(2)
        CONSTRAINT AINFO_ATNO_FK REFERENCES areatype(atno)
        CONSTRAINT AINFO_ATNO_NN NOT NULL,
    apno NUMBER(10)
        CONSTRAINT AINFO_APNO_UK UNIQUE
        CONSTRAINT AINFO_APNO_NN NOT NULL,
    abody VARCHAR2(100 CHAR) 
        CONSTRAINT AINFO_ABODY_NN NOT NULL,
    ahit NUMBER(10) DEFAULT 0
        CONSTRAINT AINFO_AHIT_NN NOT NULL,
    isshow CHAR(1) DEFAULT 'Y'
        CONSTRAINT AINFO_ISSHOW_NN NOT NULL,
    ax NUMBER(10) 
        CONSTRAINT AINFO_AX_NN NOT NULL,
    ay NUMBER(10)
        CONSTRAINT AINFO_AY_NN NOT NULL
);



INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'��������','���� �������� ������ ����','064-782-2810',10,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '3������ ���� ��ä�� �ϸ� ǳ���� �� �� �ְ�, �ڿ� �ִ� ����� ������ Ǫ�� �ٴٰ� �ֽ��ϴ�.',
    0,'Y',10,18
);


INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'������','���� �������� ������ �ŷʸ� ��2-1',null,10,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '10�� �� ��ǳ ���� ã�� ������. ���󿡼� ������ �����⸦ ������ �� �־��. ',
    58,'Y',1401,86
);  



INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'���ĵ�','���� �������� ������ ���ĸ�','064-794-7130',10,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '5���� �ִ� ���ĵ� û���� ������ �� ��������. û������ �ѽǳѽ�~',
    8,'Y',101,8
);  



INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'�۾ǻ�','���� �������� ������ �۾ǰ����� 421-1','064-120',10,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '4���� ����� ���� �ĵ��� ���� ĥ �� ���� ���� �� �շ���! �ѷ��� �ҿ�ð��� 2�ð� ���� �˴ϴ�. ',
    10,'Y',11,80
);  


INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'������ȣ��','���� �������� õ������188���� 11','064-805-7600',20,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '������ ���ݿ� ���Ҹ� �̿��ϰ� �����ôٸ� �����մϴ�!',
    19,'Y',11,9
);  


INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'��ž������ȣ������','���ֽ� ��õ�� �����ؾȷ� 502','0507-1425-9307',20,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '�Դ��ؼ����� �ϸ��� ���� �ʹٸ� �̰�����~ ������������ �ִ� ��� ���� ű���嵵 ��� �����մϴ�.',
    4,'Y',1021,84
);  

INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'�����ȣ��','���� �������� �߹�������72���� 114',null,20,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '���� �ȿ��� �Ƹ��ٿ� ���Ǻ並 �� �� �ִ� ȣ��, ������ ��å�ϱ⵵ �ʹ� ���ƿ�. ',
    8,'Y',1401,48
);  



INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'�����ž','���� �������� ������ ����� 270-8 2��','064-782-5050',30,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '����������� ���� ����� ���� �����ôٸ� ã�ƿ�����~ ���� ������ �帳�ϴ�!',
    80,'Y',141,7
);  


INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'��Ʒ� ��������','���� ���ֽ� ������� 23 1��','0507-1310-5917',30,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '����������, �Ѷ������, �ܱܲ�ġ��, �ԼҶ� ��� �Ⱦƿ�. ������ ����@_@',
    10,'Y',181,35
);  


INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'�����Ѷ󱹼�','���� �������� õ������188���� 17','064-738-6392',30,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '���ִ� �༮�鵵 ���� < ���� ��� ���� >, �޲ٹ̰� �� ���� ���� �ְ��� ����',
    17,'Y',1401,85
);  



INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'���;系��','���� ���ֽ� ������ 18','064-752-3312',40,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    'ģ���ϰ� �����ص帳�ϴ�. ',
    2,'Y',1031,845
);  


INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'��ġ���ǿ�','���� �������� õ������ 194(�߹���)','064-738-2811',40,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '���� �� ġ������ ����ôٸ� �̰����� ������~',
    4,'Y',1201,82
);  


INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'�ٳ����ǿ�','���� ���ֽ� �߾ӷ� 77 2��(�̵�1��)','064-721-0050',40,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '�ٳ����ǿ� ������ ������ �ּ��� ���ϰڽ��ϴ�.',
    7,'Y',11,49
);  

INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'�����Ѷ󺴿� ���޽�','���� ���ֽ� ���ɷ� 65 �Ѷ󺴿�','064-740-5158',50,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '24�ð� ��մϴ�. ',
    47,'Y',131,479
);      

INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'�������Ƿ�� ���޽�','���� �������� ��ȫ�� 1530','064-730-3001',50,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '���� ��ġ�� ���ص帮�ڽ��ϴ�. ',
    8,'Y',108,490
);      

INSERT INTO 
    areainfo
VALUES(
    (SELECT NVL(MAX(ano)+1,1) FROM areainfo),'���ִ��б����� ���޽�','���� ���ֽ� �ƶ�13�� 15','064-717-1900',50,
    (SELECT NVL(MAX(apno)+1,1) FROM areainfo),
    '���ִ��б� �ֺ� ���޽��Դϴ�. ',
    48,'Y',100,433
);      

SELECT * FROM areainfo;


-- ��һ������̺�
CREATE TABLE aphoto(
    apno NUMBER(10)
        CONSTRAINT APHOTO_APNO_FK REFERENCES areainfo(apno)
        CONSTRAINT APHOTO_APNO_NN NOT NULL,
    aponame VARCHAR2(100 CHAR)  DEFAULT 'noimage.jpg'
        CONSTRAINT APHOTO_APONAME_NN NOT NULL,
    apsname VARCHAR2(100 CHAR)  DEFAULT 'noimage.jpg'
        CONSTRAINT APHOTO_APSNAME_NN NOT NULL,
    apsize NUMBER(10)  DEFAULT (200 * 100)
        CONSTRAINT APHOTO_APSIZE_NN NOT NULL,
    apdir VARCHAR2(100) DEFAULT '/img/area/'
        CONSTRAINT APHOTO_APDIR_NN NOT NULL,
    atno NUMBER(10) 
        CONSTRAINT APHOTO_ATNO_FK REFERENCES areatype(atno)
        CONSTRAINT APHOTO_ATNO_NN NOT NULL
        CONSTRAINT APHOTO_ATNO_CK CHECK (atno IN (10,20,30,40,50))
);        
   

INSERT INTO 
    aphoto
VALUES(
    1,'noimage.jpg','��������1.jpg',200 * 100,'/img/area/',10
);

INSERT INTO 
    aphoto
VALUES(
    1,'noimage.jpg','��������2.jpg',200 * 100,'/img/area/',10
);

INSERT INTO 
    aphoto
VALUES(
    2,'noimage.jpg','������1.jpg',200 * 100,'/img/area/',10
);

INSERT INTO 
    aphoto
VALUES(
    2,'noimage.jpg','������2.jpg',200 * 100,'/img/area/',10
);

INSERT INTO 
    aphoto
VALUES(
    3,'noimage.jpg','���ĵ�1.jpg',200 * 100,'/img/area/',10
);


INSERT INTO 
    aphoto
VALUES(
    3,'noimage.jpg','���ĵ�4.jpg',200 * 100,'/img/area/',10
);

INSERT INTO 
    aphoto
VALUES(
    4,'noimage.jpg','�۾ǻ�1.jpg',200 * 100,'/img/area/',10
);


INSERT INTO 
    aphoto
VALUES(
    4,'noimage.jpg','�۾ǻ�2.jpg',200 * 100,'/img/area/',10
);

INSERT INTO 
    aphoto
VALUES(
    5,'noimage.jpg','������ȣ��.jpg',200 * 100,'/img/area/',20
);


INSERT INTO 
    aphoto
VALUES(
    6,'noimage.jpg','��ž������ȣ��.jpg',200 * 100,'/img/area/',20
);


INSERT INTO 
    aphoto
VALUES(
    7,'noimage.jpg','�����ȣ��.jpg',200 * 100,'/img/area/',20
);


INSERT INTO 
    aphoto
VALUES(
    8,'noimage.jpg','�����ž.jpg',200 * 100,'/img/area/',30
);

INSERT INTO 
    aphoto
VALUES(
    9,'noimage.jpg','��Ʒ� ��������.jpg',200 * 100,'/img/area/',30
);
INSERT INTO 
    aphoto
VALUES(
    10,'noimage.jpg','�����Ѷ󱹼�1.jpg',200 * 100,'/img/area/',30
);

INSERT INTO 
    aphoto
VALUES(
    10,'noimage.jpg','�����Ѷ󱹼�2.jpg',200 * 100,'/img/area/',30
);



INSERT INTO 
    aphoto
VALUES(
    11,'noimage.jpg','���;系��.jpg',200 * 100,'/img/area/',40
);



INSERT INTO 
    aphoto
VALUES(
    12,'noimage.jpg','��ġ���ǿ�.jpg',200 * 100,'/img/area/',40
);



INSERT INTO 
    aphoto
VALUES(
    13,'noimage.jpg','�ٳ����ǿ�.jpg',200 * 100,'/img/area/',40
);



INSERT INTO 
    aphoto
VALUES(
    14,'noimage.jpg','�����Ѷ󺴿� ���޽�.jpg',200 * 100,'/img/area/',50
);


INSERT INTO 
    aphoto
VALUES(
    15,'noimage.jpg','�������Ƿ�� ���޽�.jpg',200 * 100,'/img/area/',50
);


INSERT INTO 
    aphoto
VALUES(
    16,'noimage.jpg','���ִ��б����� ���޽�.jpg',200 * 100,'/img/area/',50
);

SELECT * FROM aphoto;

-- �����������̺�

create table review (
    rno NUMBER(10) -- �۹�ȣ
        CONSTRAINT REVIEW_RNO_PK PRIMARY KEY,
    ano NUMBER(10) -- ��ҹ�ȣ
        CONSTRAINT REVIEW_ANO_FK REFERENCES areainfo(ano)
        CONSTRAINT REVIEW_ANO_NN NOT NULL,
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
        CONSTRAINT REVIEW_ISSHOW_NN NOT NULL
);

INSERT INTO
    review
VALUES(
    (SELECT NVL(MAX(rno)+1,1) FROM review),2,'��� ���� �ٳ�Ծ��~','������ �ƴ϶� ���� ���ƿ�. �׷��� �ʹ� �Ƹ��ٿ��� ���� �͵� �ؾ���ϴ�.',
    (SELECT NVL(MAX(rpno)+1,1) FROM review),'2020/10/31',5,50,'Y'
);

INSERT INTO
    review
VALUES(
    (SELECT NVL(MAX(rno)+1,1) FROM review),3,'û������ ���� �ֳ׿�','û����, ��ä��, �ĵ��� ��ȭ �ְ�!!',
    (SELECT NVL(MAX(rpno)+1,1) FROM review),'2020/10/31',5,30,'Y'
);

INSERT INTO
    review
VALUES(
    (SELECT NVL(MAX(rno)+1,1) FROM review),7,'�����ȣ�� �ٳ�Ծ��~','��� ���� ������ �� ��γ׿�.. �׷��� ���� �߾��� �Ǿ� �ູ�մϴ�. ',
    (SELECT NVL(MAX(rpno)+1,1) FROM review),'2020/08/01',4,20,'Y'
);

INSERT INTO
    review
VALUES(
    (SELECT NVL(MAX(rno)+1,1) FROM review),9,'�λ����� ��Ʒ� ��������','�񸰰��� �Ⱦ��ϴµ� ���������� �����߳׿�. ',
    (SELECT NVL(MAX(rpno)+1,1) FROM review),'2019/05/01',5,65,'Y'
);

INSERT INTO
    review
VALUES(
    (SELECT NVL(MAX(rno)+1,1) FROM review),10,'TV�� ���� ������ ���ٴ�','���� ���ƿ��� �濡 �������� ����, �Ǹ԰� �ͳ׿� ',
    (SELECT NVL(MAX(rpno)+1,1) FROM review),'2018/07/01',4.5,34,'Y'
);

INSERT INTO
    review
VALUES(
    (SELECT NVL(MAX(rno)+1,1) FROM review),12,'���� �� ġ�� �ı�','������ ���µ� ġ�ư� �ʹ� ���ļ� ġ�� �ٳ�Ծ��. 
    ���п� ���� ��������� ',
    (SELECT NVL(MAX(rpno)+1,1) FROM review),'2017/07/01',3.5,25,'Y'
);

INSERT INTO
    review
VALUES(
    (SELECT NVL(MAX(rno)+1,1) FROM review),13,'���ǿ��� �ٳ�Խ��ϴ�. ','������ ��ģ���ؼ� �������� ���� ���� �ʽ��ϴ�. ',
    (SELECT NVL(MAX(rpno)+1,1) FROM review),'2018/06/11',3,15,'Y'
);

INSERT INTO
    review
VALUES(
    (SELECT NVL(MAX(rno)+1,1) FROM review),15,'�״� ��Ƴ���� ','�㿡 ���ϰ� ü�ϴ� �ٶ��� 
    ���� ���� ���ϴٰ� ���޽��� �ٳ�Խ��ϴ�. ',
    (SELECT NVL(MAX(rpno)+1,1) FROM review),'2019/11/11',4,53,'Y'
);

select * from review;

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


SELECT * FROM RPHOTO ;
commit;

-- ����
SELECT 
    mname, m.mno,u.dno,dname
FROM 
    member m,userdisease u ,disease d
WHERE
    m.mno = u.mno
    AND u.dno=d.dno;
    
    
    
    
---��ǥ������Ʈ ����-----------------------------------------------------------------------

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



---���� ���̵����� �߰�
----------------------------------------------------------------------
INSERT INTO review
VALUES(
    (SELECT (MAX(NVL(rno+1, 1))) FROM review ),
    (SELECT mno FROM member WHERE id = 'jang' ),
    'JEJU~ �Ѷ󱹽�', '���� � ���ٰ� ���� �԰� �; �ٳ�Դµ�
    ŷ �� ������ �� �±� �Ե鵵 �� �ٳ�ͺ�����. 3���̼� �� �׸� ���Ѽ� �������� ����
    �ٵ� �谡 ���� �����ٴ� �� �Ԥ�����',
    (SELECT (MAX(NVL(rpno+1,1))) FROM review ),
    sysdate, 5, 0, 'Y', 33.250525250847936, 126.42445768114317
    )
;

INSERT INTO review
VALUES(
    (SELECT (MAX(NVL(rno+1, 1))) FROM review ),
    (SELECT mno FROM member WHERE id = 'chan' ),
    '�� �� ������', '��ħ�� �� ���ļ� ����� �� ã�ٰ� �ٳ�� �׳����� ������',
    (SELECT (MAX(NVL(rpno+1,1))) FROM review ),
    sysdate, 3, 0, 'Y', 33.51307971275873, 126.52142654066962
    )
;

INSERT INTO review
VALUES(
    (SELECT (MAX(NVL(rno+1, 1))) FROM review ),
    (SELECT mno FROM member WHERE id = 'wook' ),
    '���� ������', '�� �ٸ��� ���� �� ��ġ 4���ִٰ� ���� ũ��� �ؾߵȴٴ� �� �ƴ�?
    �� ��μ� �λ��ϰ� ���ͼ� �տ� ġ�� �� �ֱ淡 ���µ� �� ���� ����ġ���ϰ� �� ��',
    (SELECT (MAX(NVL(rpno+1,1))) FROM review ),
    sysdate, 4, 0, 'Y', 33.251745497098426, 126.42565332716656
    )
;

INSERT INTO review
VALUES(
    (SELECT (MAX(NVL(rno+1, 1))) FROM review ),
    (SELECT mno FROM member WHERE id = 'joseph' ),
    '�� ������ �ٳ�Ծ��', '���� ����Ծ����.. ȿ���� �� �𸣰ھ�� �Ф�',
    (SELECT (MAX(NVL(rpno+1,1))) FROM review ),
    sysdate, 2, 0, 'Y', 33.518037668945176, 126.52284210749815
    )
;

INSERT INTO review
VALUES(
    (SELECT (MAX(NVL(rno+1, 1))) FROM review ),
    (SELECT mno FROM member WHERE id = 'jiwoo' ),
    '��...', '��� ���� ��������.. ���޽� �Ƿ��Դµ� �ǻ���̶� ��ȣ����� ģ���� ������',
    (SELECT (MAX(NVL(rpno+1,1))) FROM review ),
    sysdate, 4, 0, 'Y', 33.49019207658534, 126.48501679464566
    )
;

INSERT INTO review
VALUES(
    (SELECT (MAX(NVL(rno+1, 1))) FROM review ),
    (SELECT mno FROM member WHERE id = 'jjang' ),
    '��ǳ�� ���� �� ����...', '�ƴ� �Ѷ�� ����Ϸ� ���ٰ� ���� �ٳ�Դµ� ��¾��
    �Ѷ�굵 ������ �۾ǻ� ����',
    (SELECT (MAX(NVL(rpno+1,1))) FROM review ),
    sysdate, 4, 0, 'Y', 33.199804357744014, 126.29243666800144
    )
;

INSERT INTO review
VALUES(
    (SELECT (MAX(NVL(rno+1, 1))) FROM review ),
    (SELECT mno FROM member WHERE id = 'sun' ),
    '���뿡 �̷�����?', '���뿡�� �������� ������ ��� ������ �Ϸ����',
    (SELECT (MAX(NVL(rpno+1,1))) FROM review ),
    sysdate, 3, 0, 'Y', 33.46714133094259, 126.5457129811507
    )
;
INSERT INTO review
VALUES(
    (SELECT (MAX(NVL(rno+1, 1))) FROM review ),
    (SELECT mno FROM member WHERE id = 'sun' ),
    '������������', '�������� �����ϴ� �׷��� ����Ʈ �� �ٳ�Դµ� �� �׳� ����������',
    (SELECT (MAX(NVL(rpno+1,1))) FROM review ),
    sysdate, 3, 0, 'Y', 33.42437961506556, 126.93110026765497
    )
;
INSERT INTO review
VALUES(
    (SELECT (MAX(NVL(rno+1, 1))) FROM review ),
    (SELECT mno FROM member WHERE id = 'sun' ),
    '��ž', '�� ���� ���ϴ�~~ ��ž�䰡 �����ϴٴ��� ���� �� �ͼ� �׳� �ǳ��� �־����Ф�',
    (SELECT (MAX(NVL(rpno+1,1))) FROM review ),
    sysdate, 3, 0, 'Y', 33.46164828897533, 126.9346003676563
    )
;
INSERT INTO review
VALUES(
    (SELECT (MAX(NVL(rno+1, 1))) FROM review ),
    (SELECT mno FROM member WHERE id = 'sun' ),
    '��ž������', '�� ���� ���ϴ�~~ ���ݴ�� ����',
    (SELECT (MAX(NVL(rpno+1,1))) FROM review ),
    sysdate, 3, 0, 'Y', 33.54252580986714, 126.66618655416492
    )
;
INSERT INTO review
VALUES(
    (SELECT (MAX(NVL(rno+1, 1))) FROM review ),
    (SELECT mno FROM member WHERE id = 'chan' ),
    'jhȣ��', '�����̶� ������� ���׿�~ �������� ���� ���� ����',
    (SELECT (MAX(NVL(rpno+1,1))) FROM review ),
    sysdate, 4, 0, 'Y', 33.47555396363046, 126.41899092409558
    )
;
commit;