--1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT * 
FROM `students`
INNER JOIN `degrees`
         ON `degrees`.`id`=`students`.`degree_id`
WHERE `degrees`.`name`="Corso di Laurea in Economia";

--2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
SELECT * 
FROM `degrees`
INNER JOIN `departments`
        ON `departments`.`id`=`degrees`.`department_id`
WHERE `degrees`.`level`="magistrale"
AND `departments`.`name`="Dipartimento di Neuroscienze";

--3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT * FROM `teachers`
INNER JOIN `course_teacher`
       ON `teachers`.`id`=`course_teacher`.`teacher_id`
INNER JOIN `courses`
       ON `course_teacher`.`course_id`=`courses`.`id`
WHERE `teachers`.`id`=44;
--4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e 
--ilrelativo dipartimento, in ordine alfabetico per cognome e nome
SELECT *
FROM `students`
INNER JOIN `degrees`
        ON `students`.`degree_id`=`degrees`.`id`
INNER JOIN `departments`
        ON `departments`.`id`=`degrees`.`department_id`
ORDER BY `students`.`surname` ASC,
         `students`.`name` ASC
--5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT * 
FROM `degrees`
INNER JOIN `courses`
        ON `degrees`.`id`=`courses`.`degree_id`
INNER JOIN `course_teacher`
        ON `course_teacher`.`course_id`=`courses`.`id`
INNER JOIN `teachers`
        ON `teachers`.`id`=`course_teacher`.`teacher_id`;
--6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
--versione non funzionante
SELECT DISTINCT * FROM `teachers`
INNER JOIN `course_teacher`
       ON `teachers`.`id`=`course_teacher`.`teacher_id`
INNER JOIN `courses`
       ON `course_teacher`.`course_id`=`courses`.`id`
INNER JOIN `degrees`
       ON `degrees`.`id`=`courses`.`degree_id`
INNER JOIN `departments`
       ON `departments`.`id`=`degrees`.`department_id`
WHERE `departments`.`name`="Dipartimento di Matematica";
--versione funzionante
SELECT DISTINCT `course_teacher`.`teacher_id` AS `id_PROF`,
`teachers`.`name`,
`teachers`.`surname`

FROM `teachers`
INNER JOIN `course_teacher`
       ON `teachers`.`id`=`course_teacher`.`teacher_id`
INNER JOIN `courses`
       ON `course_teacher`.`course_id`=`courses`.`id`
INNER JOIN `degrees`
       ON `degrees`.`id`=`courses`.`degree_id`
INNER JOIN `departments`
       ON `departments`.`id`=`degrees`.`department_id`
WHERE `departments`.`name`="Dipartimento di Matematica";
--7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto persuperare ciascuno dei suoi esami
SELECT `students`.`id`, `students`.`name`, `students`.`surname`, `courses`.`name`,
 COUNT(`exam_student`.`vote`) AS `numero_tentativi`,
  MAX(`exam_student`.`vote`) AS `voto_massimo` 
  FROM `students` 
  JOIN `exam_student`
   ON `students`.`id` = `exam_student`.`student_id` 
   JOIN `exams` ON `exam_student`.`exam_id` = `exams`.`id` 
   JOIN `courses` ON `exams`.`course_id` = `courses`.`id`
    GROUP BY `students`.`id`, `courses`.`id`
     HAVING `voto_massimo` >= 18
