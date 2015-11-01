select distinct * into tmp from gtfs_agency;
delete from gtfs_agency;
insert into gtfs_agency select * from tmp;
drop table tmp;

select distinct * into tmp from gtfs_calendar;
delete from gtfs_calendar;
insert into gtfs_calendar select * from tmp;
drop table tmp;

select distinct * into tmp from gtfs_calendar_dates;
delete from gtfs_calendar_dates;
insert into gtfs_calendar_dates select * from tmp;
drop table tmp;

select distinct * into tmp from gtfs_routes;
delete from gtfs_routes;
insert into gtfs_routes select * from tmp;
drop table tmp;

select distinct * into tmp from gtfs_shapes;
delete from gtfs_shapes;
insert into gtfs_shapes select * from tmp;
drop table tmp;

select distinct * into tmp from gtfs_stop_times;
delete from gtfs_stop_times;
insert into gtfs_stop_times select * from tmp;
drop table tmp;

select distinct * into tmp from gtfs_stops;
delete from gtfs_stops;
insert into gtfs_stops select * from tmp;
drop table tmp;

select distinct * into tmp from gtfs_transfers;
delete from gtfs_transfers;
insert into gtfs_transfers select * from tmp;
drop table tmp;

select distinct * into tmp from gtfs_trips;
delete from gtfs_trips;
insert into gtfs_trips select * from tmp;
drop table tmp;
