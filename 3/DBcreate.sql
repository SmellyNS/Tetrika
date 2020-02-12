USE [master]
GO
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'tetrika')
DROP DATABASE tetrika
GO
CREATE DATABASE tetrika
GO
USE tetrika
GO


create table users (
	id varchar(50) not null,
	[role] varchar(10) not null,
	primary key ([id])
)
go

create table lessons (
	id varchar(50) not null,
	event_id int not null,
	[subject] varchar(20) not null,
	scheduled_time DATETIME not null,
	primary key (id)
)
go

create table participants (
	event_id int not null,
	[user_id] varchar(50) references users([id])
)
go

create table quality (
	lesson_id varchar(50) references lessons(id),
	tech_quality float null
)
go