use teaching
if(select avg(usually) from score where studentno='16122210009') >60 
begin 
print 'Pass!'
end

declare @message varchar(255)
if exists (select * from student where studentno = '16122210009')
set @message = '存在学号为16122210009的学生'
else 
set  @message = '不存在学号为16122210009的学生'
print @message

select studentno,sex = case sex when '男' then 'M'
when '女' then 'F'
end 
from student
/*计算1到100之间所有能被3整除的书的个数及总和*/
declare @a smallint,@i smallint,@nums smallint
set @a = 0;
set @i = 1;
set @nums = 0;
while (@i <= 100)
begin 
if(@i % 3 = 0)
begin
set @a += @i;
set @nums += 1;
end 
set @i += 1;
end 
print @a;
print @nums;