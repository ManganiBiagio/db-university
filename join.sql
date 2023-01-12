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

--5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
--6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
--7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto persuperare ciascuno dei suoi esami