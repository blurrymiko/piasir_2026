-- Registros SQL: BBDD clinica_privada

-- Clínicas:
INSERT INTO clinicas (nombre, direccion, telefono, email) VALUES
('Madrid Castellana', 'Calle Alcala 125, Madrid', '910352055', 'castellana@clinicaprivada.es'),
('Madrid Norte', 'Avenida de la Ilustración 42, Madrid', '910330711', 'norte@clinicaprivada.es');

-- Aseguradoras:
INSERT INTO aseguradoras (nombre, telefono, email) VALUES
('Sanitas', '900100100', 'clientes@sanitas.es'),
('Adeslas', '900505040', 'atencioncliente@adeslas.es'),
('Asepeyo', '900810072', 'clientes@asepeyo.es');

-- Especialidades:
INSERT INTO especialidades (nombre) VALUES
('Medicina General'),
('Traumatología'),
('Dermatología'),
('Cardiología');

-- Tratamientos:
INSERT INTO tratamientos (nombre, descripcion, precio_base) VALUES
('Fisioterapia general', 'Sesiones de fisioterapia orientadas a recuperación funcional y alivio del dolor musculoesquelético.', 35.00),
('Infiltración articular', 'Administración local intraarticular para alivio del dolor e inflamación.', 110.00),
('Tratamiento antihipertensivo inicial', 'Inicio de tratamiento farmacológico para control de tensión arterial.', 25.00),
('Crioterapia dermatológica', 'Aplicación de frío para tratamiento de lesiones dermatológicas.', 80.00),
('Rehabilitación de rodilla', 'Programa de recuperación funcional para procesos traumatológicos o postquirúrgicos de rodilla.', 45.00),
('Rehabilitación lumbar', 'Programa de recuperación funcional para dolor lumbar y patología musculoesquelética.', 40.00),
('Rehabilitación de cadera', 'Programa de recuperación funcional para procesos traumatológicos o postquirúrgicos de cadera.', 50.00),
('Tratamiento antibiótico', 'Administración de antibióticos para infecciones bacterianas.', 20.00),
('Tratamiento analgésico', 'Control del dolor mediante medicación.', 15.00),
('Tratamiento antiinflamatorio', 'Reducción de inflamación mediante medicación.', 18.00);

-- Pruebas:
INSERT INTO pruebas (nombre, descripcion, precio_base) VALUES
('Analítica sanguínea', 'Análisis general completo de sangre para parámetros básicos y control.', 45.00),
('Electrocardiograma', 'Registro de la actividad eléctrica del corazón.', 60.00),
('Radiografía', 'Prueba de imagen para valoración de huesos, articulaciones y partes blandas.', 75.00),
('Ecografía', 'Prueba de imagen no invasiva para visualizar órganos internos, tejidos blandos y flujo sanguíneo en tiempo real.', 90.00),
('Tomografía computarizada', 'Prueba de imagen para obtener imágenes detalladas en cortes transversales del interior del cuerpo.', 160.00),
('Tomografía computarizada con contraste', 'Prueba de imagen para obtener imágenes detalladas en cortes transversales del interior del cuerpo con contraste.', 250.00),
('Biopsia cutánea', 'Extracción de muestra de piel para estudio anatomopatológico.', 120.00);

-- Pacientes:
INSERT INTO pacientes (numero_historia, dni, nombre, apellidos, fecha_nacimiento, sexo, telefono, email, direccion, id_aseguradora, numero_poliza) VALUES
(1, '12345678A', 'Ana', 'López Pérez', '1990-05-12', 'F', '690239031', 'ana.lopez@email.com', 'Calle Goya 22, Madrid', 1, 'SAN-001245'),
(2, '23456789B', 'Carlos', 'Ruiz Martín', '1982-09-23', 'M', '628909310', 'carlos.ruiz@email.com', 'Calle Atocha 14, Madrid', 2, 'ADE-889912'),
(3, '34567890C', 'Lucía', 'Fernández Soto', '1995-02-17', 'F', '698204260', 'lucia.fernandez@email.com', 'Calle Serrano 81, Madrid', 3, 'ASP-561234'),
(4, '45678901D', 'Mario', 'Gómez Vidal', '1988-11-03', 'M', '620304022', 'mario.gomez@email.com', 'Calle Toledo 7, Madrid', NULL, NULL),
(5, '56789012E', 'Sara', 'Jiménez Cano', '1992-07-29', 'F', '650352042', 'sara.jimenez@email.com', 'Paseo Extremadura 30, Madrid', 1, 'SAN-004587'),
(6, '67890123F', 'David', 'Moreno Lara', '1979-01-08', 'M', '670864310', 'david.moreno@email.com', 'Calle Bravo Murillo 98, Madrid', 2, 'ADE-451223'),
(7, '78901234G', 'Paula', 'Ortega Núñez', '2001-06-19', 'F', '632405610', 'paula.ortega@email.com', 'Calle Embajadores 55, Madrid', NULL, NULL),
(8, '89012345H', 'Jorge', 'Castillo Rey', '1985-03-11', 'M', '690667190', 'jorge.castillo@email.com', 'Calle Arturo Soria 121, Madrid', 3, 'ASP-331278'),
(9, '90123456J', 'Marta', 'Vega Santos', '1993-10-14', 'F', '635627086', 'marta.vega@email.com', 'Calle Velázquez 66, Madrid', 1, 'SAN-008932'),
(10, '01234567K', 'Raúl', 'Prieto Gómez', '1975-12-02', 'M', '644903278', 'raul.prieto@email.com', 'Calle Príncipe de Vergara 41, Madrid', NULL, NULL),
(11, '11223344L', 'Noelia', 'Campos Gil', '1998-04-21', 'F', '622903784', 'noelia.campos@email.com', 'Avenida Monforte de Lemos 15, Madrid', 2, 'ADE-771245'),
(12, '22334455M', 'Hugo', 'Medina Pérez', '1987-08-30', 'M', '670322341', 'hugo.medina@email.com', 'Calle Oca 18, Madrid', 3, 'ASP-945612');

-- Médicos:
INSERT INTO medicos (id_especialidad, nombre, apellidos, num_colegiado, telefono, email) VALUES
(1, 'Laura', 'Martín Gómez', 'COL-284739', '630302332', 'laura.martin@clinicaprivada.es'),
(4, 'Javier', 'Sánchez Ruiz', 'COL-281562', '622319021', 'javier.sanchez@clinicaprivada.es'),
(3, 'Elena', 'Romero Díaz', 'COL-289104', '670434380', 'elena.romero@clinicaprivada.es'),
(2, 'Pablo', 'Torres León', 'COL-283877', '635400219', 'pablo.torres@clinicaprivada.es'),
(1, 'Carmen', 'Navarro Gil', 'COL-286245', '625667291', 'carmen.navarro@clinicaprivada.es'),
(2, 'Diego', 'Herrera Castro', 'COL-282993', '660100234', 'diego.herrera@clinicaprivada.es');


-- Médicos-clínicas
-- Clínicas-especialidades
-- Tratamientos-disponibles
-- Pruebas-disponibles

-- Citas:
INSERT INTO citas (id_paciente, id_medico, id_clinica, fecha_hora, motivo, estado) VALUES
(1, 1, 1, '2026-03-10 09:00:00', 'Revisión general y molestias de garganta', 'completada'),
(2, 2, 1, '2026-03-11 10:00:00', 'Palpitaciones y control de tensión arterial', 'completada'),
(3, 3, 1, '2026-03-12 11:30:00', 'Revisión de lesión cutánea en antebrazo', 'completada'),
(4, 4, 1, '2026-03-13 12:00:00', 'Dolor persistente en rodilla derecha', 'completada'),
(5, 5, 2, '2026-03-14 09:30:00', 'Dolor lumbar tras esfuerzo físico', 'completada'),
(6, 6, 2, '2026-03-15 16:00:00', 'Molestia muscular en muslo izquierdo', 'completada'),
(7, 1, 1, '2026-03-18 08:45:00', 'Consulta general por cefalea', 'cancelada'),
(8, 2, 1, '2026-03-19 10:15:00', 'Control cardiológico rutinario', 'completada'),
(9, 3, 2, '2026-03-20 11:00:00', 'Dermatitis y picor persistente', 'completada'),
(10, 4, 1, '2026-03-21 13:00:00', 'Dolor articular en rodilla izquierda', 'completada'),
(11, 5, 2, '2026-04-02 09:00:00', 'Revisión anual de medicina general', 'pendiente'),
(12, 6, 2, '2026-04-03 10:30:00', 'Dolor en tobillo tras ejercicio', 'confirmada'),
(1, 2, 1, '2026-04-05 12:30:00', 'Seguimiento cardiológico', 'confirmada'),
(4, 1, 1, '2026-04-06 17:00:00', 'Revisión general previa a tratamiento', 'pendiente');

-- Consultas:
INSERT INTO consultas (id_cita, fecha_consulta, motivo_consulta, observaciones_generales) VALUES
(1, '2026-03-10', 'Revisión general por malestar y dolor de garganta', 'Paciente estable. Se recomienda hidratación y seguimiento.'),
(2, '2026-03-11', 'Valoración de palpitaciones e hipertensión inicial', 'Se solicita ECG y control de tensión arterial domiciliario.'),
(3, '2026-03-12', 'Estudio de lesión cutánea en antebrazo', 'Lesión pigmentada de bordes irregulares.'),
(4, '2026-03-13', 'Valoración traumatológica de rodilla derecha', 'Dolor a la flexión, posible tendinopatía.'),
(5, '2026-03-14', 'Lumbalgia mecánica tras esfuerzo', 'Sin signos neurológicos de alarma.'),
(6, '2026-03-15', 'Dolor lumbar y rigidez muscular', 'Posible contractura muscular.'),
(8, '2026-03-19', 'Control cardiológico rutinario', 'Paciente con buen estado general y sin episodios recientes.'),
(9, '2026-03-20', 'Revisión dermatológica por dermatitis', 'Lesiones eritematosas leves en ambas manos.'),
(10, '2026-03-21', 'Dolor articular de rodilla izquierda', 'Se valora infiltración si no mejora con tratamiento conservador.');

-- Diagnósticos:
INSERT INTO diagnosticos (id_consulta, sintomas, descripcion_diagnostico, observaciones, fecha_diagnostico) VALUES
(1, 'Dolor de garganta, cansancio leve, congestión nasal', 'Faringitis leve de origen viral', 'No requiere antibiótico. Tratamiento sintomático.', '2026-03-10'),
(2, 'Palpitaciones, cifras tensionales elevadas, cefalea ocasional', 'Hipertensión arterial inicial', 'Se inicia control y tratamiento farmacológico.', '2026-03-11'),
(3, 'Lesión pigmentada, cambio de coloración, leve picor', 'Nevus a estudio', 'Se decide biopsia cutánea para confirmación.', '2026-03-12'),
(4, 'Dolor de rodilla, limitación funcional, inflamación leve', 'Gonalgia derecha por tendinitis rotuliana', 'Se solicita radiografía y fisioterapia.', '2026-03-13'),
(5, 'Dolor lumbar, rigidez matutina, limitación de movimiento', 'Lumbalgia aguda mecánica', 'Se recomienda rehabilitación lumbar.', '2026-03-14'),
(6, 'Dolor muscular localizado, tirantez, molestia al esfuerzo', 'Contractura muscular lumbar', 'Se pauta tratamiento conservador.', '2026-03-15'),
(7, 'Palpitaciones ocasionales sin disnea ni dolor torácico', 'Extrasístoles benignas', 'Seguimiento clínico y ECG de control.', '2026-03-19'),
(8, 'Picor, eritema, sequedad cutánea', 'Dermatitis de contacto', 'Se recomienda evitar irritantes.', '2026-03-20'),
(9, 'Dolor al caminar, inflamación y rigidez en rodilla izquierda', 'Sinovitis leve de rodilla izquierda', 'Valorar infiltración si persiste dolor.', '2026-03-21');

-- Tratamientos (administrados):
INSERT INTO tratamientos_administrados
(id_consulta, id_tratamiento, fecha_inicio, fecha_fin, indicaciones, estado_tratamiento, observaciones) VALUES
(1, 9, '2026-03-10', '2026-03-13', 'Tomar un analgésico cada 8 horas si dolor.', 'finalizado', 'Mejora progresiva sin complicaciones.'),
(2, 3, '2026-03-11', NULL, 'Tomar una dosis diaria y controlar tensión arterial en domicilio.', 'activo', 'Se revisará evolución en 4 semanas.'),
(3, 4, '2026-03-16', '2026-03-16', 'Aplicación local en consulta dermatológica.', 'finalizado', 'Procedimiento tolerado sin incidencias.'),
(4, 5, '2026-03-14', '2026-03-28', 'Dos sesiones semanales de rehabilitación y ejercicios de fortalecimiento.', 'finalizado', 'Buena evolución funcional de la rodilla derecha.'),
(5, 6, '2026-03-15', NULL, 'Ejercicios de fortalecimiento lumbar y sesiones guiadas.', 'activo', 'Pendiente de nueva valoración clínica.'),
(6, 1, '2026-03-16', '2026-03-20', 'Sesiones de fisioterapia general y reposo relativo.', 'suspendido', 'Suspendido por incompatibilidad horaria del paciente.'),
(8, 9, '2026-03-20', '2026-03-25', 'Tomar analgésico si dolor o picor.', 'finalizado', 'Mejora sintomática a los pocos días.'),
(9, 2, '2026-03-21', '2026-03-21', 'Infiltración única y reposo 48 horas.', 'finalizado', 'Control posterior si persisten síntomas.');

-- Pruebas (realizadas):
INSERT INTO pruebas_realizadas (id_consulta, id_prueba, fecha_solicitud, fecha_resultado, estado, resultado_resumen, observaciones) VALUES
(2, 2, '2026-03-11', '2026-03-11', 'realizada', 'Ritmo sinusal, sin hallazgos agudos.', 'Prueba realizada en la misma jornada.'),
(3, 7, '2026-03-12', '2026-03-16', 'realizada', 'Muestra remitida a anatomía patológica. Lesión benigna.', 'Sin incidencias durante la toma de muestra.'),
(4, 3, '2026-03-13', '2026-03-14', 'realizada', 'Sin fractura. Cambios inflamatorios leves.', 'Se recomienda tratamiento conservador.'),
(5, 1, '2026-03-14', '2026-03-15', 'realizada', 'Parámetros generales dentro de rango.', 'Analítica de control previa a tratamiento.'),
(6, 4, '2026-03-15', NULL, 'programada', 'Pendiente de realización.', 'Citada para la semana siguiente.'),
 (7, 2, '2026-03-19', NULL, 'solicitada', 'Solicitud registrada pendiente de agenda.', 'Se realizará en próxima revisión.'),
(8, 1, '2026-03-20', NULL, 'cancelada', 'Prueba cancelada por mejoría clínica.', 'No se considera necesaria actualmente.');

-- Facturas:
INSERT INTO facturas
(numero_factura, id_paciente, id_clinica, fecha_emision, total, estado_factura, metodo_pago) VALUES
('2603-CC-001', 1, 1, '2026-03-10', 65.00, 'pagada', 'tarjeta'),
('2603-CC-002', 4, 1, '2026-03-14', 190.00, 'pagada', 'transferencia'),
('2603-CC-003', 3, 1, '2026-03-16', 260.00, 'pendiente', 'seguro'),
('2603-CN-001', 5, 2, '2026-03-15', 85.00, 'pagada', 'seguro'),
('2603-CC-004', 10, 1, '2026-03-21', 170.00, 'anulada', 'efectivo');


/* REVISAR
-- Factura (detalle):
INSERT INTO factura_detalle
(id_factura, id_consulta, id_prueba_realizada, id_tratamiento_administrado, concepto, cantidad, precio_unitario, subtotal) VALUES
(1, 1, NULL, NULL, 'Consulta de medicina general', 1, 50.00, 50.00),
(1, NULL, NULL, 9, 'Tratamiento analgésico', 1, 15.00, 15.00),

(2, 4, NULL, NULL, 'Consulta de traumatología', 1, 70.00, 70.00),
(2, NULL, 3, NULL, 'Radiografía', 1, 75.00, 75.00),
(2, NULL, NULL, 5, 'Rehabilitación de rodilla', 1, 45.00, 45.00),

(3, 3, NULL, NULL, 'Consulta de dermatología', 1, 60.00, 60.00),
(3, NULL, 2, NULL, 'Biopsia cutánea', 1, 120.00, 120.00),
(3, NULL, NULL, 4, 'Crioterapia dermatológica', 1, 80.00, 80.00),

(4, 5, NULL, NULL, 'Consulta de medicina general', 1, 40.00, 40.00),
(4, NULL, 4, NULL, 'Analítica sanguínea', 1, 45.00, 45.00),

(5, 9, NULL, NULL, 'Consulta de traumatología', 1, 60.00, 60.00),
(5, NULL, NULL, 2, 'Infiltración articular', 1, 110.00, 110.00);



