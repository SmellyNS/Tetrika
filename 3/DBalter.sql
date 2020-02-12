use tetrika
go

create table #tmp (event_id int, avg_qty float)			-- temporary table for saving (event, avg) table
GO
insert #tmp (event_id, avg_qty)		
			select event_id, avg(tech_quality) as avg_qty
			from (

			
						(
							select user_id,lesson_id, event_id,cast(scheduled_time as date) as scheduled_time,tech_quality from
						(	
						select id,A.event_id, scheduled_time,user_id 
						from(	
								select id, event_id, dateadd(hour,3,scheduled_time) as scheduled_time  -- UTC + 3, so dateadd(hour, 3, ...)
								from lessons 
								where subject='phys'
							) A
									JOIN
							(	
								select event_id, user_id 
								from participants
							) B 
									on A.event_id = B.event_id			-- joining users and time by event
						) C
							JOIN
						(
							select * from quality
						) D 
								on C.id = D.lesson_id					-- to join it with quality
						)


				) as  G group by event_id 			-- and finally to find average quality for each event




-- joining #tmp -> lessons -> participants -> users to get required data


	SELECT scheduled_time, user_id, avg_qty
	from (
		SELECT tmpid, scheduled_time, user_id, avg_qty, 
		ROW_NUMBER() OVER
			(	
				PARTITION BY scheduled_time, user_id, avg_qty
				ORDER BY tmpid
			) as uniqchk
		FROM 

		(
		select row_number() over(order by(scheduled_time)) as tmpid, scheduled_time, user_id, avg_qty from
(select C.event_id, avg_qty, min_avg, user_id, scheduled_time from
(
select A.event_id, avg_qty, id, cast(scheduled_time as date) as scheduled_time, min(avg_qty) over (partition by cast(scheduled_time as date)) as min_avg  from ( (select * from #tmp) A join (select * from lessons) B on A.event_id = B.event_id)
) C join (select * from participants) D on C.event_id = D.event_id ) E JOIN (select * from users where role = 'tutor') F on E.user_id = F.id
where min_avg = avg_qty ) as L

		) as A
WHERE A.uniqchk = 1

