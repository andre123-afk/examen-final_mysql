DROP DATABASE IF EXISTS medisistema;
CREATE DATABASE medisistema CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE medisistema;

CREATE TABLE tipo_medico (
    tipo_medicoID INT AUTO_INCREMENT PRIMARY KEY,
    nombre        VARCHAR(30) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE especialidad (
    especialidadID INT AUTO_INCREMENT PRIMARY KEY,
    nombre         VARCHAR(50) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE tip_empleado (
    tip_empleadoID INT AUTO_INCREMENT PRIMARY KEY,
    nombre_tipo    VARCHAR(50) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE medico (
    medicoID       INT AUTO_INCREMENT PRIMARY KEY,
    nombre         VARCHAR(50) NOT NULL,
    apellido       VARCHAR(50) NOT NULL,
    edad           TINYINT UNSIGNED NOT NULL,
    experiencia    TINYINT UNSIGNED NOT NULL,
    especialidadID INT NOT NULL,
    tipo_medicoID  INT NOT NULL,
    CONSTRAINT fk_medico_especialidad FOREIGN KEY (especialidadID) REFERENCES especialidad (especialidadID),
    CONSTRAINT fk_medico_tipo         FOREIGN KEY (tipo_medicoID)  REFERENCES tipo_medico (tipo_medicoID)
) ENGINE=InnoDB;

CREATE TABLE horario_medico (
    horarioID   INT AUTO_INCREMENT PRIMARY KEY,
    medicoID    INT NOT NULL,
    dia_semana  ENUM('Lunes','Martes','Miercoles','Jueves','Viernes','Sabado') NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin    TIME NOT NULL,
    CONSTRAINT fk_horario_medico FOREIGN KEY (medicoID) REFERENCES medico (medicoID),
    CONSTRAINT chk_horario_horas CHECK (hora_fin > hora_inicio)
) ENGINE=InnoDB;

CREATE TABLE sustitucion (
    sustitucionID        INT AUTO_INCREMENT PRIMARY KEY,
    medico_sustitutoID   INT NOT NULL,
    medico_sustituidoID  INT NOT NULL,
    fecha_inicio         DATE NOT NULL,
    fecha_fin            DATE NOT NULL,
    CONSTRAINT fk_sust_sustituto  FOREIGN KEY (medico_sustitutoID)  REFERENCES medico (medicoID),
    CONSTRAINT fk_sust_sustituido FOREIGN KEY (medico_sustituidoID) REFERENCES medico (medicoID),
    CONSTRAINT chk_sust_fechas CHECK (fecha_fin >= fecha_inicio)
) ENGINE=InnoDB;

CREATE TABLE empleado (
    empleadoID     INT AUTO_INCREMENT PRIMARY KEY,
    nombre         VARCHAR(50) NOT NULL,
    apellido       VARCHAR(50) NOT NULL,
    edad           TINYINT UNSIGNED NOT NULL,
    experiencia    TINYINT UNSIGNED NOT NULL,
    tip_empleadoID INT NOT NULL,
    CONSTRAINT fk_empleado_tipo FOREIGN KEY (tip_empleadoID) REFERENCES tip_empleado (tip_empleadoID)
) ENGINE=InnoDB;

CREATE TABLE pacientes (
    pacientesID INT AUTO_INCREMENT PRIMARY KEY,
    nombre      VARCHAR(50) NOT NULL,
    apellido    VARCHAR(50) NOT NULL,
    edad        TINYINT UNSIGNED NOT NULL,
    medicoID    INT NOT NULL,
    CONSTRAINT fk_paciente_medico FOREIGN KEY (medicoID) REFERENCES medico (medicoID)
) ENGINE=InnoDB;

CREATE TABLE citas (
    citaID      INT AUTO_INCREMENT PRIMARY KEY,
    medicoID    INT NOT NULL,
    pacientesID INT NOT NULL,
    empleadoID  INT NOT NULL,
    fecha_cita  DATE NOT NULL,
    hora_cita   TIME NOT NULL,
    CONSTRAINT fk_cita_medico   FOREIGN KEY (medicoID)    REFERENCES medico (medicoID),
    CONSTRAINT fk_cita_paciente FOREIGN KEY (pacientesID) REFERENCES pacientes (pacientesID),
    CONSTRAINT fk_cita_empleado FOREIGN KEY (empleadoID)  REFERENCES empleado (empleadoID)
) ENGINE=InnoDB;

CREATE TABLE vacaciones_empleados (
    vacaciones_emple_ID INT AUTO_INCREMENT PRIMARY KEY,
    empleadoID     INT NOT NULL,
    tipo           ENUM('planificada','disfrutada') NOT NULL,
    fecha_inicio   DATE NOT NULL,
    fecha_regreso  DATE NOT NULL,
    lugar          VARCHAR(80) NOT NULL,
    duracion_dias  INT GENERATED ALWAYS AS (DATEDIFF(fecha_regreso, fecha_inicio)) STORED,
    CONSTRAINT fk_vacemp_empleado FOREIGN KEY (empleadoID) REFERENCES empleado (empleadoID),
    CONSTRAINT chk_vacemp_fechas CHECK (fecha_regreso > fecha_inicio)
) ENGINE=InnoDB;

CREATE TABLE vacaciones_medicos (
    vacaciones_medicoID INT AUTO_INCREMENT PRIMARY KEY,
    medicoID       INT NOT NULL,
    tipo           ENUM('planificada','disfrutada') NOT NULL,
    fecha_inicio   DATE NOT NULL,
    fecha_regreso  DATE NOT NULL,
    lugar          VARCHAR(80) NOT NULL,
    duracion_dias  INT GENERATED ALWAYS AS (DATEDIFF(fecha_regreso, fecha_inicio)) STORED,
    CONSTRAINT fk_vacmed_medico FOREIGN KEY (medicoID) REFERENCES medico (medicoID),
    CONSTRAINT chk_vacmed_fechas CHECK (fecha_regreso > fecha_inicio)
) ENGINE=InnoDB;