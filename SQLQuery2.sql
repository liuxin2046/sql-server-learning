use teaching
/*查询学生平均年龄*/
select AVG(age) from student
/*学生年龄按降序排列*/
select sname,age from student order by age desc
/*统计学生选课门数*/
select sname,count(*) as number from student,score where student.studentno = score.studentno group by sname
/*模糊查询姓梁的学生*/
select * from student where sname like '梁%'
/*查询学生的选课情况*/
select sname,course.courseno from student,score,course where student.studentno = score.studentno and course.courseno = score.courseno