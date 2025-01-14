# transaction
# 변수 앞에 @@가 붙으면 전역변수
select @@autocommit;

# !!! autocommit 풀어둔 상태에서 작업!!!
set autocommit = 0;

insert into data_b_tb
values (default, '777');

commit;

select * from data_b_tb;

# stat transation 시작
start transaction;

insert into data_b_tb
values (default, '4040');

update
	data_b_tb
set
	data_b_value = '999'
where
	data_b_value = '777';

# (savepoint와 관계없이) transaction 상태 전으로 되돌리기 
rollback;

# savepoint 이름 으로 세이브포인트 지정
savepoint aa;
# savepoint까지 롤백
rollback to aa;

# commit으로 닫힘(확정)
commit;

-- 함수 세팅
select @@log_bin_trust_function_creators;
set global log_bin_trust_function_creators = 1;