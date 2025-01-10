# student_tb에서 모두 조회
select
	*
from
	student_tb;

# student_tb에서 학생 이름과 학년 조회
select
	student_name,
    student_year
from
	student_tb;

# where 조건
# student_tb에서 지정한 범위 값만큼 조회
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
	student_id between 3 and 4;		-- ->student_id가 3~4까지 조회
    
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