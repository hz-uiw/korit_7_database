select 
	* 
from
	course_register_tb
where
	instructor_id = (select
						instructor_id
					from
						instructor_tb
					where
						instructor_name = '박교수');
                        
select
	(select 
		instructor_name 
	from 
		instructor_tb 
    where 
		instructor_tb.instructor_id = course_registering_information_tb.instructor_id) as instructor_name
from
	course_registering_information_tb;
