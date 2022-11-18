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





