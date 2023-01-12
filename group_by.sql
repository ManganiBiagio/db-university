--1. Contare quanti iscritti ci sono stati ogni anno
SELECT COUNT(`id`) AS `totale_iscritti`,
       YEAR(`enrolment_date`) AS `anno_di_iscrizione`
FROM `students`
GROUP BY YEAR(`enrolment_date`);
--2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT COUNT(`id`) , 
       `office_address`
FROM `teachers`
GROUP BY `office_address`;
--3. Calcolare la media dei voti di ogni appello d'esame
SELECT `course_id`,
       AVG(`exam_student`.`vote`)
FROM `exams`
INNER JOIN `exam_student`
        ON `exam_student`.`exam_id`=`exams`.`id`
GROUP BY `course_id`;
--4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT `departments`.`name`,COUNT(`degrees`.`department_id`)
FROM `departments`
INNER JOIN `degrees`
      ON `degrees`.`department_id`=`departments`.`id`
GROUP BY `degrees`.`department_id`;