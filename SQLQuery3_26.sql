/*��ѯ��ѡ��C���Ե�ѧ������*/
use teaching
select score.studentno from score,course where score.courseno = course.courseno and cname='C����';
select sname from student where studentno in (select score.studentno from score,course where score.courseno = course.courseno and cname='C����');
/*����ѧ����ѡ�γ̵���ʦ*/
select student.sname,score.courseno,teacher.tname from student,score,teach_class,teacher where student.studentno = score.studentno and score.courseno = teach_class.courseno and teach_class.teacherno = teacher.teacherno;