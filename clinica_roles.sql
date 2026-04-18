-- Roles y privilegios SQL: BBDD clinica_privada

CREATE ROLE dba NOLOGIN;
CREATE ROLE consultas NOLOGIN;
CREATE ROLE escritura NOLOGIN;
CREATE ROLE replica WITH LOGIN REPLICATION PASSWORD 'C2GnFn@v9M8.';

CREATE ROLE dba1 WITH LOGIN PASSWORD 'C2GnFn@v9M8.';
CREATE ROLE tecnico1 WITH LOGIN PASSWORD '4WL6kcY9-kjE';
CREATE ROLE trabajador1 WITH LOGIN PASSWORD '4WL6kcY9-kjE';

GRANT dba TO dba1;
GRANT consultas TO tecnico1;
GRANT escritura TO trabajador1;

-- Creamos la base de datos 
-- CREATE DATABASE clinica_privada OWNER dba1;
GRANT CONNECT ON DATABASE clinica_privada TO dba, consultas, escritura;

-- Trabajamos ya como dba1
-- psql -U dba1 -d clinica_privada o \c clinica_privada SET ROLE dba1;
GRANT USAGE ON SCHEMA public TO consultas, escritura;
GRANT CREATE ON SCHEMA public TO dba;

-- Importamos la estructura (clinica_schema)
GRANT SELECT ON ALL TABLES IN SCHEMA public TO consultas;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA public TO consultas;
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA public TO escritura;
GRANT USAGE, SELECT, UPDATE ON ALL SEQUENCES IN SCHEMA public TO escritura;

ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO consultas;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON SEQUENCES TO consultas;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT, INSERT, UPDATE ON TABLES TO escritura;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT USAGE, SELECT, UPDATE ON SEQUENCES TO escritura;

-- Importamos índices (clinica_index) y registros (clinica_registros)







