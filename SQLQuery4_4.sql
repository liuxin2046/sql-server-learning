use teaching
declare @sname varchar(30),@s varchar(400)
declare stu_cursor cursor
for
select sname from student 
open stu_cursor
fetch next from stu_cursor
into @s
while @@FETCH_STATUS = 0
begin 
fetch next from stu_cursor
into @sname
set @s = LTRIM(RTRIM(@s))+','+LTRIM(RTRIM(@sname))
end
print @s
close stu_cursor
deallocate stu_cursor
go