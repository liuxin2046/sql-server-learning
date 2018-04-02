create function fun1()
returns int 
as
begin 
declare @n int
select @n=3
return @n
end
use teaching
create function score_table(
@student_id char(20))
returns @t_score table
(cname varchar(20),
	usually int
)
as
begin
insert into @t_score
select cname,usually 
from score,course where score.courseno = course.courseno and score.studentno = @student_id and usually < 60
return
end
select * from score_table('16122210009');