-- 3-1.把people表中school不是GDUFS的人全部找出来
select * from peoples where school !='GDUFS' or school is null;

-- 3-2.查找计算机系每次考试学生的平均成绩
select name,avg(grade) from student as T1 inner join department on T1.dept_name = department.dept_name inner join exam on T1.ID = exam.student_id where T1.dept_name = 'computer' group by name;

-- 3-3.查找女学霸
select name,avg(exam.grade) from student,exam where ID = student_id and sex = 'f' group by name having avg(exam.grade) >= 80;

-- 3-4.找出人数最少的院系以及其年度预算
select budget,count(*) from student,department where student.dept_name = department.dept_name group by student.dept_name order by count(*) asc limit 0,1;

-- 3-5.计算机系改名了，改成计算机科学系
update department set dept_name = 'comp.sci.' where dept_name = 'computer';

-- 3-6.修改每个系的年度预算，给系的每个学生发2000元奖金


-- 3-7.向department表中插入一条数据, dept_name属性的值为avg_budget, building为空, 年度预算为所有院系的年度预算平均值


-- 3-8.删除计算机系中考试成绩平均分低于70的学生.


-- 3-9.找出所有正在谈恋爱,但是学习成绩不佳(考试平均分低于75)的学生,强制将其情感状态改为单身.


-- 3-10.对每个学生, 往exam表格中插入名为Avg_Exam的考试, 考试分数为之前学生参加过考试的平均分.
