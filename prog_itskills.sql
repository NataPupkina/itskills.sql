CREATE TABLE m_natali.students
(
student_id number,
department_id number,
teacher_id number,
start_date date,
full_name varchar2 (100),
scholarship number);


comment on column m_natali.students.student_id is 'ІД студента';
comment on column m_natali.students.department_id is 'ІД кафедри';
comment on column m_natali.students.teacher_id is 'ІД викладача';
comment on column m_natali.students.start_date is 'Дата надходження';
comment on column m_natali.students.full_name is 'ПІБ студента';
comment on column m_natali.students.scholarship is 'Стипендія студента';


CREATE TABLE m_natali.departmens
(
department_id number,
department_name varchar2 (30),
block_id number
);

comment on column m_natali.departmens.department_id is 'ІД кафедри';
comment on column m_natali.departmens.department_name is 'Назва кафедри';
comment on column m_natali.departmens.block_id is 'ІД корпусу';

insert into m_natali.students
select *
from m_natali.students st
union
select 1, 50, 100,to_date('01.08.2019', 'dd.mm.yyyy'), 'Бєляєв Матвій Артемович', 700
from dual
union
select 2, 50, 100,to_date('22.08.2019', 'dd.mm.yyyy'), 'Блажевич Ігор Юрійович', 690
from dual
union
select 3, 50, 100,to_date('01.08.2019', 'dd.mm.yyyy'), 'Валієва Руфіна Рафаелівна', 690
from dual
union
select 4, 60, 200,to_date('22.08.2019', 'dd.mm.yyyy'), 'Височин Олександр Андрійович', 730
from dual
union
select 5, 60, 200,to_date('01.08.2019', 'dd.mm.yyyy'), 'Гріненко Олексій Олексійович', 740
from dual
union
select 6, 70, 300,to_date('22.08.2019', 'dd.mm.yyyy'), 'Жигляєв Родіон Олексійович', 790
from dual
union
select 7, 60, 200,to_date('01.08.2019', 'dd.mm.yyyy'), 'Журавльова Анастасія Сергіївна', 730
from dual
union
select 8, 60, 200,to_date('29.08.2019', 'dd.mm.yyyy'), 'Зіборов Кирило Вікторович', 720
from dual
union
select 9, 70, 300,to_date('29.07.2019', 'dd.mm.yyyy'), 'Колосов Дмитро Григорович', 800
from dual
union
select 10, 70, 300,to_date('28.07.2019', 'dd.mm.yyyy'), 'Червоник Олексій Володимирович', 790
from dual;

commit;

select st.student_id, st.teacher_id, st.start_date, st.full_name, st.scholarship, dp.department_name
from m_natali.students st
inner join m_natali.departmens dp
on st.department_id = dp.department_id;

select *
from m_natali.students st
where st.scholarship in (select max(st.scholarship)--, st.department_id
                        from m_natali.students st
                        GROUP by st.department_id);
