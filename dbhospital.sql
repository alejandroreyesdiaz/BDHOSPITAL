DROP TABLE Empleado CASCADE CONSTRAINTS;
DROP TABLE Empleado_Salario_Fijo CASCADE CONSTRAINTS;
DROP TABLE Empleado_Por_Hora CASCADE CONSTRAINTS;
DROP TABLE Doctor CASCADE CONSTRAINTS;
DROP TABLE Enfermero CASCADE CONSTRAINTS;
DROP TABLE Trabajador_Auxiliar CASCADE CONSTRAINTS;
DROP TABLE Portero CASCADE CONSTRAINTS;
DROP TABLE Personal_Limpieza CASCADE CONSTRAINTS;
DROP TABLE Cita CASCADE CONSTRAINTS;
DROP TABLE Centro_Atencion CASCADE CONSTRAINTS;
DROP TABLE Ala_Residencial CASCADE CONSTRAINTS;
DROP TABLE Habitacion CASCADE CONSTRAINTS;
DROP TABLE Sala CASCADE CONSTRAINTS;
DROP TABLE Cama CASCADE CONSTRAINTS;
DROP TABLE Turno CASCADE CONSTRAINTS;
DROP TABLE Turno_Empleado CASCADE CONSTRAINTS;
DROP TABLE Medico_General CASCADE CONSTRAINTS;
DROP TABLE Alta_Medica CASCADE CONSTRAINTS;
DROP TABLE Paciente CASCADE CONSTRAINTS;
DROP TABLE Paciente_Hospitalizado CASCADE CONSTRAINTS;
DROP TABLE Paciente_Ambulatorio CASCADE CONSTRAINTS;
DROP TABLE Lista_Espera CASCADE CONSTRAINTS;
DROP TABLE Familia CASCADE CONSTRAINTS;
DROP TABLE Receta CASCADE CONSTRAINTS;
DROP TABLE Agencia CASCADE CONSTRAINTS;
DROP TABLE Condicion_Medica CASCADE CONSTRAINTS;
DROP TABLE Tratamiento CASCADE CONSTRAINTS;
DROP TABLE Medicamento CASCADE CONSTRAINTS;
DROP TABLE Sesion_Prueba CASCADE CONSTRAINTS;
DROP TABLE Especialidad CASCADE CONSTRAINTS;
DROP TABLE Departamento CASCADE CONSTRAINTS;
DROP TABLE Diagnostico CASCADE CONSTRAINTS;
DROP TABLE Historia_Clinica CASCADE CONSTRAINTS;
DROP TABLE Consulta CASCADE CONSTRAINTS;
DROP TABLE Hospitalizacion CASCADE CONSTRAINTS;
DROP TABLE Cirugia CASCADE CONSTRAINTS;
DROP TABLE Procedimiento_Medico CASCADE CONSTRAINTS;
DROP TABLE Resultado_Prueba CASCADE CONSTRAINTS;
DROP TABLE Tipo_Prueba CASCADE CONSTRAINTS;
DROP TABLE Laboratorio CASCADE CONSTRAINTS;
DROP TABLE Alergia CASCADE CONSTRAINTS;
DROP TABLE Paciente_Alergia CASCADE CONSTRAINTS;
DROP TABLE Signo_Vital CASCADE CONSTRAINTS;
DROP TABLE Dosis_Medicamento CASCADE CONSTRAINTS;
DROP TABLE Medicamento_Proveedor CASCADE CONSTRAINTS;
DROP TABLE Proveedor CASCADE CONSTRAINTS;
DROP TABLE Factura CASCADE CONSTRAINTS;
DROP TABLE Detalle_Factura CASCADE CONSTRAINTS;
DROP TABLE Pago CASCADE CONSTRAINTS;
DROP TABLE Seguro_Medico CASCADE CONSTRAINTS;

    CREATE TABLE Empleado (
    id_empleado INT PRIMARY KEY,
    id_centro INT,
    nombre_empleado VARCHAR(255),
    direccion_empleado VARCHAR(255),
    contacto_empleado INT
    );
    
    CREATE TABLE Centro_Atencion (
    id_centro INT PRIMARY KEY,
    nombre_centro VARCHAR(255),
    direccion_centro VARCHAR(255),
    contacto_centro INT
    );
    
    CREATE TABLE Turno (
    id_turno INT PRIMARY KEY,
    nombre_turno VARCHAR(255)
    );
    
    CREATE TABLE Medico_General (
    id_medico_general INT PRIMARY KEY,
    nombre_medico VARCHAR(255),
    contacto_medico INT,
    direccion_medico VARCHAR(255)
    );
    
    CREATE TABLE Especialidad (
    id_especialidad INT PRIMARY KEY,
    nombre_especialidad VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255)
    );
    
    CREATE TABLE Departamento (
    id_departamento INT PRIMARY KEY,
    id_centro INT NOT NULL,
    nombre_departamento VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    FOREIGN KEY (id_centro) REFERENCES Centro_Atencion(id_centro)
    );

    CREATE TABLE Empleado_Salario_Fijo (
    id_empleado INT PRIMARY KEY,
    salario INT,
    cargo VARCHAR(255),
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
    );

    CREATE TABLE Empleado_Por_Hora (
    id_empleado INT PRIMARY KEY,
    salario_por_hora NUMBER(10,2),
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
    );

    CREATE TABLE Doctor (
    id_empleado INT PRIMARY KEY,
    id_especialidad INT,
    especializacion_doctor VARCHAR(255),
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
    );
    
    CREATE TABLE Enfermero (
    id_empleado INT PRIMARY KEY,
    especializacion_enfermero VARCHAR(255),
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
    );
    
    CREATE TABLE Trabajador_Auxiliar (
    id_empleado INT PRIMARY KEY,
    seccion_auxiliar VARCHAR(255),
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
    );
    
    CREATE TABLE Portero (
    id_empleado INT PRIMARY KEY,
    seccion_portero VARCHAR(255),
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
    );
    
    CREATE TABLE Personal_Limpieza (
    id_empleado INT PRIMARY KEY,
    seccion_limpieza VARCHAR(255),
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
    );
    
    CREATE TABLE Turno_Empleado (
    id_turno_empleado INT PRIMARY KEY,
    id_empleado INT,
    id_turno INT,
    fecha_hora_turno TIMESTAMP,
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado),
    FOREIGN KEY (id_turno) REFERENCES Turno(id_turno)
    );
    
    CREATE TABLE Ala_Residencial (
    id_residencial INT PRIMARY KEY,
    id_centro INT,
    FOREIGN KEY (id_centro) REFERENCES Centro_Atencion(id_centro)
    );
    
    CREATE TABLE Sala (
    id_sala INT PRIMARY KEY,
    nombre_sala VARCHAR(255)
    );
    
    CREATE TABLE Alta_Medica (
    id_alta INT PRIMARY KEY,
    fecha_alta TIMESTAMP NOT NULL,
    id_empleado INT NOT NULL,
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
    );
    
    CREATE TABLE Tratamiento (
    id_tratamiento INT PRIMARY KEY,
    tipo_tratamiento VARCHAR(50) NOT NULL,
    detalles_tratamiento VARCHAR(255)
    );
    
    CREATE TABLE Receta (
    numero_receta INT PRIMARY KEY,
    numero_tratamiento INT NOT NULL,
    fecha_inicio TIMESTAMP NOT NULL,
    fecha_fin TIMESTAMP NOT NULL,
    comentarios VARCHAR(255),
    periodo INT,
    FOREIGN KEY (numero_tratamiento) REFERENCES Tratamiento(id_tratamiento)
    );
    
    CREATE TABLE Agencia (
    id_agencia INT PRIMARY KEY,
    id_alta INT NOT NULL,
    nombre_agencia VARCHAR(50) NOT NULL,
    direccion_agencia VARCHAR(100),
    contacto_agencia INT,
    FOREIGN KEY (id_alta) REFERENCES Alta_Medica(id_alta)
    );
    
    CREATE TABLE Condicion_Medica (
    id_condicion_medica INT PRIMARY KEY,
    id_tratamiento INT NOT NULL,
    FOREIGN KEY (id_tratamiento) REFERENCES Tratamiento(id_tratamiento)
    );
    
    CREATE TABLE Medicamento (
    codigo_medicamento INT PRIMARY KEY,
    id_tratamiento INT NOT NULL,
    nombre_medicamento VARCHAR(50) NOT NULL,
    fabricante_medicamento VARCHAR(50),
    fecha_inicio_medicamento TIMESTAMP NOT NULL,
    fecha_fin_medicamento TIMESTAMP NOT NULL,
    periodo INT,
    FOREIGN KEY (id_tratamiento) REFERENCES Tratamiento(id_tratamiento)
    );
    
    CREATE TABLE Tipo_Prueba (
    id_tipo_prueba INT PRIMARY KEY,
    nombre_prueba VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255)
    );
    
    CREATE TABLE Paciente (
    numero_paciente INT PRIMARY KEY,
    id_medico_general INT,
    id_alta INT,
    id_centro INT,
    id_sala INT,
    nombre_paciente VARCHAR(255),
    direccion_paciente VARCHAR(255),
    contacto_paciente INT,
    FOREIGN KEY (id_medico_general) REFERENCES Medico_General(id_medico_general),
    FOREIGN KEY (id_alta) REFERENCES Alta_Medica(id_alta),
    FOREIGN KEY (id_centro) REFERENCES Centro_Atencion(id_centro),
    FOREIGN KEY (id_sala) REFERENCES Sala(id_sala)
    );
    
    CREATE TABLE Paciente_Hospitalizado (
    numero_paciente INT PRIMARY KEY,
    periodo_estadia INT,
    FOREIGN KEY (numero_paciente) REFERENCES Paciente(numero_paciente)
    );
    
    CREATE TABLE Paciente_Ambulatorio (
    numero_paciente INT PRIMARY KEY,
    tipo_tratamiento VARCHAR(255),
    FOREIGN KEY (numero_paciente) REFERENCES Paciente(numero_paciente)
    );
    
    CREATE TABLE Lista_Espera (
    id_espera INT PRIMARY KEY,
    numero_paciente INT NOT NULL,
    fecha_hora_ingreso TIMESTAMP NOT NULL,
    prioridad_cama VARCHAR(50)
    );
    
    CREATE TABLE Habitacion (
    numero_habitacion INT PRIMARY KEY,
    id_residencial INT,
    id_espera INT,
    FOREIGN KEY (id_residencial) REFERENCES Ala_Residencial(id_residencial),
    FOREIGN KEY (id_espera) REFERENCES Lista_Espera(id_espera)
    );
    
    CREATE TABLE Cama (
    id_cama INT PRIMARY KEY,
    id_sala INT,
    numero_paciente INT,
    FOREIGN KEY (id_sala) REFERENCES Sala(id_sala),
    FOREIGN KEY (numero_paciente) REFERENCES Paciente(numero_paciente)
    );
    
    CREATE TABLE Cita (
    numero_cita INT PRIMARY KEY,
    numero_paciente INT,
    id_empleado INT,
    fecha_hora_cita TIMESTAMP,
    FOREIGN KEY (numero_paciente) REFERENCES Paciente(numero_paciente),
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
    );
    
    CREATE TABLE Sesion_Prueba (
    id_sesion_prueba INT PRIMARY KEY,
    id_tratamiento INT NOT NULL,
    id_tipo_prueba INT,
    prueba_realizada VARCHAR(100) NOT NULL,
    duracion_prueba TIMESTAMP NOT NULL,
    FOREIGN KEY (id_tratamiento) REFERENCES Tratamiento(id_tratamiento),
    FOREIGN KEY (id_tipo_prueba) REFERENCES Tipo_Prueba(id_tipo_prueba)
    );
    
    CREATE TABLE Resultado_Prueba (
    id_resultado INT PRIMARY KEY,
    id_sesion_prueba INT NOT NULL,
    resultado VARCHAR(500),
    fecha_resultado TIMESTAMP NOT NULL,
    observaciones VARCHAR(255),
    FOREIGN KEY (id_sesion_prueba) REFERENCES Sesion_Prueba(id_sesion_prueba)
    );
    
    CREATE TABLE Diagnostico (
    id_diagnostico INT PRIMARY KEY,
    numero_paciente INT NOT NULL,
    id_condicion_medica INT,
    fecha_diagnostico TIMESTAMP NOT NULL,
    descripcion VARCHAR(255),
    observaciones VARCHAR(255),
    FOREIGN KEY (numero_paciente) REFERENCES Paciente(numero_paciente),
    FOREIGN KEY (id_condicion_medica) REFERENCES Condicion_Medica(id_condicion_medica)
    );
    
    CREATE TABLE Historia_Clinica (
    id_historia_clinica INT PRIMARY KEY,
    numero_paciente INT NOT NULL,
    fecha_apertura TIMESTAMP NOT NULL,
    antecedentes VARCHAR(500),
    observaciones VARCHAR(500),
    FOREIGN KEY (numero_paciente) REFERENCES Paciente(numero_paciente)
    );
    
    CREATE TABLE Consulta (
    id_consulta INT PRIMARY KEY,
    numero_paciente INT NOT NULL,
    id_empleado INT NOT NULL,
    numero_cita INT,
    fecha_consulta TIMESTAMP NOT NULL,
    motivo_consulta VARCHAR(255),
    observaciones VARCHAR(500),
    FOREIGN KEY (numero_paciente) REFERENCES Paciente(numero_paciente),
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado),
    FOREIGN KEY (numero_cita) REFERENCES Cita(numero_cita)
    );
    
    CREATE TABLE Hospitalizacion (
    id_hospitalizacion INT PRIMARY KEY,
    numero_paciente INT NOT NULL,
    id_cama INT,
    fecha_ingreso TIMESTAMP NOT NULL,
    fecha_salida TIMESTAMP,
    motivo_hospitalizacion VARCHAR(255),
    estado VARCHAR(50),
    FOREIGN KEY (numero_paciente) REFERENCES Paciente(numero_paciente),
    FOREIGN KEY (id_cama) REFERENCES Cama(id_cama)
    );
    
    CREATE TABLE Cirugia (
    id_cirugia INT PRIMARY KEY,
    numero_paciente INT NOT NULL,
    id_empleado INT NOT NULL,
    fecha_cirugia TIMESTAMP NOT NULL,
    tipo_cirugia VARCHAR(100),
    descripcion VARCHAR(255),
    resultado VARCHAR(255),
    FOREIGN KEY (numero_paciente) REFERENCES Paciente(numero_paciente),
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
    );
    
    CREATE TABLE Procedimiento_Medico (
    id_procedimiento INT PRIMARY KEY,
    id_tratamiento INT NOT NULL,
    nombre_procedimiento VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    fecha_procedimiento TIMESTAMP,
    resultado VARCHAR(255),
    FOREIGN KEY (id_tratamiento) REFERENCES Tratamiento(id_tratamiento)
    );
    
    CREATE TABLE Laboratorio (
    id_laboratorio INT PRIMARY KEY,
    nombre_laboratorio VARCHAR(100) NOT NULL,
    direccion_laboratorio VARCHAR(255),
    contacto_laboratorio INT,
    id_centro INT,
    FOREIGN KEY (id_centro) REFERENCES Centro_Atencion(id_centro)
    );
    
    CREATE TABLE Alergia (
    id_alergia INT PRIMARY KEY,
    nombre_alergia VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    tipo_alergia VARCHAR(100)
    );
    
    CREATE TABLE Paciente_Alergia (
    id_paciente_alergia INT PRIMARY KEY,
    numero_paciente INT NOT NULL,
    id_alergia INT NOT NULL,
    fecha_deteccion TIMESTAMP,
    observaciones VARCHAR(255),
    FOREIGN KEY (numero_paciente) REFERENCES Paciente(numero_paciente),
    FOREIGN KEY (id_alergia) REFERENCES Alergia(id_alergia)
    );
    
    CREATE TABLE Signo_Vital (
    id_signo_vital INT PRIMARY KEY,
    numero_paciente INT NOT NULL,
    fecha_registro TIMESTAMP NOT NULL,
    presion_arterial VARCHAR(50),
    frecuencia_cardiaca INT,
    temperatura DECIMAL(5,2),
    frecuencia_respiratoria INT,
    saturacion_oxigeno DECIMAL(5,2),
    FOREIGN KEY (numero_paciente) REFERENCES Paciente(numero_paciente)
    );
    
    CREATE TABLE Dosis_Medicamento (
    id_dosis INT PRIMARY KEY,
    codigo_medicamento INT NOT NULL,
    dosis VARCHAR(100) NOT NULL,
    frecuencia VARCHAR(100),
    via_administracion VARCHAR(100),
    duracion INT,
    FOREIGN KEY (codigo_medicamento) REFERENCES Medicamento(codigo_medicamento)
    );
    
    CREATE TABLE Proveedor (
    id_proveedor INT PRIMARY KEY,
    nombre_proveedor VARCHAR(150) NOT NULL,
    direccion_proveedor VARCHAR(255),
    contacto_proveedor INT,
    correo_proveedor VARCHAR(150)
    );
    
    CREATE TABLE Medicamento_Proveedor (
    id_medicamento_proveedor INT PRIMARY KEY,
    codigo_medicamento INT NOT NULL,
    id_proveedor INT NOT NULL,
    fecha_suministro TIMESTAMP,
    cantidad INT,
    precio_unitario DECIMAL(10,2),
    FOREIGN KEY (codigo_medicamento) REFERENCES Medicamento(codigo_medicamento),
    FOREIGN KEY (id_proveedor) REFERENCES Proveedor(id_proveedor)
    );
    
    CREATE TABLE Factura (
    id_factura INT PRIMARY KEY,
    numero_paciente INT NOT NULL,
    fecha_factura TIMESTAMP NOT NULL,
    monto_total DECIMAL(10,2),
    estado VARCHAR(50),
    FOREIGN KEY (numero_paciente) REFERENCES Paciente(numero_paciente)
    );
    
    CREATE TABLE Detalle_Factura (
    id_detalle INT PRIMARY KEY,
    id_factura INT NOT NULL,
    id_tratamiento INT,
    codigo_medicamento INT,
    cantidad INT,
    precio_unitario DECIMAL(10,2),
    subtotal DECIMAL(10,2),
    FOREIGN KEY (id_factura) REFERENCES Factura(id_factura),
    FOREIGN KEY (id_tratamiento) REFERENCES Tratamiento(id_tratamiento),
    FOREIGN KEY (codigo_medicamento) REFERENCES Medicamento(codigo_medicamento)
    );
    
    CREATE TABLE Pago (
    id_pago INT PRIMARY KEY,
    id_factura INT NOT NULL,
    fecha_pago TIMESTAMP NOT NULL,
    monto_pago DECIMAL(10,2),
    metodo_pago VARCHAR(50),
    estado_pago VARCHAR(50),
    FOREIGN KEY (id_factura) REFERENCES Factura(id_factura)
    );
    
    CREATE TABLE Seguro_Medico (
    id_seguro INT PRIMARY KEY,
    numero_paciente INT NOT NULL,
    empresa_seguro VARCHAR(150) NOT NULL,
    numero_poliza VARCHAR(100) NOT NULL,
    tipo_cobertura VARCHAR(100),
    fecha_inicio TIMESTAMP,
    fecha_fin TIMESTAMP,
    FOREIGN KEY (numero_paciente) REFERENCES Paciente(numero_paciente)
    );
    
    CREATE TABLE Familia (
    id_familia INT PRIMARY KEY,
    id_alta INT NOT NULL,
    nombre_responsable VARCHAR(50) NOT NULL,
    contacto_responsable INT,
    parentesco VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_alta) REFERENCES Alta_Medica(id_alta)
    );

ALTER TABLE Doctor
ADD CONSTRAINT fk_doctor_especialidad
FOREIGN KEY (id_especialidad)
REFERENCES Especialidad(id_especialidad);

ALTER TABLE Empleado
ADD id_departamento INT;

ALTER TABLE Empleado
ADD CONSTRAINT fk_empleado_departamento
FOREIGN KEY (id_departamento)
REFERENCES Departamento(id_departamento);

ALTER TABLE Sesion_Prueba
ADD id_laboratorio INT;

ALTER TABLE Sesion_Prueba
ADD CONSTRAINT fk_sesion_laboratorio
FOREIGN KEY (id_laboratorio)
REFERENCES Laboratorio(id_laboratorio);

ALTER TABLE Lista_Espera
ADD CONSTRAINT fk_lista_espera_paciente
FOREIGN KEY (numero_paciente)
REFERENCES Paciente(numero_paciente);

--Insert data 
INSERT INTO Centro_Atencion
(id_centro, nombre_centro, direccion_centro, contacto_centro)
VALUES (1, 'Hospital Central', 'Av. Principal #100', 70010001);

INSERT INTO Centro_Atencion
(id_centro, nombre_centro, direccion_centro, contacto_centro)
VALUES (2, 'Hospital San Gabriel', 'Av. Los Pinos #250', 70010002);

INSERT INTO Centro_Atencion
(id_centro, nombre_centro, direccion_centro, contacto_centro)
VALUES (3, 'Clínica Santa María', 'Calle Bolívar #315', 70010003);

INSERT INTO Centro_Atencion
(id_centro, nombre_centro, direccion_centro, contacto_centro)
VALUES (4, 'Centro Médico del Sur', 'Av. Circunvalación #450', 70010004);

INSERT INTO Centro_Atencion
(id_centro, nombre_centro, direccion_centro, contacto_centro)
VALUES (5, 'Hospital San José', 'Calle Sucre #520', 70010005);

INSERT INTO Centro_Atencion
(id_centro, nombre_centro, direccion_centro, contacto_centro)
VALUES (6, 'Centro de Salud Norte', 'Av. América #610', 70010006);

INSERT INTO Centro_Atencion
(id_centro, nombre_centro, direccion_centro, contacto_centro)
VALUES (7, 'Hospital Los Andes', 'Calle Aroma #725', 70010007);

INSERT INTO Centro_Atencion
(id_centro, nombre_centro, direccion_centro, contacto_centro)
VALUES (8, 'Clínica Esperanza', 'Av. Blanco Galindo #830', 70010008);

INSERT INTO Centro_Atencion
(id_centro, nombre_centro, direccion_centro, contacto_centro)
VALUES (9, 'Hospital Virgen del Carmen', 'Calle Sucre #940', 70010009);

INSERT INTO Centro_Atencion
(id_centro, nombre_centro, direccion_centro, contacto_centro)
VALUES (10, 'Centro Médico Integral', 'Av. Petrolera #1050', 70010010);

INSERT INTO Turno
(id_turno, nombre_turno)
VALUES (1, 'Turno de mañana');

INSERT INTO Turno
(id_turno, nombre_turno)
VALUES (2, 'Turno de tarde');

INSERT INTO Turno
(id_turno, nombre_turno)
VALUES (3, 'Turno de noche');


INSERT INTO Especialidad
(id_especialidad, nombre_especialidad, descripcion)
VALUES (1, 'Medicina interna', 'Atención médica de adultos');

INSERT INTO Especialidad
(id_especialidad, nombre_especialidad, descripcion)
VALUES (2, 'Cardiología', 'Diagnóstico y tratamiento de enfermedades cardíacas');

INSERT INTO Especialidad
(id_especialidad, nombre_especialidad, descripcion)
VALUES (3, 'Neurología', 'Atención de enfermedades del sistema nervioso');

INSERT INTO Especialidad
(id_especialidad, nombre_especialidad, descripcion)
VALUES (4, 'Pediatría', 'Atención médica de niños y adolescentes');

INSERT INTO Especialidad
(id_especialidad, nombre_especialidad, descripcion)
VALUES (5, 'Ginecología', 'Atención de la salud reproductiva femenina');

INSERT INTO Especialidad
(id_especialidad, nombre_especialidad, descripcion)
VALUES (6, 'Obstetricia', 'Atención durante el embarazo y parto');

INSERT INTO Especialidad
(id_especialidad, nombre_especialidad, descripcion)
VALUES (7, 'Traumatología', 'Tratamiento de lesiones musculoesqueléticas');

INSERT INTO Especialidad
(id_especialidad, nombre_especialidad, descripcion)
VALUES (8, 'Dermatología', 'Diagnóstico de enfermedades de la piel');

INSERT INTO Especialidad
(id_especialidad, nombre_especialidad, descripcion)
VALUES (9, 'Oftalmología', 'Atención de enfermedades de los ojos');

INSERT INTO Especialidad
(id_especialidad, nombre_especialidad, descripcion)
VALUES (10, 'Otorrinolaringología', 'Atención del oído, nariz y garganta');

INSERT INTO Especialidad
(id_especialidad, nombre_especialidad, descripcion)
VALUES (11, 'Urología', 'Atención del aparato urinario');

INSERT INTO Especialidad
(id_especialidad, nombre_especialidad, descripcion)
VALUES (12, 'Endocrinología', 'Tratamiento de enfermedades hormonales');

INSERT INTO Especialidad
(id_especialidad, nombre_especialidad, descripcion)
VALUES (13, 'Oncología', 'Diagnóstico y tratamiento del cáncer');

INSERT INTO Especialidad
(id_especialidad, nombre_especialidad, descripcion)
VALUES (14, 'Psiquiatría', 'Atención de la salud mental');

INSERT INTO Especialidad
(id_especialidad, nombre_especialidad, descripcion)
VALUES (15, 'Cirugía general', 'Procedimientos quirúrgicos generales');

INSERT INTO Especialidad
(id_especialidad, nombre_especialidad, descripcion)
VALUES (16, 'Neumología', 'Tratamiento de enfermedades respiratorias');

INSERT INTO Especialidad
(id_especialidad, nombre_especialidad, descripcion)
VALUES (17, 'Nefrología', 'Atención de enfermedades renales');

INSERT INTO Especialidad
(id_especialidad, nombre_especialidad, descripcion)
VALUES (18, 'Gastroenterología', 'Atención del aparato digestivo');

INSERT INTO Especialidad
(id_especialidad, nombre_especialidad, descripcion)
VALUES (19, 'Reumatología', 'Tratamiento de enfermedades reumáticas');

INSERT INTO Especialidad
(id_especialidad, nombre_especialidad, descripcion)
VALUES (20, 'Infectología', 'Diagnóstico y tratamiento de infecciones');

INSERT INTO Especialidad
(id_especialidad, nombre_especialidad, descripcion)
VALUES (21, 'Pediatría especializada', 'Atención especializada de pacientes pediátricos');

INSERT INTO Especialidad
(id_especialidad, nombre_especialidad, descripcion)
VALUES (22, 'Cirugía cardiovascular', 'Cirugía del corazón y sistema vascular');

INSERT INTO Especialidad
(id_especialidad, nombre_especialidad, descripcion)
VALUES (23, 'Cirugía pediátrica', 'Procedimientos quirúrgicos pediátricos');

INSERT INTO Especialidad
(id_especialidad, nombre_especialidad, descripcion)
VALUES (24, 'Anestesiología', 'Administración y control de anestesia');

INSERT INTO Especialidad
(id_especialidad, nombre_especialidad, descripcion)
VALUES (25, 'Radiología', 'Diagnóstico mediante imágenes médicas');

INSERT INTO Especialidad
(id_especialidad, nombre_especialidad, descripcion)
VALUES (26, 'Patología', 'Estudio de enfermedades mediante muestras');

INSERT INTO Especialidad
(id_especialidad, nombre_especialidad, descripcion)
VALUES (27, 'Medicina familiar', 'Atención integral de la familia');

INSERT INTO Especialidad
(id_especialidad, nombre_especialidad, descripcion)
VALUES (28, 'Medicina de emergencia', 'Atención de emergencias médicas');

INSERT INTO Especialidad
(id_especialidad, nombre_especialidad, descripcion)
VALUES (29, 'Geriatría', 'Atención médica de adultos mayores');

INSERT INTO Especialidad
(id_especialidad, nombre_especialidad, descripcion)
VALUES (30, 'Medicina física y rehabilitación', 'Rehabilitación y recuperación funcional');


BEGIN
    FOR i IN 1..100 LOOP
        INSERT INTO Medico_General
        (
            id_medico_general,
            nombre_medico,
            contacto_medico,
            direccion_medico
        )
        VALUES
        (
            i,
            'Dr. Médico General ' || i,
            72000000 + i,
            'Calle Médicos #' || (100 + i)
        );
    END LOOP;
END;
/

BEGIN
    FOR i IN 1..30 LOOP
        INSERT INTO Departamento
        (
            id_departamento,
            id_centro,
            nombre_departamento,
            descripcion
        )
        VALUES
        (
            i,
            MOD(i - 1, 10) + 1,
            CASE MOD(i - 1, 10)
                WHEN 0 THEN 'Medicina interna'
                WHEN 1 THEN 'Cardiología'
                WHEN 2 THEN 'Pediatría'
                WHEN 3 THEN 'Cirugía'
                WHEN 4 THEN 'Emergencias'
                WHEN 5 THEN 'Laboratorio'
                WHEN 6 THEN 'Radiología'
                WHEN 7 THEN 'Ginecología'
                WHEN 8 THEN 'Traumatología'
                ELSE 'Administración'
            END,
            'Departamento médico del centro de atención'
        );
    END LOOP;
END;
/

BEGIN
    FOR i IN 1..3000 LOOP

        INSERT INTO Empleado
        (
            id_empleado,
            id_centro,
            nombre_empleado,
            direccion_empleado,
            contacto_empleado
        )
        VALUES
        (
            i,
            MOD(i - 1, 10) + 1,
            'Empleado ' || i,
            'Calle Hospital #' || (1000 + i),
            71000000 + i
        );

    END LOOP;
END;
/

UPDATE Empleado
SET id_departamento = MOD(id_empleado - 1, 20) + 1;
COMMIT;

BEGIN
    FOR i IN 1..1800 LOOP

        INSERT INTO Empleado_Salario_Fijo
        (
            id_empleado,
            salario,
            cargo
        )
        VALUES
        (
            i,
            3500 + MOD(i, 15) * 250,
            CASE MOD(i, 6)
                WHEN 0 THEN 'Médico'
                WHEN 1 THEN 'Enfermero'
                WHEN 2 THEN 'Administrador'
                WHEN 3 THEN 'Técnico'
                WHEN 4 THEN 'Auxiliar'
                ELSE 'Supervisor'
            END
        );

    END LOOP;
END;
/

BEGIN
    FOR i IN 1801..3000 LOOP

        INSERT INTO Empleado_Por_Hora
        (
            id_empleado,
            salario_por_hora
        )
        VALUES
        (
            i,
            TO_CHAR(25 + MOD(i, 16)) || ' Bs/hora'
        );

    END LOOP;
END;
/

BEGIN
    FOR i IN 1..500 LOOP

        INSERT INTO Doctor
        (
            id_empleado,
            id_especialidad,
            especializacion_doctor
        )
        VALUES
        (
            i,
            MOD(i - 1, 30) + 1,
            CASE MOD(i - 1, 30)
                WHEN 0 THEN 'Especialista en Medicina interna'
                WHEN 1 THEN 'Especialista en Cardiología'
                WHEN 2 THEN 'Especialista en Neurología'
                WHEN 3 THEN 'Especialista en Pediatría'
                WHEN 4 THEN 'Especialista en Ginecología'
                WHEN 5 THEN 'Especialista en Obstetricia'
                WHEN 6 THEN 'Especialista en Traumatología'
                WHEN 7 THEN 'Especialista en Dermatología'
                WHEN 8 THEN 'Especialista en Oftalmología'
                WHEN 9 THEN 'Especialista en Otorrinolaringología'
                WHEN 10 THEN 'Especialista en Urología'
                WHEN 11 THEN 'Especialista en Endocrinología'
                WHEN 12 THEN 'Especialista en Oncología'
                WHEN 13 THEN 'Especialista en Psiquiatría'
                WHEN 14 THEN 'Especialista en Cirugía general'
                WHEN 15 THEN 'Especialista en Neumología'
                WHEN 16 THEN 'Especialista en Nefrología'
                WHEN 17 THEN 'Especialista en Gastroenterología'
                WHEN 18 THEN 'Especialista en Reumatología'
                WHEN 19 THEN 'Especialista en Infectología'
                WHEN 20 THEN 'Especialista en Pediatría especializada'
                WHEN 21 THEN 'Especialista en Cirugía cardiovascular'
                WHEN 22 THEN 'Especialista en Cirugía pediátrica'
                WHEN 23 THEN 'Especialista en Anestesiología'
                WHEN 24 THEN 'Especialista en Radiología'
                WHEN 25 THEN 'Especialista en Patología'
                WHEN 26 THEN 'Especialista en Medicina familiar'
                WHEN 27 THEN 'Especialista en Medicina de emergencia'
                WHEN 28 THEN 'Especialista en Geriatría'
                ELSE 'Especialista en Medicina física y rehabilitación'
            END
        );

    END LOOP;
END;
/

BEGIN
    FOR i IN 501..1300 LOOP

        INSERT INTO Enfermero
        (
            id_empleado,
            especializacion_enfermero
        )
        VALUES
        (
            i,
            CASE MOD(i, 5)
                WHEN 0 THEN 'Enfermería general'
                WHEN 1 THEN 'Cuidados intensivos'
                WHEN 2 THEN 'Emergencias'
                WHEN 3 THEN 'Pediatría'
                ELSE 'Cirugía'
            END
        );

    END LOOP;
END;
/

BEGIN
    FOR i IN 1301..1600 LOOP

        INSERT INTO Trabajador_Auxiliar
        (
            id_empleado,
            seccion_auxiliar
        )
        VALUES
        (
            i,
            CASE MOD(i, 5)
                WHEN 0 THEN 'Farmacia'
                WHEN 1 THEN 'Laboratorio'
                WHEN 2 THEN 'Archivo'
                WHEN 3 THEN 'Admisiones'
                ELSE 'Mantenimiento'
            END
        );

    END LOOP;
END;
/

BEGIN
    FOR i IN 1601..1700 LOOP

        INSERT INTO Portero
        (
            id_empleado,
            seccion_portero
        )
        VALUES
        (
            i,
            CASE MOD(i, 4)
                WHEN 0 THEN 'Entrada principal'
                WHEN 1 THEN 'Emergencias'
                WHEN 2 THEN 'Área administrativa'
                ELSE 'Área residencial'
            END
        );

    END LOOP;
END;
/

BEGIN
    FOR i IN 1701..1850 LOOP

        INSERT INTO Personal_Limpieza
        (
            id_empleado,
            seccion_limpieza
        )
        VALUES
        (
            i,
            CASE MOD(i, 4)
                WHEN 0 THEN 'Hospitalización'
                WHEN 1 THEN 'Emergencias'
                WHEN 2 THEN 'Quirófanos'
                ELSE 'Áreas generales'
            END
        );

    END LOOP;
END;
/

BEGIN
    FOR i IN 1..3000 LOOP

        INSERT INTO Turno_Empleado
        (
            id_turno_empleado,
            id_empleado,
            id_turno,
            fecha_hora_turno
        )
        VALUES
        (
            i,
            i,
            MOD(i - 1, 3) + 1,
            TIMESTAMP '2026-01-01 07:00:00'
                + NUMTODSINTERVAL(MOD(i, 365), 'DAY')
        );

    END LOOP;
END;
/

BEGIN
    FOR i IN 1..20 LOOP
        INSERT INTO Ala_Residencial (
            id_residencial,
            id_centro
        )
        VALUES (
            i,
            MOD(i - 1, 10) + 1
        );
    END LOOP;
END;
/

BEGIN
    FOR i IN 1..30 LOOP
        INSERT INTO Sala (
            id_sala,
            nombre_sala
        )
        VALUES (
            i,
            CASE MOD(i - 1, 6)
                WHEN 0 THEN 'Sala de Emergencias'
                WHEN 1 THEN 'Sala de Pediatría'
                WHEN 2 THEN 'Sala de Cirugía'
                WHEN 3 THEN 'Sala de Recuperación'
                WHEN 4 THEN 'Sala de Observación'
                ELSE 'Sala de Hospitalización'
            END || ' ' || CEIL(i / 6)
        );
    END LOOP;
END;
/

BEGIN
    FOR i IN 1..3000 LOOP
        INSERT INTO Paciente (
            numero_paciente,
            id_medico_general,
            id_alta,
            id_centro,
            id_sala,
            nombre_paciente,
            direccion_paciente,
            contacto_paciente
        )
        VALUES (
            i,
            MOD(i - 1, 100) + 1,
            NULL,
            MOD(i - 1, 10) + 1,
            MOD(i - 1, 30) + 1,
            'Paciente ' || i,
            'Calle ' || (i + 10) || ' Nº ' || (100 + MOD(i, 900)),
            70020000 + i
        );
    END LOOP;
END;
/

BEGIN
    FOR i IN 1..600 LOOP
        INSERT INTO Paciente_Hospitalizado (
            numero_paciente,
            periodo_estadia
        )
        VALUES (
            i,
            MOD(i, 20) + 1
        );
    END LOOP;
END;
/

BEGIN
    FOR i IN 601..2400 LOOP
        INSERT INTO Paciente_Ambulatorio (
            numero_paciente,
            tipo_tratamiento
        )
        VALUES (
            i,
            CASE MOD(i, 5)
                WHEN 0 THEN 'Consulta general'
                WHEN 1 THEN 'Control médico'
                WHEN 2 THEN 'Tratamiento farmacológico'
                WHEN 3 THEN 'Control especializado'
                ELSE 'Seguimiento médico'
            END
        );
    END LOOP;
END;
/

BEGIN
    FOR i IN 1..500 LOOP
        INSERT INTO Lista_Espera (
            id_espera,
            numero_paciente,
            fecha_hora_ingreso,
            prioridad_cama
        )
        VALUES (
            i,
            MOD(i - 1, 600) + 1,
            TIMESTAMP '2026-01-01 08:00:00'
                + NUMTODSINTERVAL(MOD(i - 1, 365), 'DAY'),
            CASE MOD(i, 3)
                WHEN 0 THEN 'Alta'
                WHEN 1 THEN 'Media'
                ELSE 'Baja'
            END
        );
    END LOOP;
END;
/

BEGIN
    FOR i IN 1..500 LOOP
        INSERT INTO Habitacion (
            numero_habitacion,
            id_residencial,
            id_espera
        )
        VALUES (
            100 + i,
            MOD(i - 1, 20) + 1,
            i
        );
    END LOOP;
END;
/

BEGIN
    FOR i IN 1..1000 LOOP
        INSERT INTO Cama (
            id_cama,
            id_sala,
            numero_paciente
        )
        VALUES (
            i,
            MOD(i - 1, 30) + 1,
            CASE
                WHEN i <= 600 THEN i
                ELSE NULL
            END
        );
    END LOOP;
END;
/


BEGIN
    FOR i IN 1..3000 LOOP
        INSERT INTO Alta_Medica (
            id_alta,
            fecha_alta,
            id_empleado
        )
        VALUES (
            i,
            TIMESTAMP '2026-01-01 10:00:00'
                + NUMTODSINTERVAL(MOD(i - 1, 365), 'DAY'),
            MOD(i - 1, 3000) + 1
        );
    END LOOP;
END;
/

UPDATE Paciente
SET id_alta = numero_paciente;
COMMIT;

BEGIN
    FOR i IN 1..3000 LOOP
        INSERT INTO Tratamiento (
            id_tratamiento,
            tipo_tratamiento,
            detalles_tratamiento
        )
        VALUES (
            i,
            CASE MOD(i, 6)
                WHEN 0 THEN 'Farmacológico'
                WHEN 1 THEN 'Quirúrgico'
                WHEN 2 THEN 'Fisioterapia'
                WHEN 3 THEN 'Control médico'
                WHEN 4 THEN 'Rehabilitación'
                ELSE 'Tratamiento preventivo'
            END,
            CASE MOD(i, 5)
                WHEN 0 THEN 'Tratamiento de seguimiento'
                WHEN 1 THEN 'Tratamiento ambulatorio'
                WHEN 2 THEN 'Tratamiento especializado'
                WHEN 3 THEN 'Tratamiento hospitalario'
                ELSE 'Tratamiento de recuperación'
            END
        );
    END LOOP;
END;
/

BEGIN
    FOR i IN 1..100 LOOP
        INSERT INTO Condicion_Medica (
            id_condicion_medica,
            id_tratamiento
        )
        VALUES (
            i,
            MOD(i - 1, 3000) + 1
        );
    END LOOP;
END;
/


BEGIN
    FOR i IN 1..3000 LOOP
        INSERT INTO Diagnostico (
            id_diagnostico,
            numero_paciente,
            id_condicion_medica,
            fecha_diagnostico,
            descripcion,
            observaciones
        )
        VALUES (
            i,
            i,
            MOD(i - 1, 100) + 1,
            TIMESTAMP '2026-01-01 09:00:00'
                + NUMTODSINTERVAL(MOD(i - 1, 365), 'DAY'),
            CASE MOD(i, 6)
                WHEN 0 THEN 'Hipertensión arterial'
                WHEN 1 THEN 'Infección respiratoria'
                WHEN 2 THEN 'Gastritis'
                WHEN 3 THEN 'Diabetes mellitus'
                WHEN 4 THEN 'Dolor musculoesquelético'
                ELSE 'Infección urinaria'
            END,
            'Diagnóstico registrado durante la atención médica'
        );
    END LOOP;
END;
/

BEGIN
    FOR i IN 1..3000 LOOP
        INSERT INTO Historia_Clinica (
            id_historia_clinica,
            numero_paciente,
            fecha_apertura,
            antecedentes,
            observaciones
        )
        VALUES (
            i,
            i,
            TIMESTAMP '2025-01-01 08:00:00'
                + NUMTODSINTERVAL(MOD(i - 1, 365), 'DAY'),
            CASE MOD(i, 5)
                WHEN 0 THEN 'Antecedentes familiares de hipertensión'
                WHEN 1 THEN 'Sin antecedentes relevantes'
                WHEN 2 THEN 'Antecedentes de enfermedades respiratorias'
                WHEN 3 THEN 'Antecedentes quirúrgicos'
                ELSE 'Antecedentes familiares de diabetes'
            END,
            'Historia clínica actualizada durante la atención del paciente'
        );
    END LOOP;
END;
/

BEGIN
    FOR i IN 1..30 LOOP
        INSERT INTO Tipo_Prueba (
            id_tipo_prueba,
            nombre_prueba,
            descripcion
        )
        VALUES (
            i,
            CASE MOD(i - 1, 10)
                WHEN 0 THEN 'Hemograma'
                WHEN 1 THEN 'Glucemia'
                WHEN 2 THEN 'Perfil lipídico'
                WHEN 3 THEN 'Examen de orina'
                WHEN 4 THEN 'Radiografía'
                WHEN 5 THEN 'Tomografía'
                WHEN 6 THEN 'Resonancia magnética'
                WHEN 7 THEN 'Electrocardiograma'
                WHEN 8 THEN 'Ecografía'
                ELSE 'Prueba hormonal'
            END || ' ' || CEIL(i / 10),
            'Prueba diagnóstica realizada para evaluación médica'
        );
    END LOOP;
END;
/

BEGIN
    FOR i IN 1..15 LOOP
        INSERT INTO Laboratorio (
            id_laboratorio,
            nombre_laboratorio,
            direccion_laboratorio,
            contacto_laboratorio,
            id_centro
        )
        VALUES (
            i,
            'Laboratorio Clínico ' || i,
            'Av. Laboratorio Nº ' || (100 + i),
            44010000 + i,
            MOD(i - 1, 10) + 1
        );
    END LOOP;
END;
/

BEGIN
    FOR i IN 1..3000 LOOP
        INSERT INTO Sesion_Prueba (
            id_sesion_prueba,
            id_tratamiento,
            id_tipo_prueba,
            prueba_realizada,
            duracion_prueba,
            id_laboratorio
        )
        VALUES (
            i,
            MOD(i - 1, 3000) + 1,
            MOD(i - 1, 30) + 1,
            CASE MOD(i, 5)
                WHEN 0 THEN 'Prueba de rutina'
                WHEN 1 THEN 'Prueba diagnóstica'
                WHEN 2 THEN 'Prueba de control'
                WHEN 3 THEN 'Prueba especializada'
                ELSE 'Prueba de seguimiento'
            END,
            TIMESTAMP '2026-01-01 08:00:00'
                + NUMTODSINTERVAL(MOD(i, 120), 'MINUTE'),
            MOD(i - 1, 15) + 1
        );
    END LOOP;
END;
/

BEGIN
    FOR i IN 1..3000 LOOP
        INSERT INTO Resultado_Prueba (
            id_resultado,
            id_sesion_prueba,
            resultado,
            fecha_resultado,
            observaciones
        )
        VALUES (
            i,
            i,
            CASE MOD(i, 5)
                WHEN 0 THEN 'Resultado dentro de parámetros normales'
                WHEN 1 THEN 'Se observa alteración leve'
                WHEN 2 THEN 'Resultado positivo'
                WHEN 3 THEN 'Resultado negativo'
                ELSE 'Resultado requiere seguimiento médico'
            END,
            TIMESTAMP '2026-01-01 12:00:00'
                + NUMTODSINTERVAL(MOD(i - 1, 365), 'DAY'),
            CASE MOD(i, 4)
                WHEN 0 THEN 'Sin observaciones adicionales'
                WHEN 1 THEN 'Se recomienda control'
                WHEN 2 THEN 'Requiere valoración médica'
                ELSE 'Resultado registrado correctamente'
            END
        );
    END LOOP;
END;
/

BEGIN
    FOR i IN 1..3000 LOOP
        INSERT INTO Cita (
            numero_cita,
            numero_paciente,
            id_empleado,
            fecha_hora_cita
        )
        VALUES (
            i,
            i,
            MOD(i - 1, 3000) + 1,
            TIMESTAMP '2026-01-01 08:00:00'
                + NUMTODSINTERVAL(MOD(i - 1, 365), 'DAY')
                + NUMTODSINTERVAL(MOD(i, 12), 'HOUR')
        );
    END LOOP;
END;
/

BEGIN
    FOR i IN 1..3000 LOOP
        INSERT INTO Consulta (
            id_consulta,
            numero_paciente,
            id_empleado,
            numero_cita,
            fecha_consulta,
            motivo_consulta,
            observaciones
        )
        VALUES (
            i,
            i,
            MOD(i - 1, 3000) + 1,
            i,
            TIMESTAMP '2026-01-01 09:00:00'
                + NUMTODSINTERVAL(MOD(i - 1, 365), 'DAY'),
            CASE MOD(i, 6)
                WHEN 0 THEN 'Control médico general'
                WHEN 1 THEN 'Dolor abdominal'
                WHEN 2 THEN 'Dolor de cabeza'
                WHEN 3 THEN 'Problemas respiratorios'
                WHEN 4 THEN 'Control de tratamiento'
                ELSE 'Evaluación médica'
            END,
            'Consulta registrada en el centro de atención'
        );
    END LOOP;
END;
/

BEGIN
    FOR i IN 1..1500 LOOP
        INSERT INTO Hospitalizacion (
            id_hospitalizacion,
            numero_paciente,
            id_cama,
            fecha_ingreso,
            fecha_salida,
            motivo_hospitalizacion,
            estado
        )
        VALUES (
            i,
            i,
            MOD(i - 1, 1000) + 1,
            TIMESTAMP '2026-01-01 10:00:00'
                + NUMTODSINTERVAL(MOD(i - 1, 365), 'DAY'),
            TIMESTAMP '2026-01-01 10:00:00'
                + NUMTODSINTERVAL(MOD(i - 1, 365), 'DAY')
                + NUMTODSINTERVAL(MOD(i, 10) + 1, 'DAY'),
            CASE MOD(i, 5)
                WHEN 0 THEN 'Recuperación postoperatoria'
                WHEN 1 THEN 'Observación médica'
                WHEN 2 THEN 'Tratamiento de infección'
                WHEN 3 THEN 'Control de enfermedad crónica'
                ELSE 'Atención especializada'
            END,
            CASE MOD(i, 3)
                WHEN 0 THEN 'Finalizada'
                WHEN 1 THEN 'Activa'
                ELSE 'En recuperación'
            END
        );
    END LOOP;
END;
/

BEGIN
    FOR i IN 1..500 LOOP
        INSERT INTO Cirugia (
            id_cirugia,
            numero_paciente,
            id_empleado,
            fecha_cirugia,
            tipo_cirugia,
            descripcion,
            resultado
        )
        VALUES (
            i,
            MOD(i - 1, 1500) + 1,
            MOD(i - 1, 500) + 1,
            TIMESTAMP '2026-01-01 07:00:00'
                + NUMTODSINTERVAL(MOD(i - 1, 365), 'DAY'),
            CASE MOD(i, 5)
                WHEN 0 THEN 'Cirugía general'
                WHEN 1 THEN 'Cirugía abdominal'
                WHEN 2 THEN 'Cirugía traumatológica'
                WHEN 3 THEN 'Cirugía cardiovascular'
                ELSE 'Cirugía pediátrica'
            END,
            'Procedimiento quirúrgico realizado al paciente',
            CASE MOD(i, 4)
                WHEN 0 THEN 'Procedimiento exitoso'
                WHEN 1 THEN 'Paciente estable'
                WHEN 2 THEN 'Procedimiento completado'
                ELSE 'Requiere seguimiento'
            END
        );
    END LOOP;
END;
/

BEGIN
    FOR i IN 1..2000 LOOP
        INSERT INTO Procedimiento_Medico (
            id_procedimiento,
            id_tratamiento,
            nombre_procedimiento,
            descripcion,
            fecha_procedimiento,
            resultado
        )
        VALUES (
            i,
            MOD(i - 1, 3000) + 1,
            CASE MOD(i, 6)
                WHEN 0 THEN 'Curación de herida'
                WHEN 1 THEN 'Administración de medicamento'
                WHEN 2 THEN 'Terapia física'
                WHEN 3 THEN 'Sutura'
                WHEN 4 THEN 'Evaluación especializada'
                ELSE 'Procedimiento diagnóstico'
            END,
            'Procedimiento médico realizado como parte del tratamiento',
            TIMESTAMP '2026-01-01 08:00:00'
                + NUMTODSINTERVAL(MOD(i - 1, 365), 'DAY'),
            CASE MOD(i, 3)
                WHEN 0 THEN 'Procedimiento completado'
                WHEN 1 THEN 'Resultado satisfactorio'
                ELSE 'Requiere seguimiento'
            END
        );
    END LOOP;
END;
/

BEGIN
    FOR i IN 1..50 LOOP
        INSERT INTO Alergia (
            id_alergia,
            nombre_alergia,
            descripcion,
            tipo_alergia
        )
        VALUES (
            i,
            CASE MOD(i - 1, 10)
                WHEN 0 THEN 'Penicilina'
                WHEN 1 THEN 'Amoxicilina'
                WHEN 2 THEN 'Aspirina'
                WHEN 3 THEN 'Ibuprofeno'
                WHEN 4 THEN 'Látex'
                WHEN 5 THEN 'Polen'
                WHEN 6 THEN 'Polvo'
                WHEN 7 THEN 'Mariscos'
                WHEN 8 THEN 'Leche'
                ELSE 'Maní'
            END || ' ' || CEIL(i / 10),
            'Alergia registrada en el historial médico',
            CASE MOD(i, 3)
                WHEN 0 THEN 'Medicamento'
                WHEN 1 THEN 'Alimento'
                ELSE 'Ambiental'
            END
        );
    END LOOP;
END;
/

BEGIN
    FOR i IN 1..1000 LOOP
        INSERT INTO Paciente_Alergia (
            id_paciente_alergia,
            numero_paciente,
            id_alergia,
            fecha_deteccion,
            observaciones
        )
        VALUES (
            i,
            MOD(i - 1, 3000) + 1,
            MOD(i - 1, 50) + 1,
            TIMESTAMP '2025-01-01 08:00:00'
                + NUMTODSINTERVAL(MOD(i - 1, 365), 'DAY'),
            'Alergia registrada durante la evaluación médica'
        );
    END LOOP;
END;
/

BEGIN
    FOR i IN 1..3000 LOOP
        INSERT INTO Signo_Vital (
            id_signo_vital,
            numero_paciente,
            fecha_registro,
            presion_arterial,
            frecuencia_cardiaca,
            temperatura,
            frecuencia_respiratoria,
            saturacion_oxigeno
        )
        VALUES (
            i,
            i,
            TIMESTAMP '2026-01-01 08:00:00'
                + NUMTODSINTERVAL(MOD(i - 1, 365), 'DAY'),
            CASE MOD(i, 4)
                WHEN 0 THEN '120/80'
                WHEN 1 THEN '118/76'
                WHEN 2 THEN '125/82'
                ELSE '130/85'
            END,
            65 + MOD(i, 30),
            36.2 + MOD(i, 8) * 0.1,
            14 + MOD(i, 8),
            95 + MOD(i, 5) * 0.5
        );
    END LOOP;
END;
/

BEGIN
    FOR i IN 1..500 LOOP
        INSERT INTO Medicamento (
            codigo_medicamento,
            id_tratamiento,
            nombre_medicamento,
            fabricante_medicamento,
            fecha_inicio_medicamento,
            fecha_fin_medicamento,
            periodo
        )
        VALUES (
            i,
            MOD(i - 1, 3000) + 1,
            CASE MOD(i, 10)
                WHEN 0 THEN 'Paracetamol'
                WHEN 1 THEN 'Ibuprofeno'
                WHEN 2 THEN 'Amoxicilina'
                WHEN 3 THEN 'Omeprazol'
                WHEN 4 THEN 'Metformina'
                WHEN 5 THEN 'Losartán'
                WHEN 6 THEN 'Azitromicina'
                WHEN 7 THEN 'Diclofenaco'
                WHEN 8 THEN 'Loratadina'
                ELSE 'Enalapril'
            END || ' ' || i,
            CASE MOD(i, 5)
                WHEN 0 THEN 'Laboratorios Andinos'
                WHEN 1 THEN 'Farmacéutica Boliviana'
                WHEN 2 THEN 'Laboratorios Nacionales'
                WHEN 3 THEN 'PharmaBol'
                ELSE 'Medifarma'
            END,
            TIMESTAMP '2026-01-01 08:00:00'
                + NUMTODSINTERVAL(MOD(i - 1, 365), 'DAY'),
            TIMESTAMP '2026-01-01 08:00:00'
                + NUMTODSINTERVAL(MOD(i - 1, 365), 'DAY')
                + NUMTODSINTERVAL(MOD(i, 30) + 5, 'DAY'),
            MOD(i, 30) + 1
        );
    END LOOP;
END;
/

BEGIN
    FOR i IN 1..1500 LOOP
        INSERT INTO Dosis_Medicamento (
            id_dosis,
            codigo_medicamento,
            dosis,
            frecuencia,
            via_administracion,
            duracion
        )
        VALUES (
            i,
            MOD(i - 1, 500) + 1,
            CASE MOD(i, 5)
                WHEN 0 THEN '500 mg'
                WHEN 1 THEN '250 mg'
                WHEN 2 THEN '100 mg'
                WHEN 3 THEN '50 mg'
                ELSE '1 g'
            END,
            CASE MOD(i, 4)
                WHEN 0 THEN 'Cada 8 horas'
                WHEN 1 THEN 'Cada 12 horas'
                WHEN 2 THEN 'Cada 24 horas'
                ELSE 'Según necesidad'
            END,
            CASE MOD(i, 4)
                WHEN 0 THEN 'Oral'
                WHEN 1 THEN 'Intravenosa'
                WHEN 2 THEN 'Intramuscular'
                ELSE 'Tópica'
            END,
            MOD(i, 10) + 1
        );
    END LOOP;
END;
/

BEGIN
    FOR i IN 1..3000 LOOP
        INSERT INTO Receta (
            numero_receta,
            numero_tratamiento,
            fecha_inicio,
            fecha_fin,
            comentarios,
            periodo
        )
        VALUES (
            i,
            i,
            TIMESTAMP '2026-01-01 08:00:00'
                + NUMTODSINTERVAL(MOD(i - 1, 365), 'DAY'),
            TIMESTAMP '2026-01-01 08:00:00'
                + NUMTODSINTERVAL(MOD(i - 1, 365), 'DAY')
                + NUMTODSINTERVAL(MOD(i, 30) + 5, 'DAY'),
            'Receta médica registrada para el paciente',
            MOD(i, 30) + 1
        );
    END LOOP;
END;
/

BEGIN
    FOR i IN 1..30 LOOP
        INSERT INTO Agencia (
            id_agencia,
            id_alta,
            nombre_agencia,
            direccion_agencia,
            contacto_agencia
        )
        VALUES (
            i,
            i,
            'Agencia de Transporte ' || i,
            'Av. Principal Nro. ' || (100 + i),
            '700' || LPAD(i, 4, '0')
        );
    END LOOP;
END;
/

BEGIN
    FOR i IN 1..100 LOOP
        INSERT INTO Proveedor (
            id_proveedor,
            nombre_proveedor,
            direccion_proveedor,
            contacto_proveedor,
            correo_proveedor
        )
        VALUES (
            i,
            'Proveedor Médico ' || i,
            'Av. Industrial Nro. ' || (100 + i),
            '710' || LPAD(i, 4, '0'),
            'proveedor' || i || '@correo.com'
        );
    END LOOP;
END;
/

BEGIN
    FOR i IN 1..1000 LOOP
        INSERT INTO Medicamento_Proveedor (
            id_medicamento_proveedor,
            codigo_medicamento,
            id_proveedor,
            fecha_suministro,
            cantidad,
            precio_unitario
        )
        VALUES (
            i,
            MOD(i - 1, 500) + 1,
            MOD(i - 1, 100) + 1,
            TIMESTAMP '2026-01-01 08:00:00'
                + NUMTODSINTERVAL(MOD(i - 1, 365), 'DAY'),
            MOD(i, 100) + 10,
            10 + MOD(i, 50) * 1.5
        );
    END LOOP;
END;
/

BEGIN
    FOR i IN 1..3000 LOOP
        INSERT INTO Factura (
            id_factura,
            numero_paciente,
            fecha_factura,
            monto_total,
            estado
        )
        VALUES (
            i,
            i,
            TIMESTAMP '2026-01-01 08:00:00'
                + NUMTODSINTERVAL(MOD(i - 1, 365), 'DAY'),
            100 + MOD(i, 900),
            CASE MOD(i, 3)
                WHEN 0 THEN 'Pagada'
                WHEN 1 THEN 'Pendiente'
                ELSE 'Parcial'
            END
        );
    END LOOP;
END;
/

BEGIN
    FOR i IN 1..5000 LOOP
        INSERT INTO Detalle_Factura (
            id_detalle,
            id_factura,
            id_tratamiento,
            codigo_medicamento,
            cantidad,
            precio_unitario,
            subtotal
        )
        VALUES (
            i,
            MOD(i - 1, 3000) + 1,
            CASE
                WHEN MOD(i, 2) = 0 THEN MOD(i - 1, 3000) + 1
                ELSE NULL
            END,
            CASE
                WHEN MOD(i, 2) = 1 THEN MOD(i - 1, 500) + 1
                ELSE NULL
            END,
            MOD(i, 5) + 1,
            20 + MOD(i, 100),
            (MOD(i, 5) + 1) * (20 + MOD(i, 100))
        );
    END LOOP;
END;
/

BEGIN
    FOR i IN 1..3000 LOOP
        INSERT INTO Pago (
            id_pago,
            id_factura,
            fecha_pago,
            monto_pago,
            metodo_pago,
            estado_pago
        )
        VALUES (
            i,
            i,
            TIMESTAMP '2026-01-01 08:00:00'
                + NUMTODSINTERVAL(MOD(i - 1, 365), 'DAY'),
            100 + MOD(i, 900),
            CASE MOD(i, 4)
                WHEN 0 THEN 'Efectivo'
                WHEN 1 THEN 'Tarjeta'
                WHEN 2 THEN 'Transferencia'
                ELSE 'Seguro médico'
            END,
            CASE MOD(i, 3)
                WHEN 0 THEN 'Completado'
                WHEN 1 THEN 'Pendiente'
                ELSE 'Procesando'
            END
        );
    END LOOP;
END;
/

BEGIN
    FOR i IN 1..2000 LOOP
        INSERT INTO Seguro_Medico (
            id_seguro,
            numero_paciente,
            empresa_seguro,
            numero_poliza,
            tipo_cobertura,
            fecha_inicio,
            fecha_fin
        )
        VALUES (
            i,
            MOD(i - 1, 3000) + 1,
            CASE MOD(i, 5)
                WHEN 0 THEN 'Seguro Nacional'
                WHEN 1 THEN 'Salud Integral'
                WHEN 2 THEN 'Protección Médica'
                WHEN 3 THEN 'Seguros Andinos'
                ELSE 'Salud Familiar'
            END,
            'POL-' || LPAD(i, 6, '0'),
            CASE MOD(i, 3)
                WHEN 0 THEN 'Cobertura completa'
                WHEN 1 THEN 'Cobertura parcial'
                ELSE 'Cobertura básica'
            END,
            DATE '2025-01-01' + MOD(i, 365),
            DATE '2026-01-01' + MOD(i, 365)
        );
    END LOOP;
END;
/

COMMIT;