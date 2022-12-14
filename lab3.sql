--11.01 
--a)
SELECT 34+NULL
--null

--b)
SELECT * FROM employees WHERE PESEL IS NULL OR employment_date IS NULL

--c)
SELECT * FROM students_modules

--d)
SELECT DATEDIFF(DAY,PLANNED_EXAM_DATE, GETDATE()) numberOfDays FROM students_modules
ORDER BY planned_exam_date DESC

--e)
SELECT COUNT(planned_exam_date) FROM students_modules

--f)
SELECT COUNT(*) FROM students_modules

--11.02
--a)
SELECT DISTINCT student_id, exam_date FROM student_grades
ORDER BY exam_date DESC

--b)
SELECT DISTINCT student_id FROM student_grades
WHERE YEAR(exam_date) = 2018 AND MONTH(exam_date) = 3
ORDER BY student_id DESC

--11.04
--COALESCE
SELECT module_name, lecturer_id FROM modules
WHERE lecturer_id = 8 OR COALESCE(lecturer_id, 0) = 0

--SARG
SELECT module_name, lecturer_id FROM modules
WHERE lecturer_id = 8 OR lecturer_id IS NULL

--11.05
--a)CAST
SELECT CAST('ABC' AS INT)

--B)
SELECT TRY_CAST('ABC' AS INT) AS RESULT

--11.06
SELECT CONVERT(VARCHAR(20),GETDATE(),102) --3 ARGUMENT TO FORMAT DATY

--11.07
--a)
SELECT * FROM groups WHERE group_no LIKE 'DM%'
--b)
SELECT * FROM groups WHERE group_no NOT LIKE '%10%'
--c)
SELECT * FROM groups WHERE group_no  LIKE '_M%'
--d)
SELECT * FROM groups WHERE group_no LIKE '%0_'
--e)
SELECT * FROM groups WHERE group_no LIKE '%[12]'
--f)
SELECT * FROM groups WHERE group_no LIKE '[^D]%'
--g)
SELECT * FROM groups WHERE group_no LIKE '_[A-P]%'

--11.08
--a)
SELECT * FROM groups  where group_no LIKE '%o%'

--b)
SELECT * FROM groups  where group_no collate polish_CS_as LIKE'%O%'

--c)
SELECT * FROM groups  where group_no LIKE '__i%'

--d)
SELECT * FROM groups  where group_no collate polish_CS_as LIKE '__i%'

--11.10
SELECT DISTINCT surname, group_no
FROM students
ORDER BY group_no DESC

--11.11
--a)
SELECT TOP(5) WITH TIES * FROM student_grades 
ORDER BY exam_date ASC

--b)
SELECT TOP(5) * FROM student_grades 
ORDER BY exam_date ASC

--11.12
--a
SELECT COUNT(*) FROM student_grades
--b)
SELECT TOP 20 PERCENT * FROM student_grades
ORDER BY exam_date

--c)
SELECT * FROM student_grades
ORDER BY exam_date ASC
OFFSET 6 ROWS 
FETCH NEXT 10 ROWS ONLY

--d)
SELECT * FROM student_grades
ORDER BY exam_date ASC
OFFSET 20 ROWS

--11.13
--a)
SELECT surname FROM students
UNION
SELECT surname FROM employees
ORDER BY surname

--b)
SELECT * FROM students
UNION ALL
SELECT * FROM employees
ORDER BY surname

--c)
SELECT surname
FROM students
EXCEPT
SELECT surname
FROM employees
ORDER BY surname

--d)
SELECT surname
FROM students
INTERSECT
SELECT surname
FROM employees
ORDER BY surname


--e)
SELECT department
FROM departments
EXCEPT
SELECT department
FROM modules


--f)
SELECT module_id
FROM modules
EXCEPT
SELECT preceding_module
FROM modules


--g)
SELECT student_id, module_id FROM students_modules
EXCEPT --r????nica
SELECT student_id, module_id FROM student_grades

--h)
SELECT student_id
FROM students_modules
WHERE module_id=3
INTERSECT
SELECT student_id
FROM students_modules
WHERE module_id=12


--i)
SELECT surname, first_name, group_no AS group_department
FROM students
WHERE group_no LIKE 'DMIe%'
UNION
SELECT surname, first_name, department
FROM lecturers INNER JOIN employees ON lecturer_id=employee_id
ORDER BY group_department


