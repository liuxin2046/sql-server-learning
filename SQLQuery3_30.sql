use teaching
if(select avg(usually) from score where studentno='16122210009') >60 
begin 
print 'Pass!'
end

declare @message varchar(255)
if exists (select * from student where studentno = '16122210009')
set @message = '����ѧ��Ϊ16122210009��ѧ��'
else 
set  @message = '������ѧ��Ϊ16122210009��ѧ��'
print @message

select studentno,sex = case sex when '��' then 'M'
when 'Ů' then 'F'
end 
from student
/*����1��100֮�������ܱ�3��������ĸ������ܺ�*/
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