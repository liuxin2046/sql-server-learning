use teaching
/*��ѯѧ��ƽ������*/
select AVG(age) from student
/*ѧ�����䰴��������*/
select sname,age from student order by age desc
/*ͳ��ѧ��ѡ������*/
select sname,count(*) as number from student,score where student.studentno = score.studentno group by sname
/*ģ����ѯ������ѧ��*/
select * from student where sname like '��%'
/*��ѯѧ����ѡ�����*/
select sname,course.courseno from student,score,course where student.studentno = score.studentno and course.courseno = score.courseno