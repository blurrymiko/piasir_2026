-- Esquema SQL: BBDD clinica_privada

-- Enums

CREATE TYPE estado_cita AS ENUM (
    'pendiente',
    'confirmada',
    'cancelada',
    'completada'
);

CREATE TYPE estado_prueba AS ENUM (
    'solicitada',
    'programada',
    'realizada',
    'cancelada'
);

CREATE TYPE estado_tratamiento AS ENUM (
    'activo',
    'finalizado',
    'suspendido'
);

CREATE TYPE estado_factura AS ENUM (
    'pendiente',
    'pagada',
    'anulada'
);

CREATE TYPE metodo_pago AS ENUM (
    'efectivo',
    'tarjeta',
    'transferencia',
    'seguro',
    'pendiente'
);

-- Tablas

CREATE TABLE clinicas (
    id_clinica INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    direccion VARCHAR(200) NOT NULL,
    telefono VARCHAR(15),
    email VARCHAR(120),
    abierta BOOLEAN NOT NULL DEFAULT TRUE,
    creado_en TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE aseguradoras (
    id_aseguradora INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(15),
    email VARCHAR(120)
);

CREATE TABLE especialidades (
    id_especialidad INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE pacientes (
    id_paciente INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    numero_historia VARCHAR(20) NOT NULL UNIQUE,
    dni VARCHAR(12) NOT NULL UNIQUE,
    nombre VARCHAR(80) NOT NULL,
    apellidos VARCHAR(120) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    sexo VARCHAR(15),
    telefono VARCHAR(15),
    email VARCHAR(120),
    direccion VARCHAR(200),
    id_aseguradora INT,
    numero_poliza VARCHAR(30),
    fecha_alta DATE NOT NULL DEFAULT CURRENT_DATE,
    creado_en TIMESTAMP NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_pacientes_aseguradora
        FOREIGN KEY (id_aseguradora) REFERENCES aseguradoras(id_aseguradora)
);

CREATE TABLE medicos (
    id_medico INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_especialidad INT NOT NULL,
    nombre VARCHAR(80) NOT NULL,
    apellidos VARCHAR(120) NOT NULL,
    num_colegiado VARCHAR(20) NOT NULL UNIQUE,
    telefono VARCHAR(15),
    email VARCHAR(120) UNIQUE,
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    creado_en TIMESTAMP NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_medicos_especialidad
        FOREIGN KEY (id_especialidad) REFERENCES especialidades(id_especialidad)
);

CREATE TABLE medicos_clinicas (
    id_medico_clinica INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_medico INT NOT NULL,
    id_clinica INT NOT NULL,
    es_principal BOOLEAN NOT NULL DEFAULT FALSE,
    fecha_inicio DATE NOT NULL DEFAULT CURRENT_DATE,
    fecha_fin DATE,
    CONSTRAINT fk_medicos_clinicas_medico
        FOREIGN KEY (id_medico) REFERENCES medicos(id_medico),
    CONSTRAINT fk_medicos_clinicas_clinica
        FOREIGN KEY (id_clinica) REFERENCES clinicas(id_clinica),
    CONSTRAINT uq_medicos_clinicas UNIQUE (id_medico, id_clinica)
);

CREATE TABLE clinicas_especialidades (
    id_clinica_especialidad INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_clinica INT NOT NULL,
    id_especialidad INT NOT NULL,
    disponible BOOLEAN NOT NULL DEFAULT TRUE,
    CONSTRAINT fk_clinicas_especialidades_clinica
        FOREIGN KEY (id_clinica) REFERENCES clinicas(id_clinica),
    CONSTRAINT fk_clinicas_especialidades_especialidad
        FOREIGN KEY (id_especialidad) REFERENCES especialidades(id_especialidad),
    CONSTRAINT uq_clinicas_especialidades UNIQUE (id_clinica, id_especialidad)
);

CREATE TABLE citas (
    id_cita INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_paciente INT NOT NULL,
    id_medico INT NOT NULL,
    id_clinica INT NOT NULL,
    fecha_hora TIMESTAMP NOT NULL,
    motivo VARCHAR(200) NOT NULL,
    estado estado_cita NOT NULL DEFAULT 'pendiente',
    creado_en TIMESTAMP NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_citas_paciente
        FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente),
    CONSTRAINT fk_citas_medico
        FOREIGN KEY (id_medico) REFERENCES medicos(id_medico),
    CONSTRAINT fk_citas_clinica
        FOREIGN KEY (id_clinica) REFERENCES clinicas(id_clinica)
);

CREATE TABLE consultas (
    id_consulta INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_cita INT NOT NULL UNIQUE,
    fecha_consulta TIMESTAMP NOT NULL DEFAULT NOW(),
    motivo_consulta VARCHAR(200),
    observaciones_generales TEXT,
    CONSTRAINT fk_consultas_cita
        FOREIGN KEY (id_cita) REFERENCES citas(id_cita)
);

CREATE TABLE diagnosticos (
    id_diagnostico INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_consulta INT NOT NULL UNIQUE,
    sintomas TEXT,
    descripcion_diagnostico VARCHAR(200) NOT NULL,
    observaciones TEXT,
    fecha_diagnostico TIMESTAMP NOT NULL DEFAULT NOW(),
    creado_en TIMESTAMP NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_diagnosticos_consulta
        FOREIGN KEY (id_consulta) REFERENCES consultas(id_consulta)
);

CREATE TABLE tratamientos (
    id_tratamiento INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL UNIQUE,
    descripcion TEXT,
    precio_base DECIMAL(10,2),
    activo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE tratamientos_disponibles (
    id_tratamiento_disponible INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_clinica INT NOT NULL,
    id_tratamiento INT NOT NULL,
    disponible BOOLEAN NOT NULL DEFAULT TRUE,
    CONSTRAINT fk_tratamientos_disponibles_clinica
        FOREIGN KEY (id_clinica) REFERENCES clinicas(id_clinica),
    CONSTRAINT fk_tratamientos_disponibles_tratamiento
        FOREIGN KEY (id_tratamiento) REFERENCES tratamientos(id_tratamiento),
    CONSTRAINT uq_tratamientos_disponibles UNIQUE (id_clinica, id_tratamiento)
);

CREATE TABLE tratamientos_administrados (
    id_tratamiento_administrado INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_consulta INT NOT NULL,
    id_tratamiento INT NOT NULL,
    fecha_inicio DATE NOT NULL DEFAULT CURRENT_DATE,
    fecha_fin DATE,
    indicaciones TEXT,
    estado estado_tratamiento NOT NULL DEFAULT 'activo',
    observaciones TEXT,
    creado_en TIMESTAMP NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_tratamientos_administrados_consulta
        FOREIGN KEY (id_consulta) REFERENCES consultas(id_consulta),
    CONSTRAINT fk_tratamientos_administrados_tratamiento
        FOREIGN KEY (id_tratamiento) REFERENCES tratamientos(id_tratamiento)
);

CREATE TABLE pruebas (
    id_prueba INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL UNIQUE,
    descripcion TEXT,
    precio_base DECIMAL(10,2),
    activo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE pruebas_disponibles (
    id_prueba_disponible INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_clinica INT NOT NULL,
    id_prueba INT NOT NULL,
    disponible BOOLEAN NOT NULL DEFAULT TRUE,
    CONSTRAINT fk_pruebas_disponibles_clinica
        FOREIGN KEY (id_clinica) REFERENCES clinicas(id_clinica),
    CONSTRAINT fk_pruebas_disponibles_prueba
        FOREIGN KEY (id_prueba) REFERENCES pruebas(id_prueba),
    CONSTRAINT uq_pruebas_disponibles UNIQUE (id_clinica, id_prueba)
);

CREATE TABLE pruebas_realizadas (
    id_prueba_realizada INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_consulta INT NOT NULL,
    id_prueba INT NOT NULL,
    fecha_solicitud DATE NOT NULL DEFAULT CURRENT_DATE,
    fecha_resultado DATE,
    estado estado_prueba NOT NULL DEFAULT 'solicitada',
    resultado_resumen TEXT,
    observaciones TEXT,
    creado_en TIMESTAMP NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_pruebas_realizadas_consulta
        FOREIGN KEY (id_consulta) REFERENCES consultas(id_consulta),
    CONSTRAINT fk_pruebas_realizadas_prueba
        FOREIGN KEY (id_prueba) REFERENCES pruebas(id_prueba)
);

CREATE TABLE facturas (
    id_factura INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    numero_factura VARCHAR(30) NOT NULL UNIQUE,
    id_paciente INT NOT NULL,
    id_clinica INT NOT NULL,
    fecha_emision DATE NOT NULL DEFAULT CURRENT_DATE,
    total DECIMAL(10,2) NOT NULL DEFAULT 0,
    estado estado_factura NOT NULL DEFAULT 'pendiente',
    metodo_pago metodo_pago,
    creado_en TIMESTAMP NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_facturas_paciente
        FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente),
    CONSTRAINT fk_facturas_clinica
        FOREIGN KEY (id_clinica) REFERENCES clinicas(id_clinica)
);

CREATE TABLE factura_detalle (
    id_detalle INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_factura INT NOT NULL,
    id_consulta INT,
    id_prueba_realizada INT,
    id_tratamiento_administrado INT,
    concepto VARCHAR(200) NOT NULL,
    cantidad INT NOT NULL DEFAULT 1,
    precio_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_factura_detalle_factura
        FOREIGN KEY (id_factura) REFERENCES facturas(id_factura),
    CONSTRAINT fk_factura_detalle_consulta
        FOREIGN KEY (id_consulta) REFERENCES consultas(id_consulta),
    CONSTRAINT fk_factura_detalle_prueba_realizada
        FOREIGN KEY (id_prueba_realizada) REFERENCES pruebas_realizadas(id_prueba_realizada),
    CONSTRAINT fk_factura_detalle_tratamiento_administrado
        FOREIGN KEY (id_tratamiento_administrado) REFERENCES tratamientos_administrados(id_tratamiento_administrado)
);