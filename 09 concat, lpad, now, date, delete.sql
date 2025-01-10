# concat (문자열 함수)
select
	*
from
	book_tb bt
	left outer join publisher_count_cte as pcc on(pcc.publisher_id = bt.publisher_id)
    left outer join author_count_cte as acc on(acc.author_id = bt.author_id)
where
	bt.book_name like concat('%', @searchData, '%');
    
# LPAD
select
	lpad('123', 5, 0);
	
# now
select
	year(now()),
	month('2022-08-10'),
	day(now()),
	hour(now()),
	minute(now()),
	second(now());
    
# date_format
select
	date_format(now(), '%Y년 %m월 %d일');
    
# delete
delete	-- where 필수!!
from
	book_tb
where
	book_id = 1;