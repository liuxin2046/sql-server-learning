/*查询在计算机0901的学生姓名*/
use teaching
select sname from student where (classno = any(select classno from class where classname = '计算机0901'));
/*查询男女同学的平均年龄*/
select sex ,AVG(age) as averageAge from student group by sex;
update score set usually = 0 where studentno = '16122221324';
select * from score;
/*查询所有学生的学号,姓名,选课名称及成绩*/
select student.studentno,student.sname,score.courseno,score.usually from student left outer join score on student.studentno = score.studentno;