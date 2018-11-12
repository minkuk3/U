CREATE table car_info(
c_no number(6) not null PRIMARY KEY,
com_no number(2),
c_name VARCHAR2(20),
c_type VARCHAR2(20),
c_regdate date,
c_price number(10),
c_cc number(5)
);

CREATE table company_info(
com_no NUMBER(2) not null PRIMARY KEY,
com_name VARCHAR2(20),
com_addr VARCHAR2(100),
com_amount number,
com_total NUMBER
);

SELECT
    c_no, c_name, to_char(C_REGDATE, 'YYYY-MM-DD')as c_regdate, c_price
FROM car_info;

INSERT into car_info
(c_no, com_no, c_name, c_type, c_regdate, c_price, c_cc)
VALUES
(100001, 71, '아반떼 AD', '승용차', '20170216', 15000000, 1600);

commit;

insert into car_info
(c_no, com_no, c_name, c_type, c_regdate, c_price, c_cc )
VALUES
( (SELECT nvl(max(c_no),0)+1 from car_info), ?, ?, ?, ?, ?, ? );

insert into car_info
(c_no, com_no, c_name, c_type, c_regdate, c_price, c_cc )
VALUES
( (SELECT nvl(max(c_no),0)+1 from car_info), 71, '520d', '디젤', '2018-11-08', 20000000, 3200 );

commit;

SELECT nvl(max(c_no),0)+1 as c_no from car_info;

DELETE FROM COMPANY_INFO WHERE com_no = 75;

SELECT
    *
FROM COMPANY_INFO;

DELETE FROM COMPANY_INFO
WHERE com_no = 76;

COMMIT;

insert into COMPANY_INFO
(com_no, com_name, com_addr, COM_AMOUNT, COM_TOTAL)
VALUES
(74, '올뉴 쏘렌토', '서울 뭐라구', 0, 0);

SELECT nvl(max(com_no),0)+1 as com_no from COMPANY_INFO;

SELECT
    com_no, com_name
FROM COMPANY_INFO;

--com_name, c_name, c_type, c_regdate, c_price, c_cc
SELECT
b.com_name, a.c_name, a.c_type, a.c_regdate, a.c_price, a.c_cc, a.c_no
from car_info a 
left join COMPANY_INFO b 
on a.com_no = b.com_no
GROUP by b.com_name, a.c_name, a.c_type, a.c_regdate, a.C_PRICE, a.c_cc, a.c_no
HAVING a.c_no = 10001;

DELETE FROM CAR_info 
WHERE c_no = 10005;

commit;

SELECT
    *
FROM COMPANY_INFO
ORDER BY com_no;

DELETE FROM COMPANY_INFO WHERE com_no = 76;

UPDATE COMPANY_INFO 
SET com_amount = com_amount+1,
com_total = com_totla + ?
where com_no = ? ;


commit;

update CAR_INFO
set c_name = ?, c_type = ?, c_regdate = ?, c_price = ?, c_cc = ?
where c_no = ?;











