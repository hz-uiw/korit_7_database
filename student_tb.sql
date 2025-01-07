SELECT
	(select
		(select
			course_name
		from
			course_tb
		where
			course_tb.course_id = course_registering_information_tb.course_id)
	from
		course_registering_information_tb
	where
		course_registering_information_tb.course_registering_information_id = course_registering_tb.course_registering_information_id) as course_name
from
	course_registering_tb
where
	student_id = (select student_id from student_tb where student_name = '백진우');