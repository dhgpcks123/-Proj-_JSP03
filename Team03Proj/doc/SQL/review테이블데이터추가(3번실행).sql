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
