USE medisistema;

-- tipo_medico (3)
INSERT INTO tipo_medico (nombre) VALUES
('Titular'), ('Interino'), ('Sustituto');

-- especialidad (5)
INSERT INTO especialidad (nombre) VALUES
('Medicina General'), ('Pediatria'), ('Cardiologia'), ('Ginecologia'), ('Traumatologia');

-- tip_empleado (4)
INSERT INTO tip_empleado (nombre_tipo) VALUES
('ATS'), ('Auxiliar de enfermeria'), ('Celador'), ('Administrativo');

-- medico (10)
INSERT INTO medico (nombre, apellido, edad, experiencia, especialidadID, tipo_medicoID) VALUES
('Pepe1',   'Perez1', 52, 25, 1, 1),
('Pepe2',   'Perez2', 45, 18, 2, 1),
('Juana1',  'Gomez1', 48, 20, 3, 1),
('Juana2',  'Gomez2', 39, 12, 4, 1),
('Luis1',   'Rojas1', 55, 28, 5, 1),
('Luis2',   'Rojas2', 41, 14, 3, 1),
('Ana1',    'Torres1', 34,  8, 1, 2),
('Ana2',    'Torres2', 36,  9, 2, 2),
('Carlos1', 'Diaz1',  29,  3, 1, 3),
('Carlos2', 'Diaz2',  31,  5, 3, 3);

-- horario_medico (28)
INSERT INTO horario_medico (medicoID, dia_semana, hora_inicio, hora_fin) VALUES
(1, 'Lunes',     '08:00', '14:00'),
(1, 'Martes',    '08:00', '14:00'),
(1, 'Miercoles', '08:00', '14:00'),
(1, 'Jueves',    '08:00', '14:00'),
(1, 'Viernes',   '08:00', '14:00'),
(2, 'Lunes',     '07:00', '13:00'),
(2, 'Martes',    '07:00', '13:00'),
(2, 'Jueves',    '07:00', '13:00'),
(3, 'Martes',    '08:00', '16:00'),
(3, 'Jueves',    '08:00', '16:00'),
(3, 'Sabado',    '08:00', '12:00'),
(4, 'Lunes',     '09:00', '15:00'),
(4, 'Miercoles', '09:00', '15:00'),
(4, 'Viernes',   '09:00', '15:00'),
(5, 'Lunes',     '14:00', '18:00'),
(5, 'Miercoles', '14:00', '18:00'),
(5, 'Viernes',   '14:00', '18:00'),
(6, 'Martes',    '08:00', '12:00'),
(6, 'Jueves',    '08:00', '12:00'),
(7, 'Lunes',     '13:00', '19:00'),
(7, 'Martes',    '13:00', '19:00'),
(7, 'Miercoles', '13:00', '19:00'),
(8, 'Miercoles', '08:00', '14:00'),
(8, 'Viernes',   '08:00', '14:00'),
(9, 'Lunes',     '08:00', '14:00'),
(9, 'Jueves',    '08:00', '14:00'),
(10, 'Martes',   '14:00', '20:00'),
(10, 'Viernes',  '14:00', '20:00');

-- sustitucion (8)
INSERT INTO sustitucion (medico_sustitutoID, medico_sustituidoID, fecha_inicio, fecha_fin) VALUES
(9,  1, '2026-01-10', '2026-01-31'),
(9,  2, '2026-03-01', '2026-03-15'),
(10, 3, '2026-02-01', '2026-02-20'),
(10, 4, '2026-04-05', '2026-04-25'),
(7,  6, '2026-05-10', '2026-05-24'),
(10, 1, '2026-09-01', '2026-10-15'),
(9,  3, '2026-09-10', '2026-09-30'),
(8,  2, '2026-09-14', '2026-09-25');

-- empleado (10)
INSERT INTO empleado (nombre, apellido, edad, experiencia, tip_empleadoID) VALUES
('Rosa1', 'Ruiz1',   30,  6, 1),
('Rosa2', 'Ruiz2',   42, 15, 1),
('Hugo1', 'Cruz1',   27,  3, 2),
('Hugo2', 'Cruz2',   35,  9, 2),
('Lina1', 'Mejia1',  50, 22, 2),
('Lina2', 'Mejia2',  38, 10, 3),
('Jose1', 'Vega1',   45, 17, 3),
('Jose2', 'Vega2',   32,  7, 4),
('Nora1', 'Cano1',   28,  4, 4),
('Nora2', 'Cano2',   47, 20, 4);

-- pacientes (12)
INSERT INTO pacientes (nombre, apellido, edad, medicoID) VALUES
('Maria1',  'Suarez1', 34, 1),
('Maria2',  'Suarez2', 61, 1),
('Mateo1',  'Pardo1',  28, 1),
('Mateo2',  'Pardo2',  45, 1),
('Sara1',   'Leon1',   10, 2),
('Sara2',   'Leon2',    4, 2),
('Tomas1',  'Bernal1', 58, 3),
('Tomas2',  'Bernal2', 66, 3),
('Elena1',  'Duarte1', 31, 4),
('Elena2',  'Duarte2', 37, 5),
('Oscar1',  'Gil1',    49, 6),
('Oscar2',  'Gil2',     9, 8);

-- citas (10)
INSERT INTO citas (medicoID, pacientesID, empleadoID, fecha_cita, hora_cita) VALUES
(1, 1,  8,  '2026-09-01', '09:00'),
(1, 2,  8,  '2026-09-02', '10:30'),
(1, 1,  9,  '2026-09-08', '09:30'),
(2, 5,  9,  '2026-09-03', '08:00'),
(2, 6,  9,  '2026-09-08', '08:30'),
(3, 7,  10, '2026-09-08', '09:00'),
(4, 9,  8,  '2026-09-09', '10:00'),
(5, 10, 10, '2026-09-11', '15:00'),
(7, 3,  9,  '2026-09-14', '14:00'),
(9, 7,  8,  '2026-09-17', '09:00');

-- vacaciones_empleados (10)
INSERT INTO vacaciones_empleados (empleadoID, tipo, fecha_inicio, fecha_regreso, lugar) VALUES
(1,  'disfrutada',  '2026-01-05', '2026-01-15', 'Cartagena'),
(1,  'planificada', '2026-12-15', '2026-12-30', 'Santa Marta'),
(2,  'disfrutada',  '2026-03-30', '2026-04-10', 'San Andres'),
(3,  'disfrutada',  '2026-07-01', '2026-07-08', 'Medellin'),
(4,  'planificada', '2026-10-05', '2026-10-12', 'Villa de Leyva'),
(5,  'disfrutada',  '2026-02-02', '2026-02-17', 'Cali'),
(6,  'disfrutada',  '2026-06-15', '2026-06-22', 'Bogota'),
(8,  'planificada', '2026-11-20', '2026-12-05', 'Barichara'),
(9,  'disfrutada',  '2026-08-03', '2026-08-10', 'Barichara'),
(10, 'disfrutada',  '2026-04-20', '2026-05-01', 'Eje Cafetero');

-- vacaciones_medicos (8)
INSERT INTO vacaciones_medicos (medicoID, tipo, fecha_inicio, fecha_regreso, lugar) VALUES
(1,  'disfrutada',  '2026-01-10', '2026-01-31', 'Cartagena'),
(2,  'disfrutada',  '2026-03-01', '2026-03-15', 'San Gil'),
(3,  'disfrutada',  '2026-02-01', '2026-02-20', 'Santa Marta'),
(4,  'disfrutada',  '2026-04-05', '2026-04-25', 'Madrid'),
(5,  'disfrutada',  '2026-06-01', '2026-06-30', 'Cancun'),
(6,  'planificada', '2026-12-10', '2026-12-31', 'Medellin'),
(3,  'planificada', '2026-12-20', '2027-01-05', 'San Andres'),
(10, 'disfrutada',  '2026-05-04', '2026-05-11', 'Barranquilla');