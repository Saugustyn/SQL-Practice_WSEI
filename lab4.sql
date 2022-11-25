--12.01
SELECT m.module_id, m.module_name FROM modules m 
LEFT JOIN students_modules sm ON m.module_id = sm.module_id
WHERE sm.student_id IS NULL
ORDER BY m.module_id DESC

--12.02
SELECT m.module_id, m.module_name, e.surname FROM modules m 
LEFT JOIN students_modules sm ON m.module_id = sm.module_id
LEFT JOIN employees e ON m.lecturer_id = e.employee_id
WHERE sm.student_id IS NULL
ORDER BY m.module_id DESC

--12.03
SELECT e.employee_id AS lecturer_id, e.surname FROM employees e
JOIN lecturers l ON e.employee_id= l.lecturer_id
LEFT JOIN modules m ON l.lecturer_id = m.lecturer_id
ORDER BY e.surname ASC

--12.04
SELECT e.employee_id, e.first_name, e.surname FROM employees e
JOIN lecturers l ON e.employee_id= l.lecturer_id
ORDER BY e.surname ASC

--12.05
SELECT e.employee_id, e.first_name, e.surname FROM employees e
LEFT JOIN lecturers l ON e.employee_id= l.lecturer_id
WHERE l.lecturer_id IS NULL
ORDER BY e.surname ASC

--12.06
SELECT s.student_id, first_name, surname, group_no FROM students s
LEFT JOIN students_modules sm ON s.student_id = sm.student_id
WHERE sm.student_id IS NULL
ORDER BY surname, first_name DESC

--12.07
SELECT DISTINCT s.student_id, first_name, surname, group_no, gs.exam_date FROM students s
JOIN student_grades gs ON s.student_id = gs.student_id
ORDER BY gs.exam_date ASC

--12.08
SELECT module_name, no_of_hours, employee_id, first_name, surname FROM modules m
LEFT JOIN employees e ON m.lecturer_id = e.employee_id
ORDER BY module_name, surname, first_name ASC

--12.09
SELECT s.student_id, first_name, surname FROM students s
JOIN students_modules sm ON s.student_id = sm.student_id
JOIN modules m ON m.module_id = sm.module_id
WHERE m.module_name LIKE 'Statistics'
ORDER BY s.surname, S.first_name ASC

--12.10
SELECT first_name, surname, acad_position FROM employees e
JOIN lecturers l ON e.employee_id = l.lecturer_id
WHERE department LIKE 'Department of Informatics'
ORDER BY surname, first_name ASC

--12.11
SELECT first_name, surname, department FROM employees e
LEFT JOIN lecturers l ON e.employee_id = l.lecturer_id
ORDER BY surname ASC, first_name DESC

--12.12
SELECT first_name, surname, department FROM employees e
JOIN lecturers l ON e.employee_id = l.lecturer_id
ORDER BY surname ASC, first_name DESC

--12.13
SELECT first_name, surname, acad_position FROM employees e
JOIN lecturers l ON e.employee_id = l.lecturer_id
LEFT JOIN modules m ON m.lecturer_id = l.lecturer_id
WHERE m.lecturer_id IS NULL
ORDER BY acad_position DESC

--12.14
SELECT s.first_name, s.surname, m.module_name, e.surname AS lecturer_surname, l.department  FROM students s
LEFT JOIN students_modules sm ON s.student_id = sm.student_id
LEFT JOIN modules m ON sm.module_id = m.module_id
LEFT JOIN lecturers l ON m.lecturer_id = l.lecturer_id
LEFT JOIN employees e ON e.employee_id = l.lecturer_id
ORDER BY m.module_name DESC, lecturer_surname ASC

--12.15
SELECT SUM(no_of_hours) FROM modules m
LEFT JOIN lecturers l ON l.lecturer_id = m.lecturer_id
WHERE m.lecturer_id IS NULL OR l.acad_position IS NULL

--12.16
SELECT m.module_id, m.module_name, l.department  FROM modules m
LEFT JOIN lecturers l ON l.lecturer_id = m.lecturer_id
WHERE m.lecturer_id IS NULL OR l.acad_position IS NULL

--12.17
SELECT m.module_name, m.no_of_hours, e.surname, l.department FROM modules m
LEFT JOIN lecturers l ON l.lecturer_id = m.lecturer_id
JOIN employees e ON e.employee_id = l.lecturer_id
WHERE m.module_name collate polish_CS_as LIKE 'computer%'
ORDER BY e.surname

--12.18
SELECT m.module_name, m.no_of_hours, e.surname, l.department FROM modules m
LEFT JOIN lecturers l ON l.lecturer_id = m.lecturer_id
LEFT JOIN employees e ON e.employee_id = l.lecturer_id
WHERE m.module_name collate polish_CS_as LIKE 'Computer%'
ORDER BY e.surname

--12.19
SELECT s.student_id, s.first_name, S.surname, sg.grade, m.module_name FROM students s
JOIN students_modules sm ON sm.student_id = s.student_id
JOIN modules m ON m.module_id = sm.module_id
LEFT JOIN student_grades sg ON sg.student_id = sm.student_id
AND sm.module_id = sg.module_id
WHERE sg.student_id IS NULL
ORDER BY s.student_id ASC

--12.20
SELECT s.student_id, s.first_name, S.surname, sg.grade, m.module_name FROM students s
JOIN students_modules sm ON sm.student_id = s.student_id
JOIN modules m ON m.module_id = sm.module_id
JOIN student_grades sg ON sg.student_id = sm.student_id
AND sm.module_id = sg.module_id
ORDER BY s.student_id ASC

--12.21
SELECT m.module_name FROM modules m
LEFT JOIN lecturers l ON m.lecturer_id = l.lecturer_id
WHERE m.department != l.department

-- 12.22
select e.surname, e.first_name, e.PESEL, m.module_name, 'wykładowca' as siema
from lecturers l
LEFT join employees e on l.lecturer_id = e.employee_id
INNER join modules m on l.lecturer_id = m.lecturer_id
union
select s.surname, s.first_name, s.group_no, m.module_name, 'student' as siema
from students s
LEFT join students_modules sm on s.student_id = sm.student_id
LEFT join modules m on sm.module_id = m.module_id
order by m.module_name asc, siema asc




