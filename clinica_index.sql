-- Índices SQL: BBDD clinica_privada

CREATE INDEX idx_pacientes_aseguradora
    ON pacientes(id_aseguradora);

CREATE INDEX idx_pacientes_apellidos_nombre
    ON pacientes(apellidos, nombre);

CREATE INDEX idx_medicos_especialidad
    ON medicos(id_especialidad);

CREATE INDEX idx_medicos_apellidos_nombre
    ON medicos(apellidos, nombre);

CREATE INDEX idx_medicos_clinicas_medico
    ON medicos_clinicas(id_medico);

CREATE INDEX idx_medicos_clinicas_clinica
    ON medicos_clinicas(id_clinica);

CREATE UNIQUE INDEX idx_medico_clinica_principal
    ON medicos_clinicas(id_medico)
    WHERE es_principal = TRUE;

CREATE INDEX idx_citas_paciente
    ON citas(id_paciente);

CREATE INDEX idx_citas_medico
    ON citas(id_medico);

CREATE INDEX idx_citas_clinica
    ON citas(id_clinica);

CREATE INDEX idx_citas_fecha_hora
    ON citas(fecha_hora);

CREATE INDEX idx_citas_medico_fecha_hora
    ON citas(id_medico, fecha_hora);

CREATE INDEX idx_citas_clinica_fecha_hora
    ON citas(id_clinica, fecha_hora);

CREATE INDEX idx_consultas_fecha_consulta
    ON consultas(fecha_consulta);

CREATE INDEX idx_diagnosticos_descripcion
    ON diagnosticos(descripcion_diagnostico);

CREATE INDEX idx_tratamientos_administrados_consulta
    ON tratamientos_administrados(id_consulta);

CREATE INDEX idx_tratamientos_administrados_tratamiento
    ON tratamientos_administrados(id_tratamiento);

CREATE INDEX idx_tratamientos_administrados_estado
    ON tratamientos_administrados(estado);

CREATE INDEX idx_pruebas_realizadas_consulta
    ON pruebas_realizadas(id_consulta);

CREATE INDEX idx_pruebas_realizadas_prueba
    ON pruebas_realizadas(id_prueba);

CREATE INDEX idx_pruebas_realizadas_estado
    ON pruebas_realizadas(estado);

CREATE INDEX idx_facturas_paciente
    ON facturas(id_paciente);

CREATE INDEX idx_facturas_clinica
    ON facturas(id_clinica);

CREATE INDEX idx_facturas_fecha_emision
    ON facturas(fecha_emision);

CREATE INDEX idx_facturas_estado
    ON facturas(estado);

CREATE INDEX idx_factura_detalle_factura
    ON factura_detalle(id_factura);

CREATE INDEX idx_factura_detalle_consulta
    ON factura_detalle(id_consulta);

CREATE INDEX idx_factura_detalle_prueba_realizada
    ON factura_detalle(id_prueba_realizada);

CREATE INDEX idx_factura_detalle_tratamiento_administrado
    ON factura_detalle(id_tratamiento_administrado);