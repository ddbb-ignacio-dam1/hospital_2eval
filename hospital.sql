CREATE DATABASE hospital;
use hospital;

CREATE TABLE Personal (
  NSS VARCHAR(30) NOT NULL PRIMARY KEY,
  Nombre VARCHAR(20) NOT NULL,
  Domicilio VARCHAR(20) NOT NULL
);

CREATE TABLE Administrativo (
  NSS VARCHAR(30) NOT NULL PRIMARY KEY,
  Cargo VARCHAR(20) NOT NULL,
  email VARCHAR(30) NOT NULL
);

CREATE TABLE Medico (
  NSS VARCHAR(30) NOT NULL PRIMARY KEY ,
  Especialidad VARCHAR(30) NOT NULL ,
  Numero_Colegiado VARCHAR(30) NOT NULL
);

CREATE TABLE Enfermero (
  NSS VARCHAR(30) NOT NULL PRIMARY KEY ,
  Experiencia TINYINT(3) NOT NULL ,
  Tipo ENUM("fijo","interno") NOT NULL
);

CREATE TABLE Historial(
  Cod_historial VARCHAR(30) NOT NULL PRIMARY KEY,
  Patologia VARCHAR(100) NOT NULL
);

CREATE TABLE Persona (
  Doc_Identificativo VARCHAR(30) NOT NULL PRIMARY KEY ,
  NSS VARCHAR(30) NOT NULL ,
  Nombre VARCHAR(20) NOT NULL,
  Domicilio VARCHAR(20) NOT NULL,
  Telefono VARCHAR(20) NOT NULL
);

CREATE TABLE Paciente(
  Tarjeta_Sanitaria VARCHAR(30) NOT NULL PRIMARY KEY,
  Sangre ENUM ("0+","0-","A+","A-","B+","B-","AB+","AB-") NOT NULL,
  Alergias VARCHAR(100),
  Doc_Identificativo VARCHAR(30) NOT NULL ,
  Cod_historial VARCHAR(30) NOT NULL
);

CREATE TABLE Consultas_Externas (
  NSS VARCHAR(30) NOT NULL ,
  Tarjeta_Sanitaria VARCHAR(30) NOT NULL ,
  Fecha DATE NOT NULL,
  Diagnostico VARCHAR(150),
  PRIMARY KEY ( NSS , Tarjeta_Sanitaria ,Fecha )
);

CREATE TABLE Consultas_Internas (
  NSS VARCHAR(30) NOT NULL ,
  Tarjeta_Sanitaria VARCHAR(30) NOT NULL ,
  Fecha DATE NOT NULL,
  Diagnostico VARCHAR(150),
  PRIMARY KEY ( NSS , Tarjeta_Sanitaria ,Fecha )
);

CREATE  TABLE Tratamientos (
  NSS_Medico VARCHAR(30) NOT NULL ,
  Tarjeta_Sanitaria VARCHAR(30) NOT NULL ,
  ID_Dosis INT(8) NOT NULL ,
  ID_Tratamiento INT(8) AUTO_INCREMENT NOT NULL,
  Descripcion VARCHAR(200),
  PRIMARY KEY(ID_Tratamiento)
);

CREATE TABLE Dosis (
  ID_Dosis INT(8) AUTO_INCREMENT NOT NULL ,
  Cantidad VARCHAR(20) NOT NULL,
  PRIMARY KEY ( ID_Dosis)
);

CREATE TABLE Habitacion (
  n_habitacion VARCHAR(20) NOT NULL ,
  Posicion ENUM("exterior","interior") NOT NULL,
  AA ENUM("yes","no") NOT NULL ,
  TV ENUM("yes","no") NOT NULL ,
  Toma_Oxigeno ENUM("yes","no") NOT NULL ,
  PRIMARY KEY (n_habitacion)
);

CREATE TABLE Cama (
  n_habitacion VARCHAR(20) NOT NULL ,
  n_cama VARCHAR(20) NOT NULL ,
  tipo ENUM("manuales","electricas","no articuladas"),
  PRIMARY KEY(n_habitacion, n_cama)
);

CREATE TABLE Ingreso (
  Tarjeta_Sanitaria VARCHAR(30) NOT NULL ,
  F_ingreso DATE NOT NULL,
  F_Alta DATE,
  n_habitacion VARCHAR(20) NOT NULL ,
  n_cama VARCHAR(20) NOT NULL ,
  PRIMARY KEY ( Tarjeta_Sanitaria, F_ingreso, n_habitacion ,n_cama)
);

CREATE TABLE Aplicacion_Dosis (
  NSS_Enfermero VARCHAR(30) NOT NULL ,
  ID_Dosis INT(8) NOT NULL ,
  Tarjeta_Sanitaria VARCHAR(30) NOT NULL ,
  Fecha DATE NOT NULL,
  PRIMARY KEY ( NSS_Enfermero, ID_Dosis , Tarjeta_Sanitaria, Fecha)
);


ALTER TABLE Administrativo ADD CONSTRAINT fk_nss_administrativo FOREIGN KEY (NSS) REFERENCES Personal (NSS);
ALTER TABLE Medico ADD CONSTRAINT fk_nss_medico FOREIGN KEY (NSS) REFERENCES Personal (NSS);
ALTER TABLE Enfermero ADD CONSTRAINT fk_nss_enfermero FOREIGN KEY (NSS) REFERENCES Personal (NSS);

ALTER TABLE Paciente ADD CONSTRAINT fk_Doc_Paciente FOREIGN KEY (Doc_Identificativo) REFERENCES Persona (Doc_Identificativo);
ALTER TABLE Paciente ADD CONSTRAINT fk_cod_history_Paciente FOREIGN KEY (Cod_historial) REFERENCES Historial (Cod_historial);

ALTER TABLE Consultas_Externas ADD CONSTRAINT fk_nss_externas FOREIGN KEY (NSS) REFERENCES Personal(NSS);
ALTER TABLE Consultas_Externas ADD CONSTRAINT fk_tarjeta_externas FOREIGN KEY (Tarjeta_Sanitaria) REFERENCES Paciente(Tarjeta_Sanitaria);

ALTER TABLE Consultas_Internas ADD CONSTRAINT fk_nss_internas FOREIGN KEY (NSS) REFERENCES Personal(NSS);
ALTER TABLE Consultas_Internas ADD CONSTRAINT fk_tarjeta_internas FOREIGN KEY (Tarjeta_Sanitaria) REFERENCES Paciente(Tarjeta_Sanitaria);

ALTER TABLE Tratamientos ADD CONSTRAINT fk_nss_tratamiento FOREIGN KEY (NSS_Medico) REFERENCES Personal(NSS);
alter table Tratamientos add CONSTRAINT fk_tarjeta_tratamientos FOREIGN KEY (Tarjeta_Sanitaria) REFERENCES Paciente(Tarjeta_Sanitaria);
alter table Tratamientos add CONSTRAINT fk_id_dosis_tratamientos FOREIGN KEY ( ID_Dosis) REFERENCES Dosis(ID_Dosis);

ALTER TABLE Cama ADD CONSTRAINT fk_habita_cama FOREIGN KEY (n_habitacion) REFERENCES Habitacion(n_habitacion);
ALTER table Ingreso add CONSTRAINT fk_tarjeta_ingereso FOREIGN KEY (Tarjeta_Sanitaria) REFERENCES Paciente(Tarjeta_Sanitaria);
ALTER TABLE Aplicacion_Dosis add CONSTRAINT fk_nss_dosis FOREIGN KEY (NSS_Enfermero) REFERENCES Personal(NSS);
ALTER TABLE Aplicacion_Dosis add CONSTRAINT fk_dosis_aplica FOREIGN KEY (ID_Dosis) REFERENCES Dosis (ID_Dosis);
alter table Aplicacion_Dosis add CONSTRAINT fk_tarjeta_aplica FOREIGN KEY (Tarjeta_Sanitaria) REFERENCES Paciente(Tarjeta_Sanitaria);
