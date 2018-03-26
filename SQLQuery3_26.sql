/*查询了选修C语言的学生姓名*/
use teaching
select score.studentno from score,course where score.courseno = course.courseno and cname='C语言';
select sname from student where studentno in (select score.studentno from score,course where score.courseno = course.courseno and cname='C语言');
/*所有学生所选课程的老师*/
select student.sname,score.courseno,teacher.tname from student,score,teach_class,teacher where student.studentno = score.studentno and score.courseno = teach_class.courseno and teach_class.teacherno = teacher.teacherno;