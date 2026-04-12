-- Registros SQL: BBDD clinica_privada

-- Clínicas: Madrid Norte, Madrid Castellana
    nombre VARCHAR(100) NOT NULL UNIQUE,
    direccion VARCHAR(200) NOT NULL,
    telefono VARCHAR(15),
    email VARCHAR(120),

-- Aseguradoras: Mapfre, Adeslas, Sanitas
    nombre VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(15),
    email VARCHAR(120)

-- Especialidades: Medicina Familiar, Psicología, Traumatología, Dermatología
    nombre VARCHAR(100) NOT NULL UNIQUE

-- Médicos: Alejandro Álvarez (Familiar), Luis Fanjul (Familiar), Lucía Martínez (Traumatología), Noel González (Traumatología), Violeta Palencia (Psicología), Sergio Longoria (Dermatología)
!!  id_especialidad INT NOT NULL,
    nombre VARCHAR(80) NOT NULL,
    apellidos VARCHAR(120) NOT NULL,
    num_colegiado VARCHAR(20) NOT NULL UNIQUE,
    telefono VARCHAR(15),
    email VARCHAR(120) UNIQUE,


-- Facturas:
    numero_factura VARCHAR(30) NOT NULL UNIQUE,
!!  id_paciente INT NOT NULL,
!!  id_clinica INT NOT NULL,
    fecha_emision DATE NOT NULL DEFAULT CURRENT_DATE,
    total DECIMAL(10,2) NOT NULL DEFAULT 0,
    estado estado_factura NOT NULL DEFAULT 'pendiente',
    metodo_pago metodo_pago,

-- Facturas (detalle):
!!  id_factura INT NOT NULL,
!!  id_consulta INT,
!!  id_prueba_realizada INT,
!!  id_tratamiento_administrado INT,
    concepto VARCHAR(200) NOT NULL,
    cantidad INT NOT NULL DEFAULT 1,
    precio_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,


/* Adelanta tú mañana en lo que termino de repasar el SQL*/
-- Pacientes:
    dni VARCHAR(12) NOT NULL UNIQUE,
    nombre VARCHAR(80) NOT NULL,
    apellidos VARCHAR(120) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    sexo VARCHAR(15),
    telefono VARCHAR(15),
    email VARCHAR(120),
    direccion VARCHAR(200),
!!  id_aseguradora INT, 
    numero_poliza VARCHAR(30),

-- Citas:
!!  id_paciente INT NOT NULL,
!!  id_medico INT NOT NULL,
!!  id_clinica INT NOT NULL,
    fecha_hora TIMESTAMP NOT NULL,
    motivo VARCHAR(200) NOT NULL,
    estado estado_cita NOT NULL DEFAULT 'pendiente',

-- Consultas:
!!  id_cita INT NOT NULL UNIQUE,
    fecha_consulta TIMESTAMP NOT NULL DEFAULT NOW(),
    motivo_consulta VARCHAR(200),
    observaciones_generales TEXT,

-- Diagnósticos:
!!  id_consulta INT NOT NULL UNIQUE,
    sintomas TEXT,
    descripcion_diagnostico VARCHAR(200) NOT NULL,
    observaciones TEXT,
    fecha_diagnostico TIMESTAMP NOT NULL DEFAULT NOW(),

-- Pruebas:
    nombre VARCHAR(120) NOT NULL UNIQUE,
    descripcion TEXT,
    precio_base DECIMAL(10,2),

-- Pruebas (realizadas):
!!  id_consulta INT NOT NULL,
!!  id_prueba INT NOT NULL,
    fecha_solicitud DATE NOT NULL DEFAULT CURRENT_DATE,
    fecha_resultado DATE,
    estado estado_prueba NOT NULL DEFAULT 'solicitada',
    resultado_resumen TEXT,
    observaciones TEXT,

-- Tratamientos:
    nombre VARCHAR(120) NOT NULL UNIQUE,
    descripcion TEXT,
    precio_base DECIMAL(10,2),

-- Tratamientos (administrados):
!!  id_consulta INT NOT NULL,
!!  id_tratamiento INT NOT NULL,
    fecha_inicio DATE NOT NULL DEFAULT CURRENT_DATE,
    fecha_fin DATE,
    indicaciones TEXT,
    estado_tratamiento NOT NULL DEFAULT 'activo',
    observaciones TEXT,


