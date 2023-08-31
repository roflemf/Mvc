--tbl_test테이블 생성
create table tbl_test(
 no number(38) primary key
 ,title varchar2(100) not null
 ,content varchar2(4000) not null
 ,regdate timestamp 
 );
 
 drop table tbl_test;