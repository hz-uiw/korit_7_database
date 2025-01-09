# select 

select
	*
from
	student_tb;
    
select
	student_name,
    student_year
from
	student_tb;

# where 조건
select
	*
from
	student_tb
where
# 값 지정 (3, 4)
-- 	student_year = 3 or student_year = 4;
--  student_year in(3, 4);
# 범위 (3~4)
--  student_year > 2 or student_year < 5;
-- 	student_year >= 3 or student_year <= 4;
	student_id between 3 and 4;
    
select
	10 as num,
    20 as num2,
    '이름' as name
union -- select를 열로 병합 (같은 값이면 중복 제거)
select
	30 as num,
    40 as num2,
    '이름2' as name;
    
select
	10 as num,
    20 as num2,
    '이름' as name
union all -- select를 열로 병합 (컬럼의 갯수가 같아야 사용 가능)
select
	30 as num,
    40 as num2,
    '이름2' as name;

select
	1 as id,
    '월' as day
union all
select
	2 as id,
    '화' as day
union all
select
	3 as id,
    '수' as day;
    
# union으로 테이블 합치기 -> id값 넣기
select
	row_number() over(order by name) as `index`,
	name
from
	(select
		student_name as name
	from
		student_tb
	union
	select
		instructor_name
	from
		instructor_tb) as name_tb;

# union으로 테이블 합쳐서 id값 넣기 - row_nubmer() over() 사용
select
	row_number() over(order by student_name) as num,
	student_name
from
	student_tb;
    
# order by
-- dese: 내림차순
-- asc: 오름차순(생략가능)
select
	*
from
	student_tb
order by
	student_year desc,
    student_name;
    
    
# 문제
select
	row_number() over(order by `id`) as num,
	name_tb.*
from
	(select
		course_id  as `id`,
		course_name as `name`
	from
		course_tb
	union
	select
		major_id,
		major_name
	from
		major_tb) as name_tb;
        
# rank
select
	-- rank() over(order by `id`) as num, # 공동 n등이 있으면, n + 1등은 없음
	dense_rank() over(order by `id`) as num, # 공동 n등이 있으면, n + 1등이 있음
	name_tb.*
from
	(select
		course_id  as `id`,
		course_name as `name`
	from
		course_tb
	union
	select
		major_id,
		major_name
	from
		major_tb) as name_tb;
        
        
# where 와일드 카드(like)
select
	*
from
	instructor_tb
where
	instructor_name like '_교_';
-- %s% => s가 들어가는 값
-- s%	=> s로 시작하는 값
-- %s	=> s로 끝나는 값
-- _s_	=> s가 중간에 있는 세글자
-- s_	=> s로 시작하는 두글자
-- _s	=> s로 끝나는 두글자