USE medisistema;

-- 1. Numero de pacientes atendidos por cada medico
SELECT m.medicoID,
       CONCAT(m.nombre, ' ', m.apellido)  AS medico,
       COUNT(DISTINCT c.pacientesID)      AS pacientes_atendidos
FROM medico m
LEFT JOIN citas c ON c.medicoID = m.medicoID
GROUP BY m.medicoID, medico
ORDER BY pacientes_atendidos DESC, medico;


-- 2. Total de dias de vacaciones planificadas y disfrutadas por cada empleado
SELECT e.empleadoID,
       CONCAT(e.nombre, ' ', e.apellido) AS empleado,
       COALESCE(SUM(CASE WHEN v.tipo = 'planificada' THEN v.duracion_dias END), 0) AS dias_planificados,
       COALESCE(SUM(CASE WHEN v.tipo = 'disfrutada'  THEN v.duracion_dias END), 0) AS dias_disfrutados
FROM empleado e
LEFT JOIN vacaciones_empleados v ON v.empleadoID = e.empleadoID
GROUP BY e.empleadoID, empleado
ORDER BY e.empleadoID;


-- 3. Medicos con mayor cantidad de horas de consulta en la semana
WITH horas_semana AS (
    SELECT m.medicoID,
           CONCAT(m.nombre, ' ', m.apellido) AS medico,
           SUM(TIME_TO_SEC(TIMEDIFF(h.hora_fin, h.hora_inicio))) / 3600 AS horas_semana
    FROM medico m
    JOIN horario_medico h ON h.medicoID = m.medicoID
    GROUP BY m.medicoID, medico
)
SELECT medicoID, medico, horas_semana
FROM horas_semana
WHERE horas_semana = (SELECT MAX(horas_semana) FROM horas_semana);


-- 4. Numero de sustituciones realizadas por cada medico sustituto
SELECT m.medicoID,
       CONCAT(m.nombre, ' ', m.apellido) AS medico_sustituto,
       t.nombre                          AS tipo_medico,
       COUNT(s.sustitucionID)            AS total_sustituciones
FROM sustitucion s
JOIN medico m       ON m.medicoID = s.medico_sustitutoID
JOIN tipo_medico t  ON t.tipo_medicoID = m.tipo_medicoID
GROUP BY m.medicoID, medico_sustituto, t.nombre
ORDER BY total_sustituciones DESC;


-- 5. Numero de medicos que estan actualmente en sustitucion
SELECT COUNT(DISTINCT medico_sustituidoID) AS medicos_en_sustitucion
FROM sustitucion
WHERE CURDATE() BETWEEN fecha_inicio AND fecha_fin;




-- 6. Horas totales de consulta por medico por dia de la semana
SELECT m.medicoID,
       CONCAT(m.nombre, ' ', m.apellido) AS medico,
       h.dia_semana,
       SUM(TIME_TO_SEC(TIMEDIFF(h.hora_fin, h.hora_inicio))) / 3600 AS horas_totales
FROM medico m
JOIN horario_medico h ON h.medicoID = m.medicoID
GROUP BY m.medicoID, medico, h.dia_semana
ORDER BY m.medicoID, FIELD(h.dia_semana, 'Lunes','Martes','Miercoles','Jueves','Viernes','Sabado');


-- 7. Medico con mayor cantidad de pacientes asignados
WITH asignados AS (
    SELECT m.medicoID,
           CONCAT(m.nombre, ' ', m.apellido) AS medico,
           COUNT(p.pacientesID)              AS pacientes_asignados
    FROM medico m
    LEFT JOIN pacientes p ON p.medicoID = m.medicoID
    GROUP BY m.medicoID, medico
)
SELECT medicoID, medico, pacientes_asignados
FROM asignados
WHERE pacientes_asignados = (SELECT MAX(pacientes_asignados) FROM asignados);