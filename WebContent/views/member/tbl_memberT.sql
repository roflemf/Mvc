--tbl_memberT테이블생성
create table tbl_memberT(
 mem_id varchar(30) primary key
 ,mem_pwd varchar2(50) not null
 ,mem_name varchar2(50) not null
 ,mem_phone varchar2(30) not null
 ,mem_email varchar2(50) not null
 ,mem_regdate timestamp
);