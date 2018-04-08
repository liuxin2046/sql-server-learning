create function fn_view(
@cname char(20))
returns table
as
return 
(select sname from student where studentno in (select studentno from score where courseno in (select courseno from course where cname = @cname)))


declare @ee varchar(20) set @ee = 'C”Ô—‘' select * from fn_view (@ee);

create function averv(@courseno varchar(12)) returns int as
begin
declare @aver int
select @aver = 
(
select avg(usually)
from score 
where courseno = @courseno
group by courseno
)
return @aver
end

declare @e varchar(20) set @e = 'c05103' select * from averv(@e);
