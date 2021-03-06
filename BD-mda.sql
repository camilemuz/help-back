-- SQL Manager for PostgreSQL 5.6.2.46690
-- ---------------------------------------
-- Host      : localhost
-- Database  : bd-mda
-- Version   : PostgreSQL 10.11, compiled by Visual C++ build 1800, 64-bit



CREATE SCHEMA bitacora AUTHORIZATION postgres;
SET check_function_bodies = false;
--
-- Definition for function usuario_modificado (OID = 27208) : 
--
SET search_path = public, pg_catalog;
CREATE FUNCTION public.usuario_modificado (
)
RETURNS trigger
AS 
$body$
DECLARE

BEGIN
  INSERT INTO bitacora.bit_usuario
  (
    id_usuario,
    nombre,
    ap_paterno,
    ap_materno,
    ci,
    password,
    email,
    rol_id_rol,
    cargo_id_cargo,
    division_id_division,
    baja_logica,
    usuario_registro,
    fecha_registro,
    ip_registro
  )
  VALUES (
    OLD.id_usuario,
    OLD.nombre,
    OLD.ap_paterno,
    OLD.ap_materno,
    OLD.ci,
    OLD.password,
    OLD.email,
    OLD.rol_id_rol,
    OLD.cargo_id_cargo,
    OLD.division_id_division,
    OLD.baja_logica,
    OLD.usuario_registro,
    OLD.fecha_registro,
    OLD.ip_registro
  );
	RETURN NEW;
END;
$body$
LANGUAGE plpgsql;
--
-- Structure for table asignado (OID = 26893) : 
--
CREATE TABLE public.asignado (
    id_asignado serial NOT NULL,
    fecha date NOT NULL,
    ticket_id_ticket integer NOT NULL,
    usuario_id_usuario integer NOT NULL,
    asignado varchar(50) NOT NULL,
    baja_logica boolean DEFAULT false,
    fecha_registro timestamp without time zone DEFAULT now() NOT NULL,
    usuario_registro varchar(50) DEFAULT "current_user"() NOT NULL,
    ip_registro varchar(50) DEFAULT inet_client_addr() NOT NULL
)
WITH (oids = false);
--
-- Structure for table calificacion (OID = 26905) : 
--
CREATE TABLE public.calificacion (
    id_calificacion serial NOT NULL,
    calificacion varchar(50) NOT NULL,
    cod char(7) NOT NULL,
    baja_logica boolean DEFAULT false,
    fecha_registro timestamp without time zone DEFAULT now() NOT NULL,
    usuario_registro varchar(50) DEFAULT "current_user"() NOT NULL,
    ip_registro varchar(50) DEFAULT inet_client_addr() NOT NULL
)
WITH (oids = false);
--
-- Structure for table calificacion_ticket_usuario (OID = 26917) : 
--
CREATE TABLE public.calificacion_ticket_usuario (
    id_calificacion_ticket serial NOT NULL,
    calificacion_id_calificacion integer NOT NULL,
    ticket_id_ticket integer NOT NULL,
    usuario_id_usuario integer NOT NULL,
    baja_logica boolean DEFAULT false,
    fecha_registro timestamp without time zone DEFAULT now() NOT NULL,
    usuario_registro varchar(50) DEFAULT "current_user"() NOT NULL,
    ip_registro varchar(50) DEFAULT inet_client_addr() NOT NULL
)
WITH (oids = false);
--
-- Structure for table cargo (OID = 26929) : 
--
CREATE TABLE public.cargo (
    id_cargo serial NOT NULL,
    cod char(7) NOT NULL,
    cargo varchar(30) NOT NULL,
    prioridad_id_prioridad integer NOT NULL,
    baja_logica boolean DEFAULT false,
    fecha_registro timestamp without time zone DEFAULT now() NOT NULL,
    usuario_registro varchar(50) DEFAULT "current_user"() NOT NULL,
    ip_registro varchar(50) DEFAULT inet_client_addr() NOT NULL
)
WITH (oids = false);
--
-- Structure for table categoria (OID = 26941) : 
--
CREATE TABLE public.categoria (
    id_categoria serial NOT NULL,
    categoria varchar(100) NOT NULL,
    cod char(7) NOT NULL,
    baja_logica boolean DEFAULT false,
    fecha_registro timestamp without time zone DEFAULT now() NOT NULL,
    usuario_registro varchar(50) DEFAULT "current_user"() NOT NULL,
    ip_registro varchar(50) DEFAULT inet_client_addr() NOT NULL
)
WITH (oids = false);
--
-- Structure for table departamento (OID = 26953) : 
--
CREATE TABLE public.departamento (
    id_departamento serial NOT NULL,
    departamento varchar(30) NOT NULL,
    cod char(7) NOT NULL,
    baja_logica boolean DEFAULT false,
    fecha_registro timestamp without time zone DEFAULT now() NOT NULL,
    usuario_registro varchar(50) DEFAULT "current_user"() NOT NULL,
    ip_registro varchar(50) DEFAULT inet_client_addr() NOT NULL
)
WITH (oids = false);
--
-- Structure for table division (OID = 26965) : 
--
CREATE TABLE public.division (
    id_division serial NOT NULL,
    cod char(7) NOT NULL,
    division varchar(30) NOT NULL,
    baja_logica boolean DEFAULT false,
    fecha_registro timestamp without time zone DEFAULT now() NOT NULL,
    usuario_registro varchar(50) DEFAULT "current_user"() NOT NULL,
    ip_registro varchar(50) DEFAULT inet_client_addr() NOT NULL
)
WITH (oids = false);
--
-- Structure for table estado (OID = 26977) : 
--
CREATE TABLE public.estado (
    id_estado serial NOT NULL,
    cod char(7) NOT NULL,
    estado varchar(30) NOT NULL,
    baja_logica boolean DEFAULT false,
    fecha_registro timestamp without time zone DEFAULT now() NOT NULL,
    usuario_registro varchar(50) DEFAULT "current_user"() NOT NULL,
    ip_registro varchar(50) DEFAULT inet_client_addr() NOT NULL
)
WITH (oids = false);
--
-- Structure for table municipio (OID = 26989) : 
--
CREATE TABLE public.municipio (
    id_lugar serial NOT NULL,
    lugar varchar(50) NOT NULL,
    cod char(7) NOT NULL,
    baja_logica boolean DEFAULT false,
    fecha_registro timestamp without time zone DEFAULT now() NOT NULL,
    usuario_registro varchar(50) DEFAULT "current_user"() NOT NULL,
    ip_registro varchar(50) DEFAULT inet_client_addr() NOT NULL
)
WITH (oids = false);
--
-- Structure for table prioridad (OID = 27001) : 
--
CREATE TABLE public.prioridad (
    id_prioridad serial NOT NULL,
    prioridad varchar(30) NOT NULL,
    cod char(7) NOT NULL,
    baja_logica boolean DEFAULT false,
    fecha_registro timestamp without time zone DEFAULT now() NOT NULL,
    usuario_registro varchar(50) DEFAULT "current_user"() NOT NULL,
    ip_registro varchar(50) DEFAULT inet_client_addr() NOT NULL
)
WITH (oids = false);


--
-- Structure for table requerimiento (OID = 27013) : 
--
CREATE TABLE public.requerimiento (
    id_requerimiento serial NOT NULL,
    descripcion varchar(1000) NOT NULL,
    usuario_id_usuario integer NOT NULL,
    interno varchar(1000) NOT NULL,
    tipo_requerimiento_id_tipo_req integer NOT NULL,
    departamento_id_departamento integer NOT NULL,
    sucursal_id_sucursal integer NOT NULL,
    archivo text ,
    baja_logica boolean DEFAULT false,
    fecha_registro timestamp without time zone DEFAULT now() NOT NULL,
    usuario_registro varchar(50) DEFAULT "current_user"() NOT NULL,
    ip_registro varchar(50) DEFAULT inet_client_addr() NOT NULL,
)
WITH (oids = false);
--
-- Structure for table rol (OID = 27028) : 
--
CREATE TABLE public.rol (
    id_rol serial NOT NULL,
    rol varchar(30) NOT NULL,
    cod char(7) NOT NULL,
    baja_logica boolean DEFAULT false,
    fecha_registro timestamp without time zone DEFAULT now() NOT NULL,
    usuario_registro varchar(50) DEFAULT "current_user"() NOT NULL,
    ip_registro varchar(50) DEFAULT inet_client_addr() NOT NULL
)
WITH (oids = false);
--
-- Structure for table sucursal (OID = 27040) : 
--
CREATE TABLE public.sucursal (
    id_sucursal serial NOT NULL,
    sucursal varchar(50) NOT NULL,
    cod char(7) NOT NULL,
    municipio_id_lugar integer NOT NULL,
    baja_logica boolean DEFAULT false,
    fecha_registro timestamp without time zone DEFAULT now() NOT NULL,
    usuario_registro varchar(50) DEFAULT "current_user"() NOT NULL,
    ip_registro varchar(50) DEFAULT inet_client_addr() NOT NULL
)
WITH (oids = false);
--
-- Structure for table ticket (OID = 27052) : 
--
CREATE TABLE public.ticket (
    id_ticket serial NOT NULL,
    numero varchar(30) NOT NULL,
    estado_id_estado integer NOT NULL,
    requerimiento_id_requerimiento integer NOT NULL,
    comentarios varchar(300) NOT NULL,
    baja_logica boolean DEFAULT false,
    fecha_registro timestamp without time zone DEFAULT now() NOT NULL,
    usuario_registro varchar(50) DEFAULT "current_user"() NOT NULL,
    ip_registro varchar(50) DEFAULT inet_client_addr() NOT NULL,
    id_padre integer,
    activo boolean DEFAULT true
)
WITH (oids = false);
--
-- Structure for table tipo_requerimiento (OID = 27064) : 
--
CREATE TABLE public.tipo_requerimiento (
    id_tipo_req serial NOT NULL,
    sub_cat varchar(100) NOT NULL,
    cod char(7) NOT NULL,
    categoria_id_categoria integer NOT NULL,
    division_id_division integer NOT NULL,
    baja_logica boolean DEFAULT false,
    fecha_registro timestamp without time zone DEFAULT now() NOT NULL,
    usuario_registro varchar(50) DEFAULT "current_user"() NOT NULL,
    ip_registro varchar(50) DEFAULT inet_client_addr() NOT NULL
)
WITH (oids = false);
--
-- Structure for table usuario (OID = 27076) : 
--
CREATE TABLE public.usuario (
    id_usuario serial NOT NULL,
    nombre varchar(30) NOT NULL,
    ap_paterno varchar(30) NOT NULL,
    ap_materno varchar(30) ,
    ci varchar(30),
    password varchar ,
    email varchar(60) NOT NULL,
    rol_id_rol integer NOT NULL,
    cargo_id_cargo integer NOT NULL,
    division_id_division integer NOT NULL,
    baja_logica boolean DEFAULT false,
    fecha_registro timestamp without time zone DEFAULT now() NOT NULL,
    usuario_registro varchar(50) DEFAULT "current_user"() NOT NULL,
    ip_registro varchar(50) DEFAULT inet_client_addr() NOT NULL
)
WITH (oids = false);
--
-- Structure for table bit_usuario (OID = 27195) : 
--
SET search_path = bitacora, pg_catalog;
CREATE TABLE bitacora.bit_usuario (
    id serial NOT NULL,
    id_usuario integer,
    nombre varchar(30) NOT NULL,
    ap_paterno varchar(30) NOT NULL,
    ap_materno varchar(30) NOT NULL,
    ci varchar(30),
    password varchar NOT NULL,
    email varchar(60) NOT NULL,
    rol_id_rol integer NOT NULL,
    cargo_id_cargo integer NOT NULL,
    division_id_division integer NOT NULL,
    baja_logica boolean DEFAULT false,
    fecha_registro timestamp without time zone DEFAULT now() NOT NULL,
    usuario_registro varchar(50) DEFAULT "current_user"() NOT NULL,
    ip_registro varchar(50) DEFAULT inet_client_addr() NOT NULL
)
WITH (oids = false);
SET search_path = public, pg_catalog;
--
-- Data for table public.asignado (OID = 26893) (LIMIT 0,9)
--
INSERT INTO asignado (id_asignado, fecha, ticket_id_ticket, usuario_id_usuario, asignado, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (1, '2021-05-30', 2, 2, '', false, '2021-05-30 00:42:22.450969', 'postgres', '127.0.0.1/32');

INSERT INTO asignado (id_asignado, fecha, ticket_id_ticket, usuario_id_usuario, asignado, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (2, '2021-05-30', 4, 2, '', false, '2021-05-30 00:42:53.376543', 'postgres', '127.0.0.1/32');

INSERT INTO asignado (id_asignado, fecha, ticket_id_ticket, usuario_id_usuario, asignado, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (3, '2021-05-30', 3, 4, '', false, '2021-05-30 05:52:15.045996', 'postgres', '127.0.0.1/32');

INSERT INTO asignado (id_asignado, fecha, ticket_id_ticket, usuario_id_usuario, asignado, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (4, '2021-05-30', 5, 4, '', false, '2021-05-30 11:52:02.817937', 'postgres', '127.0.0.1/32');

INSERT INTO asignado (id_asignado, fecha, ticket_id_ticket, usuario_id_usuario, asignado, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (5, '2021-05-31', 7, 4, '', false, '2021-05-31 21:53:59.753761', 'postgres', '127.0.0.1/32');

INSERT INTO asignado (id_asignado, fecha, ticket_id_ticket, usuario_id_usuario, asignado, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (6, '2021-05-31', 6, 4, '', false, '2021-05-31 22:01:57.303688', 'postgres', '127.0.0.1/32');

INSERT INTO asignado (id_asignado, fecha, ticket_id_ticket, usuario_id_usuario, asignado, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (7, '2021-05-31', 8, 4, '', false, '2021-05-31 22:44:14.172978', 'postgres', '127.0.0.1/32');

INSERT INTO asignado (id_asignado, fecha, ticket_id_ticket, usuario_id_usuario, asignado, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (10, '2021-06-07', 13, 4, '', false, '2021-06-07 00:12:45.960715', 'postgres', '127.0.0.1/32');

INSERT INTO asignado (id_asignado, fecha, ticket_id_ticket, usuario_id_usuario, asignado, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (11, '2021-06-07', 14, 4, '', false, '2021-06-07 00:30:53.211164', 'postgres', '127.0.0.1/32');

--
-- Data for table public.calificacion (OID = 26905) (LIMIT 0,5)
--
INSERT INTO calificacion (id_calificacion, calificacion, cod, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (1, 'Muy Mala', 'MM', false, '2021-05-26 21:29:48.49852', 'postgres', '::1/128');

INSERT INTO calificacion (id_calificacion, calificacion, cod, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (2, ' Mala', 'M', false, '2021-05-26 21:29:48.552375', 'postgres', '::1/128');

INSERT INTO calificacion (id_calificacion, calificacion, cod, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (3, 'Regular', 'R', false, '2021-05-26 21:29:48.609005', 'postgres', '::1/128');

INSERT INTO calificacion (id_calificacion, calificacion, cod, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (4, 'Buena', 'B', false, '2021-05-26 21:29:48.663049', 'postgres', '::1/128');

INSERT INTO calificacion (id_calificacion, calificacion, cod, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (5, 'Muy Buena', 'MB', false, '2021-05-26 21:29:48.716711', 'postgres', '::1/128');

--
-- Data for table public.calificacion_ticket_usuario (OID = 26917) (LIMIT 0,2)
--
INSERT INTO calificacion_ticket_usuario (id_calificacion_ticket, calificacion_id_calificacion, ticket_id_ticket, usuario_id_usuario, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (1, 4, 2, 2, false, '2021-05-31 18:39:17.385609', 'postgres', '127.0.0.1/32');

INSERT INTO calificacion_ticket_usuario (id_calificacion_ticket, calificacion_id_calificacion, ticket_id_ticket, usuario_id_usuario, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (3, 5, 8, 3, false, '2021-05-31 22:45:12.806225', 'postgres', '127.0.0.1/32');

--
-- Data for table public.cargo (OID = 26929) (LIMIT 0,7)
--
INSERT INTO cargo (id_cargo, cod, cargo, prioridad_id_prioridad, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (1, 'GEN', 'Gerente', 3, false, '2021-05-26 21:29:43.266133', 'postgres', '::1/128');

INSERT INTO cargo (id_cargo, cod, cargo, prioridad_id_prioridad, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (2, 'JDP', 'Jefe de Departamento', 3, false, '2021-05-26 21:29:43.340918', 'postgres', '::1/128');

INSERT INTO cargo (id_cargo, cod, cargo, prioridad_id_prioridad, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (3, 'JDV', 'Jefe de División', 3, false, '2021-05-26 21:29:43.412851', 'postgres', '::1/128');

INSERT INTO cargo (id_cargo, cod, cargo, prioridad_id_prioridad, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (4, 'SUP', 'Supervisor', 2, false, '2021-05-26 21:29:43.535172', 'postgres', '::1/128');

INSERT INTO cargo (id_cargo, cod, cargo, prioridad_id_prioridad, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (5, 'OFC', 'Oficial', 2, false, '2021-05-26 21:29:43.607825', 'postgres', '::1/128');

INSERT INTO cargo (id_cargo, cod, cargo, prioridad_id_prioridad, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (6, 'ADM', 'Administrativo', 1, false, '2021-05-26 21:29:43.683099', 'postgres', '::1/128');

INSERT INTO cargo (id_cargo, cod, cargo, prioridad_id_prioridad, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (7, 'AYU', 'Ayudante', 1, false, '2021-05-26 21:29:43.762009', 'postgres', '::1/128');

--
-- Data for table public.categoria (OID = 26941) (LIMIT 0,5)
--
INSERT INTO categoria (id_categoria, categoria, cod, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (1, 'Asistencia Tecnica', 'AS-TEC', false, '2021-05-26 21:29:43.836999', 'postgres', '::1/128');

INSERT INTO categoria (id_categoria, categoria, cod, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (2, 'Mantenimiento', 'MANT', false, '2021-05-26 21:29:43.913548', 'postgres', '::1/128');

INSERT INTO categoria (id_categoria, categoria, cod, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (3, 'Instalación/Reinstalación', 'INST', false, '2021-05-26 21:29:43.966322', 'postgres', '::1/128');

INSERT INTO categoria (id_categoria, categoria, cod, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (4, 'Copias de Seguridad', 'COP-SEG', false, '2021-05-26 21:29:44.019481', 'postgres', '::1/128');

INSERT INTO categoria (id_categoria, categoria, cod, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (5, 'Socilicitudes y soporte', 'SOL-SOP', false, '2021-05-26 21:29:44.07407', 'postgres', '::1/128');

--
-- Data for table public.departamento (OID = 26953) (LIMIT 0,9)
--
INSERT INTO departamento (id_departamento, departamento, cod, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (1, 'Medio Ambiente', 'MED', false, '2021-05-26 21:29:44.126095', 'postgres', '::1/128');

INSERT INTO departamento (id_departamento, departamento, cod, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (2, 'RANF', 'RANF', false, '2021-05-26 21:29:44.180511', 'postgres', '::1/128');

INSERT INTO departamento (id_departamento, departamento, cod, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (3, 'Administración', 'ADM', false, '2021-05-26 21:29:44.232764', 'postgres', '::1/128');

INSERT INTO departamento (id_departamento, departamento, cod, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (4, 'Sistemas', 'SIS', false, '2021-05-26 21:29:44.284839', 'postgres', '::1/128');

INSERT INTO departamento (id_departamento, departamento, cod, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (5, 'Comunicación', 'COM', false, '2021-05-26 21:29:44.33586', 'postgres', '::1/128');

INSERT INTO departamento (id_departamento, departamento, cod, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (6, 'Auditoria Interna', 'AUD_INT', false, '2021-05-26 21:29:44.388752', 'postgres', '::1/128');

INSERT INTO departamento (id_departamento, departamento, cod, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (7, 'Legal', 'LEG', false, '2021-05-26 21:29:44.440681', 'postgres', '::1/128');

INSERT INTO departamento (id_departamento, departamento, cod, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (8, 'Redes', 'RED', false, '2021-05-26 21:29:44.492324', 'postgres', '::1/128');

INSERT INTO departamento (id_departamento, departamento, cod, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (9, 'Catastro', 'CAT', false, '2021-05-26 21:29:44.544746', 'postgres', '::1/128');

--
-- Data for table public.division (OID = 26965) (LIMIT 0,6)
--
INSERT INTO division (id_division, cod, division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (1, 'D1', 'Tecnología', false, '2021-05-26 21:29:42.531121', 'postgres', '::1/128');

INSERT INTO division (id_division, cod, division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (2, 'D2', 'Seguridad Informática', false, '2021-05-26 21:29:42.768722', 'postgres', '::1/128');

INSERT INTO division (id_division, cod, division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (3, 'D3', 'Aplicaciones Administrativas', false, '2021-05-26 21:29:42.84123', 'postgres', '::1/128');

INSERT INTO division (id_division, cod, division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (4, 'D4', 'Producción y Control', false, '2021-05-26 21:29:42.890823', 'postgres', '::1/128');

INSERT INTO division (id_division, cod, division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (5, 'D5', 'Desarrollo', false, '2021-05-26 21:29:42.940403', 'postgres', '::1/128');

INSERT INTO division (id_division, cod, division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (6, 'D6', 'Otro', false, '2021-05-26 21:29:42.988809', 'postgres', '::1/128');

--
-- Data for table public.estado (OID = 26977) (LIMIT 0,3)
--
INSERT INTO estado (id_estado, cod, estado, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (1, 'EE', 'En Espera', false, '2021-05-26 21:29:48.77012', 'postgres', '::1/128');

INSERT INTO estado (id_estado, cod, estado, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (2, 'EP', 'En Proceso', false, '2021-05-26 21:29:48.823505', 'postgres', '::1/128');

INSERT INTO estado (id_estado, cod, estado, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (3, 'C', 'Cerrado', false, '2021-05-26 21:29:48.878209', 'postgres', '::1/128');

--
-- Data for table public.municipio (OID = 26989) (LIMIT 0,2)
--
INSERT INTO municipio (id_lugar, lugar, cod, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (2, 'El Alto', 'EALT', false, '2021-05-26 21:29:44.596955', 'postgres', '::1/128');

INSERT INTO municipio (id_lugar, lugar, cod, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (1, 'La Paz', 'LPZ', false, '2021-05-26 21:29:44.647586', 'postgres', '::1/128');

--
-- Data for table public.prioridad (OID = 27001) (LIMIT 0,3)
--
INSERT INTO prioridad (id_prioridad, prioridad, cod, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (1, 'NORMAL', 'NOR', false, '2021-05-26 21:29:43.040332', 'postgres', '::1/128');

INSERT INTO prioridad (id_prioridad, prioridad, cod, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (2, 'MEDIA', 'MED', false, '2021-05-26 21:29:43.116801', 'postgres', '::1/128');

INSERT INTO prioridad (id_prioridad, prioridad, cod, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (3, 'ALTA', 'ALTA', false, '2021-05-26 21:29:43.189577', 'postgres', '::1/128');

--
-- Data for table public.requerimiento (OID = 27013) (LIMIT 0,8)
--
INSERT INTO requerimiento (id_requerimiento, descripcion, usuario_id_usuario, interno, tipo_requerimiento_id_tipo_req, departamento_id_departamento, sucursal_id_sucursal, imagen_id_imagen, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (12, 'breve historia', 2, '12311', 38, 8, 8, NULL,  false, '2021-05-27 23:16:09.042041', 'postgres', '127.0.0.1/32');

INSERT INTO requerimiento (id_requerimiento, descripcion, usuario_id_usuario, interno, tipo_requerimiento_id_tipo_req, departamento_id_departamento, sucursal_id_sucursal, imagen_id_imagen, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (13, 'Otro cuento', 2, '12312', 38, 2, 8, NULL, false, '2021-05-27 23:16:28.304988', 'postgres', '127.0.0.1/32');

INSERT INTO requerimiento (id_requerimiento, descripcion, usuario_id_usuario, interno, tipo_requerimiento_id_tipo_req, departamento_id_departamento, sucursal_id_sucursal, imagen_id_imagen, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (14, 'sdfsdfsdfsdfsdf', 2, '12121', 27, 3, 10, NULL, false, '2021-05-27 23:17:27.588732', 'postgres', '127.0.0.1/32');

INSERT INTO requerimiento (id_requerimiento, descripcion, usuario_id_usuario, interno, tipo_requerimiento_id_tipo_req, departamento_id_departamento, sucursal_id_sucursal, imagen_id_imagen, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (15, 'wwwwwwwwww', 2, '2323', 44, 1, 3, NULL, false, '2021-05-27 23:17:28.600666', 'postgres', '127.0.0.1/32');

INSERT INTO requerimiento (id_requerimiento, descripcion, usuario_id_usuario, interno, tipo_requerimiento_id_tipo_req, departamento_id_departamento, sucursal_id_sucursal, imagen_id_imagen, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (16, 'no tengo quemador de CD', 2, '12134', 29, 2, 3, NULL, false, '2021-05-31 17:37:48.78638', 'postgres', '127.0.0.1/32');

INSERT INTO requerimiento (id_requerimiento, descripcion, usuario_id_usuario, interno, tipo_requerimiento_id_tipo_req, departamento_id_departamento, sucursal_id_sucursal, imagen_id_imagen, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (17, 'mi teclado ya no funciona', 3, '1234', 17, 2, 2, NULL, false, '2021-05-31 21:50:53.908177', 'postgres', '127.0.0.1/32');

INSERT INTO requerimiento (id_requerimiento, descripcion, usuario_id_usuario, interno, tipo_requerimiento_id_tipo_req, departamento_id_departamento, sucursal_id_sucursal, imagen_id_imagen, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (18, 'ddddddddddddd', 3, '1212', 15, 2, 7, NULL, false, '2021-05-31 22:43:44.238456', 'postgres', '127.0.0.1/32');

INSERT INTO requerimiento (id_requerimiento, descripcion, usuario_id_usuario, interno, tipo_requerimiento_id_tipo_req, departamento_id_departamento, sucursal_id_sucursal, imagen_id_imagen, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (19, 'qqqqw', 2, '1122', 27, 2, 6, NULL, false, '2021-06-06 09:17:46.024532', 'postgres', '127.0.0.1/32');

--
-- Data for table public.rol (OID = 27028) (LIMIT 0,3)
--
INSERT INTO rol (id_rol, rol, cod, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (1, 'Funcionario', 'func', false, '2021-05-26 21:29:44.698999', 'postgres', '::1/128');

INSERT INTO rol (id_rol, rol, cod, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (2, 'Agente Tecnico', 'agent', false, '2021-05-26 21:29:44.750313', 'postgres', '::1/128');

INSERT INTO rol (id_rol, rol, cod, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (3, 'Administrador', 'admin', false, '2021-05-26 21:29:44.802556', 'postgres', '::1/128');

--
-- Data for table public.sucursal (OID = 27040) (LIMIT 0,10)
--
INSERT INTO sucursal (id_sucursal, sucursal, cod, municipio_id_lugar, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (1, 'Villa Fátima', 'VF', 1, false, '2021-05-26 21:29:44.852327', 'postgres', '::1/128');

INSERT INTO sucursal (id_sucursal, sucursal, cod, municipio_id_lugar, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (2, 'San Jorge', 'SJE', 1, false, '2021-05-26 21:29:44.929177', 'postgres', '::1/128');

INSERT INTO sucursal (id_sucursal, sucursal, cod, municipio_id_lugar, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (3, 'Zona Sur', 'ZSUR', 1, false, '2021-05-26 21:29:45.001808', 'postgres', '::1/128');

INSERT INTO sucursal (id_sucursal, sucursal, cod, municipio_id_lugar, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (4, 'Batallon Colorados', 'BCDOS', 1, false, '2021-05-26 21:29:45.053807', 'postgres', '::1/128');

INSERT INTO sucursal (id_sucursal, sucursal, cod, municipio_id_lugar, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (5, 'Planta Pura Pura', 'PPURA', 1, false, '2021-05-26 21:29:45.107265', 'postgres', '::1/128');

INSERT INTO sucursal (id_sucursal, sucursal, cod, municipio_id_lugar, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (6, '16 de Julio', '16JU', 2, false, '2021-05-26 21:29:45.160162', 'postgres', '::1/128');

INSERT INTO sucursal (id_sucursal, sucursal, cod, municipio_id_lugar, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (7, 'Villa Bolívar', 'VB', 2, false, '2021-05-26 21:29:45.21209', 'postgres', '::1/128');

INSERT INTO sucursal (id_sucursal, sucursal, cod, municipio_id_lugar, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (8, 'Pacajes', 'PACJ', 2, false, '2021-05-26 21:29:45.265013', 'postgres', '::1/128');

INSERT INTO sucursal (id_sucursal, sucursal, cod, municipio_id_lugar, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (9, 'Senkata', 'SNKT', 2, false, '2021-05-26 21:29:45.318573', 'postgres', '::1/128');

INSERT INTO sucursal (id_sucursal, sucursal, cod, municipio_id_lugar, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (10, 'San Roque', 'SNR', 2, false, '2021-05-26 21:29:45.370883', 'postgres', '::1/128');

--
-- Data for table public.ticket (OID = 27052) (LIMIT 0,10)
--
INSERT INTO ticket (id_ticket, numero, estado_id_estado, requerimiento_id_requerimiento, comentarios, baja_logica, fecha_registro, usuario_registro, ip_registro, id_padre, activo)
VALUES (2, '1', 3, 12, '', true, '2021-05-30 04:41:20', 'postgres', '127.0.0.1/32', NULL, false);

INSERT INTO ticket (id_ticket, numero, estado_id_estado, requerimiento_id_requerimiento, comentarios, baja_logica, fecha_registro, usuario_registro, ip_registro, id_padre, activo)
VALUES (3, '2', 2, 13, '', true, '2021-05-30 05:52:04', 'postgres', '127.0.0.1/32', NULL, false);

INSERT INTO ticket (id_ticket, numero, estado_id_estado, requerimiento_id_requerimiento, comentarios, baja_logica, fecha_registro, usuario_registro, ip_registro, id_padre, activo)
VALUES (4, '3', 2, 14, '', true, '2021-05-30 00:42:51', 'postgres', '127.0.0.1/32', NULL, false);

INSERT INTO ticket (id_ticket, numero, estado_id_estado, requerimiento_id_requerimiento, comentarios, baja_logica, fecha_registro, usuario_registro, ip_registro, id_padre, activo)
VALUES (5, '4', 2, 15, '', true, '2021-05-30 11:51:55', 'postgres', '127.0.0.1/32', NULL, false);

INSERT INTO ticket (id_ticket, numero, estado_id_estado, requerimiento_id_requerimiento, comentarios, baja_logica, fecha_registro, usuario_registro, ip_registro, id_padre, activo)
VALUES (6, '5', 2, 16, '', true, '2021-05-31 22:01:17', 'postgres', '127.0.0.1/32', NULL, false);

INSERT INTO ticket (id_ticket, numero, estado_id_estado, requerimiento_id_requerimiento, comentarios, baja_logica, fecha_registro, usuario_registro, ip_registro, id_padre, activo)
VALUES (7, '6', 3, 17, '', true, '2021-05-31 21:58:13', 'postgres', '127.0.0.1/32', NULL, false);

INSERT INTO ticket (id_ticket, numero, estado_id_estado, requerimiento_id_requerimiento, comentarios, baja_logica, fecha_registro, usuario_registro, ip_registro, id_padre, activo)
VALUES (8, '7', 3, 18, '', true, '2021-05-31 22:44:21', 'postgres', '127.0.0.1/32', NULL, false);

INSERT INTO ticket (id_ticket, numero, estado_id_estado, requerimiento_id_requerimiento, comentarios, baja_logica, fecha_registro, usuario_registro, ip_registro, id_padre, activo)
VALUES (9, 'yMs01', 1, 19, '', false, '2021-06-06 09:17:46', 'postgres', '127.0.0.1/32', NULL, false);

INSERT INTO ticket (id_ticket, numero, estado_id_estado, requerimiento_id_requerimiento, comentarios, baja_logica, fecha_registro, usuario_registro, ip_registro, id_padre, activo)
VALUES (13, 'yMs01', 2, 19, '', false, '2021-06-07 00:12:45.956601', 'postgres', '127.0.0.1/32', 9, false);

INSERT INTO ticket (id_ticket, numero, estado_id_estado, requerimiento_id_requerimiento, comentarios, baja_logica, fecha_registro, usuario_registro, ip_registro, id_padre, activo)
VALUES (14, 'yMs01', 3, 19, '', false, '2021-06-07 00:30:53.206912', 'postgres', '127.0.0.1/32', 9, true);

--
-- Data for table public.tipo_requerimiento (OID = 27064) (LIMIT 0,50)
--
INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (1, 'El equipo no inicia', 'TA1', 1, 1, false, '2021-05-26 21:29:45.422809', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (2, 'Se reinicia', 'TA2', 1, 1, false, '2021-05-26 21:29:45.474912', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (3, 'Configuración', 'TA3', 1, 1, false, '2021-05-26 21:29:45.527101', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (4, 'Mensaje de error', 'TA4', 1, 1, false, '2021-05-26 21:29:45.580611', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (5, 'Virus', 'TA5', 1, 1, false, '2021-05-26 21:29:45.633771', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (6, 'Bloqueo/lentitud', 'TA6', 1, 1, false, '2021-05-26 21:29:45.686633', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (7, 'Archivos perdidos', 'TA7', 1, 1, false, '2021-05-26 21:29:45.739195', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (8, 'Conexión a la RED', 'TA8', 1, 1, false, '2021-05-26 21:29:45.790395', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (9, 'Impresora', 'TA9', 1, 1, false, '2021-05-26 21:29:45.841778', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (10, 'Correo', 'TA11', 1, 1, false, '2021-05-26 21:29:45.894713', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (11, 'Internet', 'TA12', 1, 1, false, '2021-05-26 21:29:45.946144', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (12, 'Interno', 'TA13', 1, 1, false, '2021-05-26 21:29:45.999303', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (13, 'Otro', 'TA14', 1, 1, false, '2021-05-26 21:29:46.053574', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (14, 'Computadora', 'TM1', 2, 1, false, '2021-05-26 21:29:46.107847', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (15, 'Impresora', 'TM2', 2, 1, false, '2021-05-26 21:29:46.162058', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (16, 'Scanner', 'TM3', 2, 1, false, '2021-05-26 21:29:46.214089', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (17, 'Teclado', 'TM4', 2, 1, false, '2021-05-26 21:29:46.290925', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (18, 'Mouse', 'TM5', 2, 1, false, '2021-05-26 21:29:46.344462', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (19, 'Monitor', 'TM6', 2, 1, false, '2021-05-26 21:29:46.398835', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (20, 'Unidad CD/DVD', 'TM7', 2, 1, false, '2021-05-26 21:29:46.466467', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (21, 'Puerto USB', 'TM8', 2, 1, false, '2021-05-26 21:29:46.524672', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (22, 'POS', 'TM9', 2, 5, false, '2021-05-26 21:29:46.589759', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (23, 'Sonido', 'TM10', 2, 1, false, '2021-05-26 21:29:46.6451', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (24, 'Otro', 'TM11', 2, 1, false, '2021-05-26 21:29:46.700622', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (25, 'Todo (Completo)', 'TI1', 3, 1, false, '2021-05-26 21:29:46.75433', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (26, 'Sistema Operativo', 'TI2', 3, 1, false, '2021-05-26 21:29:46.808722', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (27, 'Drivers', 'TI3', 3, 1, false, '2021-05-26 21:29:46.861578', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (28, 'Lector de PDF', 'TI4', 3, 1, false, '2021-05-26 21:29:46.914256', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (29, 'Quemador CD/DVD', 'TI5', 3, 1, false, '2021-05-26 21:29:46.966647', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (30, 'Office', 'TI6', 3, 1, false, '2021-05-26 21:29:47.019714', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (31, 'Genesys', 'TI7', 3, 4, false, '2021-05-26 21:29:47.076471', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (32, 'SAR', 'TI8', 3, 2, false, '2021-05-26 21:29:47.129588', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (33, 'SAP', 'TI9', 3, 3, false, '2021-05-26 21:29:47.181916', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (34, 'Cronos', 'TI10', 3, 5, false, '2021-05-26 21:29:47.234025', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (35, 'Otro', 'TI11', 3, 1, false, '2021-05-26 21:29:47.287491', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (36, 'Medio Físico (DVD/USB', 'TC1', 4, 1, false, '2021-05-26 21:29:47.340363', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (37, 'Correo', 'TC2', 4, 1, false, '2021-05-26 21:29:47.394213', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (38, 'Otro Computador', 'TC3', 4, 1, false, '2021-05-26 21:29:47.448881', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (39, 'Documentos', 'TC4', 4, 1, false, '2021-05-26 21:29:47.503004', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (40, 'Otro', 'TC5', 4, 1, false, '2021-05-26 21:29:47.558615', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (41, 'Soporte GENESYS', 'TS1', 5, 4, false, '2021-05-26 21:29:47.641441', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (42, 'Reportes/Listados GENESYS', 'TS2', 5, 4, false, '2021-05-26 21:29:47.69587', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (43, 'Soporte SAP', 'TS2', 5, 3, false, '2021-05-26 21:29:47.749833', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (44, 'Reportes/Listados SAP', 'TS2', 5, 3, false, '2021-05-26 21:29:47.803477', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (45, 'Soporte SAR', 'TS2', 5, 2, false, '2021-05-26 21:29:47.856764', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (46, 'Reportes/Listados SAR', 'TS2', 5, 2, false, '2021-05-26 21:29:47.909624', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (47, 'Soporte Otros', 'TS2', 5, 2, false, '2021-05-26 21:29:47.962627', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (48, 'Reportes/Listados Otros', 'TS2', 5, 2, false, '2021-05-26 21:29:48.015638', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (49, 'Biométrico', 'TS2', 5, 2, false, '2021-05-26 21:29:48.06982', 'postgres', '::1/128');

INSERT INTO tipo_requerimiento (id_tipo_req, sub_cat, cod, categoria_id_categoria, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (50, 'SiDot', 'TS2', 5, 4, false, '2021-05-26 21:29:48.123783', 'postgres', '::1/128');

--
-- Data for table public.usuario (OID = 27076) (LIMIT 0,8)
--
INSERT INTO usuario (id_usuario, nombre, ap_paterno, ap_materno, password, email, rol_id_rol, cargo_id_cargo, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (2, 'MARCELO', 'FLORES', 'GUTIERREZ', '$2y$10$TG56WdjE60sMuXbHmDLWGO772XbF/2xvaZm0fl67kENRQaUWNVPFi', 'sergioflogu1@gmail.com', 1, 3, 1, false, '2021-05-26 21:29:48.250615', 'postgres', '::1/128');

INSERT INTO usuario (id_usuario, nombre, ap_paterno, ap_materno, password, email, rol_id_rol, cargo_id_cargo, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (4, 'SERGIO', 'FLORES', 'GUTIERREZ', '$2y$10$TG56WdjE60sMuXbHmDLWGO772XbF/2xvaZm0fl67kENRQaUWNVPFi', 'sergioflogu4@gmail.com', 2, 2, 6, false, '2021-05-26 21:29:48.303264', 'postgres', '::1/128');

INSERT INTO usuario (id_usuario, nombre, ap_paterno, ap_materno, password, email, rol_id_rol, cargo_id_cargo, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (3, 'ADE', 'ADAD', 'DAD', '$2y$10$9CZRrF/95NlBqUkr1xG1t.9hClTMNSsq.YUaaaD0PIiJp9rouDNn2', 'adela|@gmail.com', 1, 2, 2, false, '2021-05-30 06:33:13.405844', 'postgres', '127.0.0.1/32');

INSERT INTO usuario (id_usuario, nombre, ap_paterno, ap_materno, password, email, rol_id_rol, cargo_id_cargo, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (7, 'ASDA', 'SADAS', 'SALVATIERRA', '$2y$10$DbTPk..cjFSgnE2lXFYH0Ousnz26Ftudp6ekZnV0HlZahKYEPCnWy', 'asdasd2222@gmail.com', 1, 2, 3, false, '2021-05-30 06:34:36.350943', 'postgres', '127.0.0.1/32');

INSERT INTO usuario (id_usuario, nombre, ap_paterno, ap_materno, password, email, rol_id_rol, cargo_id_cargo, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (5, 'FABIOLA', 'FLORES', 'GUTIERREZ', '$2y$10$ZexlNxSKos4soEDnO0Rf4.vWxYBbIYntmkv957Zz8oy4LtqqyTkXm', 'fabiola@gmail.com', 1, 4, 5, false, '2021-05-26 21:29:48.357701', 'postgres', '::1/128');

INSERT INTO usuario (id_usuario, nombre, ap_paterno, ap_materno, password, email, rol_id_rol, cargo_id_cargo, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (6, 'pruebita', 'prueba', 'No tiene', '$2y$10$TG56WdjE60sMuXbHmDLWGO772XbF/2xvaZm0fl67kENRQaUWNVPFi', 'prueba@epsas.com', 3, 6, 5, false, '2021-05-26 21:29:48.412973', 'postgres', '::1/128');

INSERT INTO usuario (id_usuario, nombre, ap_paterno, ap_materno, password, email, rol_id_rol, cargo_id_cargo, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (1, 'SERGIO ADRIAN', 'FLORES', 'GUTIERREZ', '$2y$10$TG56WdjE60sMuXbHmDLWGO772XbF/2xvaZm0fl67kENRQaUWNVPFi', 'sergioflogu3@gmail.com', 3, 3, 2, true, '2021-05-26 21:29:48.176607', 'postgres', '::1/128');

INSERT INTO usuario (id_usuario, nombre, ap_paterno, ap_materno, password, email, rol_id_rol, cargo_id_cargo, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (9, 'MARCELO', 'FLORES', 'GUTIERREZZZ', '$2y$10$//Aw2S4bUtWSN2nGpvoB2OPIbSi0TtYCTk2TwCmkJZfCGTE0kWGWS', 'sergioflogu19@gmail.com', 2, 4, 1, true, '2021-05-30 10:53:45.06045', 'postgres', '127.0.0.1/32');

INSERT INTO usuario (id_usuario, nombre, ap_paterno, ap_materno, password, email, rol_id_rol, cargo_id_cargo, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (10, 'Camila', 'Agente', NULL, '$2y$10$TG56WdjE60sMuXbHmDLWGO772XbF/2xvaZm0fl67kENRQaUWNVPFi', 'lemuzmujiquita@gmail.com', 3, 1, 1, false, '2021-05-26 21:29:48.412973', 'postgres', '::1/128');

INSERT INTO usuario (id_usuario, nombre, ap_paterno, ap_materno, password, email, rol_id_rol, cargo_id_cargo, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (11, 'Cami', 'Lemuz', 'Agente', '$2y$10$TG56WdjE60sMuXbHmDLWGO772XbF/2xvaZm0fl67kENRQaUWNVPFi', 'camila.lemuz.mujica@gmail.com', 2, 2, 1, false, '2021-05-26 21:29:48.176607', 'postgres', '::1/128');

INSERT INTO usuario (id_usuario, nombre, ap_paterno, ap_materno, password, email, rol_id_rol, cargo_id_cargo, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (12, 'Camila Carmen', 'Funcionario', NULL, '$2y$10$TG56WdjE60sMuXbHmDLWGO772XbF/2xvaZm0fl67kENRQaUWNVPFi', 'camila.lemuz@ucb.edu.bo', 1, 3, 6, false, '2021-05-30 10:53:45.06045', 'postgres', '127.0.0.1/32');

INSERT INTO usuario (id_usuario, nombre, ap_paterno, ap_materno, password, email, rol_id_rol, cargo_id_cargo, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro, ci)
VALUES (13, 'Usuario2', 'Usuario2', NULL, NULL, 'Usuario2@gmail.com', 1, 3, 6, false, '2021-05-26 21:29:48.412973', 'postgres', '::1/128', 123);

INSERT INTO usuario (id_usuario, nombre, ap_paterno, ap_materno, password, email, rol_id_rol, cargo_id_cargo, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro, ci)
VALUES (14, 'Usuario3', 'Usuario3', 'Usuario3', NULL, 'Usuario3@gmail.com',  1, 3, 6, false, '2021-05-26 21:29:48.176607', 'postgres', '::1/128',123);

INSERT INTO usuario (id_usuario, nombre, ap_paterno, ap_materno, password, email, rol_id_rol, cargo_id_cargo, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro, ci)
VALUES (15, 'Usuario4', 'Usuario4', NULL, NULL, 'Usuario4@gmail.com', 1, 3, 6, false, '2021-05-30 10:53:45.06045', 'postgres', '127.0.0.1/32',123);

SET search_path = bitacora, pg_catalog;
--
-- Data for table bitacora.bit_usuario (OID = 27195) (LIMIT 0,7)
--
INSERT INTO bit_usuario (id, id_usuario, nombre, ap_paterno, ap_materno, password, email, rol_id_rol, cargo_id_cargo, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (3, 9, 'MARCELO', 'FLORES', 'GUTIERREZ', '$2y$10$//Aw2S4bUtWSN2nGpvoB2OPIbSi0TtYCTk2TwCmkJZfCGTE0kWGWS', 'sergioflogu19@gmail.com', 1, 5, 6, false, '2021-06-04 22:57:42.789375', 'postgres', '::1/128');

INSERT INTO bit_usuario (id, id_usuario, nombre, ap_paterno, ap_materno, password, email, rol_id_rol, cargo_id_cargo, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (4, 7, 'ASDA', 'SADAS', 'DASDAD', '$2y$10$DbTPk..cjFSgnE2lXFYH0Ousnz26Ftudp6ekZnV0HlZahKYEPCnWy', 'asdasd2222@gmail.com', 1, 2, 3, false, '2021-05-30 06:34:36.350943', 'postgres', '127.0.0.1/32');

INSERT INTO bit_usuario (id, id_usuario, nombre, ap_paterno, ap_materno, password, email, rol_id_rol, cargo_id_cargo, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (5, 5, 'FABIOLA', 'FLORES', 'GUTIERREZ', '$2y$10$ZexlNxSKos4soEDnO0Rf4.vWxYBbIYntmkv957Zz8oy4LtqqyTkXm', 'fabiola@gmail.com', 2, 3, 2, false, '2021-05-26 21:29:48.357701', 'postgres', '::1/128');

INSERT INTO bit_usuario (id, id_usuario, nombre, ap_paterno, ap_materno, password, email, rol_id_rol, cargo_id_cargo, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (6, 9, 'MARCELO', 'FLORES', 'GUTIERREZZZ', '$2y$10$//Aw2S4bUtWSN2nGpvoB2OPIbSi0TtYCTk2TwCmkJZfCGTE0kWGWS', 'sergioflogu19@gmail.com', 1, 5, 6, false, '2021-05-30 10:53:45.06045', 'postgres', '127.0.0.1/32');

INSERT INTO bit_usuario (id, id_usuario, nombre, ap_paterno, ap_materno, password, email, rol_id_rol, cargo_id_cargo, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (7, 6, 'prueban', 'pruebap', 'pruebam', '$2y$10$TG56WdjE60sMuXbHmDLWGO772XbF/2xvaZm0fl67kENRQaUWNVPFi', 'prueba@epsas.com', 3, 2, 3, false, '2021-05-26 21:29:48.412973', 'postgres', '::1/128');

INSERT INTO bit_usuario (id, id_usuario, nombre, ap_paterno, ap_materno, password, email, rol_id_rol, cargo_id_cargo, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (8, 1, 'SERGIO ADRIAN', 'FLORES', 'GUTIERREZ', '$2y$10$TG56WdjE60sMuXbHmDLWGO772XbF/2xvaZm0fl67kENRQaUWNVPFi', 'sergioflogu3@gmail.com', 3, 3, 2, false, '2021-05-26 21:29:48.176607', 'postgres', '::1/128');

INSERT INTO bit_usuario (id, id_usuario, nombre, ap_paterno, ap_materno, password, email, rol_id_rol, cargo_id_cargo, division_id_division, baja_logica, fecha_registro, usuario_registro, ip_registro)
VALUES (9, 9, 'MARCELO', 'FLORES', 'GUTIERREZZZ', '$2y$10$//Aw2S4bUtWSN2nGpvoB2OPIbSi0TtYCTk2TwCmkJZfCGTE0kWGWS', 'sergioflogu19@gmail.com', 2, 4, 1, false, '2021-05-30 10:53:45.06045', 'postgres', '127.0.0.1/32');

--
-- Definition for index asignado_pk (OID = 26901) : 
--
SET search_path = public, pg_catalog;
ALTER TABLE ONLY asignado
    ADD CONSTRAINT asignado_pk
    PRIMARY KEY (id_asignado);
--
-- Definition for index calificacion_pk (OID = 26913) : 
--
ALTER TABLE ONLY calificacion
    ADD CONSTRAINT calificacion_pk
    PRIMARY KEY (id_calificacion);
--
-- Definition for index calificacion_ticket_usuario_pk (OID = 26925) : 
--
ALTER TABLE ONLY calificacion_ticket_usuario
    ADD CONSTRAINT calificacion_ticket_usuario_pk
    PRIMARY KEY (id_calificacion_ticket);
--
-- Definition for index cargo_pk (OID = 26937) : 
--
ALTER TABLE ONLY cargo
    ADD CONSTRAINT cargo_pk
    PRIMARY KEY (id_cargo);
--
-- Definition for index categoria_pk (OID = 26949) : 
--
ALTER TABLE ONLY categoria
    ADD CONSTRAINT categoria_pk
    PRIMARY KEY (id_categoria);
--
-- Definition for index departamento_pk (OID = 26961) : 
--
ALTER TABLE ONLY departamento
    ADD CONSTRAINT departamento_pk
    PRIMARY KEY (id_departamento);
--
-- Definition for index division_pk (OID = 26973) : 
--
ALTER TABLE ONLY division
    ADD CONSTRAINT division_pk
    PRIMARY KEY (id_division);
--
-- Definition for index estado_pk (OID = 26985) : 
--
ALTER TABLE ONLY estado
    ADD CONSTRAINT estado_pk
    PRIMARY KEY (id_estado);
--
-- Definition for index municipio_pk (OID = 26997) : 
--
ALTER TABLE ONLY municipio
    ADD CONSTRAINT municipio_pk
    PRIMARY KEY (id_lugar);
--
-- Definition for index prioridad_pk (OID = 27009) : 
--
ALTER TABLE ONLY prioridad
    ADD CONSTRAINT prioridad_pk
    PRIMARY KEY (id_prioridad);
--
-- Definition for index requerimiento_pk (OID = 27024) : 
--
ALTER TABLE ONLY requerimiento
    ADD CONSTRAINT requerimiento_pk
    PRIMARY KEY (id_requerimiento);
--
-- Definition for index rol_pk (OID = 27036) : 
--
ALTER TABLE ONLY rol
    ADD CONSTRAINT rol_pk
    PRIMARY KEY (id_rol);
--
-- Definition for index sucursal_pk (OID = 27048) : 
--
ALTER TABLE ONLY sucursal
    ADD CONSTRAINT sucursal_pk
    PRIMARY KEY (id_sucursal);
--
-- Definition for index ticket_pk (OID = 27060) : 
--
ALTER TABLE ONLY ticket
    ADD CONSTRAINT ticket_pk
    PRIMARY KEY (id_ticket);
--
-- Definition for index tipo_requerimiento_pk (OID = 27072) : 
--
ALTER TABLE ONLY tipo_requerimiento
    ADD CONSTRAINT tipo_requerimiento_pk
    PRIMARY KEY (id_tipo_req);
--
-- Definition for index usuario_pk (OID = 27087) : 
--
ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pk
    PRIMARY KEY (id_usuario);
--
-- Definition for index asignado_ticket (OID = 27089) : 
--
ALTER TABLE ONLY asignado
    ADD CONSTRAINT asignado_ticket
    FOREIGN KEY (ticket_id_ticket) REFERENCES ticket(id_ticket);
--
-- Definition for index asignado_usuario (OID = 27094) : 
--
ALTER TABLE ONLY asignado
    ADD CONSTRAINT asignado_usuario
    FOREIGN KEY (usuario_id_usuario) REFERENCES usuario(id_usuario);
--
-- Definition for index calificacion_ticket_calificacion (OID = 27099) : 
--
ALTER TABLE ONLY calificacion_ticket_usuario
    ADD CONSTRAINT calificacion_ticket_calificacion
    FOREIGN KEY (calificacion_id_calificacion) REFERENCES calificacion(id_calificacion);
--
-- Definition for index calificacion_ticket_ticket (OID = 27104) : 
--
ALTER TABLE ONLY calificacion_ticket_usuario
    ADD CONSTRAINT calificacion_ticket_ticket
    FOREIGN KEY (ticket_id_ticket) REFERENCES ticket(id_ticket);
--
-- Definition for index calificacion_ticket_usuario (OID = 27109) : 
--
ALTER TABLE ONLY calificacion_ticket_usuario
    ADD CONSTRAINT calificacion_ticket_usuario
    FOREIGN KEY (usuario_id_usuario) REFERENCES usuario(id_usuario);
--
-- Definition for index cargo_prioridad (OID = 27114) : 
--
ALTER TABLE ONLY cargo
    ADD CONSTRAINT cargo_prioridad
    FOREIGN KEY (prioridad_id_prioridad) REFERENCES prioridad(id_prioridad);
--
-- Definition for index requerimiento_departamento (OID = 27119) : 
--
ALTER TABLE ONLY requerimiento
    ADD CONSTRAINT requerimiento_departamento
    FOREIGN KEY (departamento_id_departamento) REFERENCES departamento(id_departamento);
--
-- Definition for index requerimiento_sucursal (OID = 27124) : 
--
ALTER TABLE ONLY requerimiento
    ADD CONSTRAINT requerimiento_sucursal
    FOREIGN KEY (sucursal_id_sucursal) REFERENCES sucursal(id_sucursal);
--
-- Definition for index requerimiento_tipo_requerimiento (OID = 27129) : 
--
ALTER TABLE ONLY requerimiento
    ADD CONSTRAINT requerimiento_tipo_requerimiento
    FOREIGN KEY (tipo_requerimiento_id_tipo_req) REFERENCES tipo_requerimiento(id_tipo_req);
--
-- Definition for index requerimiento_usuario (OID = 27134) : 
--
ALTER TABLE ONLY requerimiento
    ADD CONSTRAINT requerimiento_usuario
    FOREIGN KEY (usuario_id_usuario) REFERENCES usuario(id_usuario);

--
-- Definition for index requerimiento_imagen (OID = 27135) : 
--
ALTER TABLE ONLY requerimiento
    ADD CONSTRAINT requerimiento_imagen
    FOREIGN KEY (imagen_id_imagen) REFERENCES imagen(id_imagen);

--
-- Definition for index sucursal_municipio (OID = 27139) : 
--
ALTER TABLE ONLY sucursal
    ADD CONSTRAINT sucursal_municipio
    FOREIGN KEY (municipio_id_lugar) REFERENCES municipio(id_lugar);
--
-- Definition for index ticket_estado (OID = 27144) : 
--
ALTER TABLE ONLY ticket
    ADD CONSTRAINT ticket_estado
    FOREIGN KEY (estado_id_estado) REFERENCES estado(id_estado);
--
-- Definition for index ticket_requerimiento (OID = 27149) : 
--
ALTER TABLE ONLY ticket
    ADD CONSTRAINT ticket_requerimiento
    FOREIGN KEY (requerimiento_id_requerimiento) REFERENCES requerimiento(id_requerimiento);
--
-- Definition for index tipo_requerimiento_categoria (OID = 27154) : 
--
ALTER TABLE ONLY tipo_requerimiento
    ADD CONSTRAINT tipo_requerimiento_categoria
    FOREIGN KEY (categoria_id_categoria) REFERENCES categoria(id_categoria);
--
-- Definition for index tipo_requerimiento_division (OID = 27159) : 
--
ALTER TABLE ONLY tipo_requerimiento
    ADD CONSTRAINT tipo_requerimiento_division
    FOREIGN KEY (division_id_division) REFERENCES division(id_division);
--
-- Definition for index usuario_cargo (OID = 27164) : 
--
ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_cargo
    FOREIGN KEY (cargo_id_cargo) REFERENCES cargo(id_cargo);
--
-- Definition for index usuario_division (OID = 27169) : 
--
ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_division
    FOREIGN KEY (division_id_division) REFERENCES division(id_division);
--
-- Definition for index usuario_rol (OID = 27174) : 
--
ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_rol
    FOREIGN KEY (rol_id_rol) REFERENCES rol(id_rol);
--
-- Definition for index usuario_email_key (OID = 27190) : 
--
ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_email_key
    UNIQUE (email);
--
-- Definition for trigger usuario_trIgger (OID = 27210) : 
--
CREATE TRIGGER "usuario_trIgger"
    BEFORE UPDATE ON usuario
    FOR EACH ROW
    EXECUTE PROCEDURE usuario_modificado ();
--
-- Data for sequence public.asignado_id_asignado_seq (OID = 26891)
--
SELECT pg_catalog.setval('asignado_id_asignado_seq', 11, true);
--
-- Data for sequence public.calificacion_id_calificacion_seq (OID = 26903)
--
SELECT pg_catalog.setval('calificacion_id_calificacion_seq', 1, false);
--
-- Data for sequence public.calificacion_ticket_usuario_id_calificacion_ticket_seq (OID = 26915)
--
SELECT pg_catalog.setval('calificacion_ticket_usuario_id_calificacion_ticket_seq', 3, true);
--
-- Data for sequence public.cargo_id_cargo_seq (OID = 26927)
--
SELECT pg_catalog.setval('cargo_id_cargo_seq', 1, false);
--
-- Data for sequence public.categoria_id_categoria_seq (OID = 26939)
--
SELECT pg_catalog.setval('categoria_id_categoria_seq', 1, false);
--
-- Data for sequence public.departamento_id_departamento_seq (OID = 26951)
--
SELECT pg_catalog.setval('departamento_id_departamento_seq', 1, false);
--
-- Data for sequence public.division_id_division_seq (OID = 26963)
--
SELECT pg_catalog.setval('division_id_division_seq', 1, false);
--
-- Data for sequence public.estado_id_estado_seq (OID = 26975)
--
SELECT pg_catalog.setval('estado_id_estado_seq', 1, false);
--
-- Data for sequence public.municipio_id_lugar_seq (OID = 26987)
--
SELECT pg_catalog.setval('municipio_id_lugar_seq', 1, false);
--
-- Data for sequence public.prioridad_id_prioridad_seq (OID = 26999)
--
SELECT pg_catalog.setval('prioridad_id_prioridad_seq', 1, false);
--
-- Data for sequence public.requerimiento_id_requerimiento_seq (OID = 27011)
--
SELECT pg_catalog.setval('requerimiento_id_requerimiento_seq', 19, true);
--
-- Data for sequence public.rol_id_rol_seq (OID = 27026)
--
SELECT pg_catalog.setval('rol_id_rol_seq', 1, false);
--
-- Data for sequence public.sucursal_id_sucursal_seq (OID = 27038)
--
SELECT pg_catalog.setval('sucursal_id_sucursal_seq', 1, false);
--
-- Data for sequence public.ticket_id_ticket_seq (OID = 27050)
--
SELECT pg_catalog.setval('ticket_id_ticket_seq', 14, true);
--
-- Data for sequence public.tipo_requerimiento_id_tipo_req_seq (OID = 27062)
--
SELECT pg_catalog.setval('tipo_requerimiento_id_tipo_req_seq', 1, false);
--
-- Data for sequence public.usuario_id_usuario_seq (OID = 27074)
--
SELECT pg_catalog.setval('usuario_id_usuario_seq', 9, true);
--
-- Data for sequence bitacora.bit_usuario_id_seq (OID = 27193)
--
SET search_path = bitacora, pg_catalog;
SELECT pg_catalog.setval('bit_usuario_id_seq', 9, true);
--
-- Comments
--
COMMENT ON SCHEMA public IS 'standard public schema';
