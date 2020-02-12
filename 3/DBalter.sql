use tetrika
go


create table #tmp (event_id int, avg_qty float)
GO


insert #tmp (event_id, avg_qty)
			select event_id, avg(tech_quality) as avg_qty
			from (

			
						(
							select user_id,lesson_id, event_id,cast(scheduled_time as date) as scheduled_time,tech_quality from
						(	
						select id,A.event_id, scheduled_time,user_id 
						from(	
								select id, event_id, dateadd(hour,3,scheduled_time) as scheduled_time 
								from lessons 
								where subject='phys'
							) A
									JOIN
							(	
								select event_id, user_id 
								from participants
							) B 
									on A.event_id = B.event_id
						) C
							JOIN
						(
							select * from quality
						) D 
								on C.id = D.lesson_id
						)


				) as  G group by event_id 


select cast(scheduled_time as date) as scheduled_time, user_id, avg_qty from 
(
select scheduled_time, user_id, avg_qty from
(
	(select A.event_id, avg_qty, scheduled_time from
		(select event_id, avg_qty from #tmp where avg_qty = (select min(avg_qty) from #tmp)) A
		join
		(select event_id, dateadd(hour,3,scheduled_time) as scheduled_time from lessons) B on A.event_id = B.event_id
	) C
	join
	(select event_id, user_id from participants) D on C.event_id = D.event_id ) ) E
		join
	(select * from users where role='tutor') F on F.id = E.user_id

