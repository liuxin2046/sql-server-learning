/*��ѯ�ڼ����0901��ѧ������*/
use teaching
select sname from student where (classno = any(select classno from class where classname = '�����0901'));
/*��ѯ��Ůͬѧ��ƽ������*/
select sex ,AVG(age) as averageAge from student group by sex;
update score set usually = 0 where studentno = '16122221324';
select * from score;
/*��ѯ����ѧ����ѧ��,����,ѡ�����Ƽ��ɼ�*/
select student.studentno,student.sname,score.courseno,score.usually from student left outer join score on student.studentno = score.studentno;