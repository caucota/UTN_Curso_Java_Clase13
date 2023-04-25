CREATE DATABASE CAUCOTA;
USE CAUCOTA;

CREATE TABLE pais(
id INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(45),
nacionalidad VARCHAR(45),
primary key (id)
);

CREATE TABLE departamento(
id INT NOT NULL auto_increment,
nombre varchar(45),
primary key (id)
);

CREATE TABLE departamento_presupuesto(
id int not null auto_increment,
departamento_id INT NOT NULL,
anio smallint,
presupuesto double,
primary key (id),
foreign key (departamento_id) references departamento(id)
);

CREATE TABLE empleado(
	id INT NOT NULL AUTO_INCREMENT,
    dni bigint,
    nombre VARCHAR(45) NOT NULL,
    apellido VARCHAR(45),
    PRIMARY KEY (id)
);
    
CREATE TABLE empleado_nacionalidad(
	empleado_id int not null,
	pais_id int not null,
	PRIMARY KEY (empleado_id, pais_id),
	FOREIGN KEY (empleado_id) REFERENCES empleado(id),
	FOREIGN KEY (pais_id) REFERENCES pais(id)
);

CREATE TABLE departamento_empleado(
	departamento_id int not null,
	empleado_id int not null,
	PRIMARY KEY (departamento_id, empleado_id),
	FOREIGN KEY (departamento_id) REFERENCES departamento(id),
	FOREIGN KEY (empleado_id) REFERENCES empleado(id)
);

INSERT INTO pais (nombre, nacionalidad) VALUES ('Argentina', 'Argentina');
INSERT INTO pais (nombre, nacionalidad) VALUES ('Italia', 'Italiana');
INSERT INTO pais (nombre, nacionalidad) VALUES ('Uruguay', 'Uruguaya');

INSERT INTO departamento(nombre) VALUES ('Informática');
INSERT INTO departamento(nombre) VALUES ('Compras');
INSERT INTO departamento(nombre) VALUES ('Recursos Humanos');
INSERT INTO departamento(nombre) VALUES ('Mantenimiento');
INSERT INTO departamento(nombre) VALUES ('Logistica');

INSERT INTO departamento_presupuesto(departamento_id, anio,presupuesto) VALUES(1, 2023, 4300500);
INSERT INTO departamento_presupuesto(departamento_id, anio,presupuesto) VALUES(2, 2023, 1300000);
INSERT INTO departamento_presupuesto(departamento_id, anio,presupuesto) VALUES(3, 2023, 900000);
INSERT INTO departamento_presupuesto(departamento_id, anio,presupuesto) VALUES(4, 2023, 1100000);
INSERT INTO departamento_presupuesto(departamento_id, anio,presupuesto) VALUES(5, 2023, 2308000);

INSERT INTO empleado(dni, nombre, apellido) VALUES(44585264, 'Ramiro Javier', 'Peralta');
INSERT INTO empleado(dni, nombre, apellido) VALUES(16585364, 'Alberto', 'Fernandez');
INSERT INTO empleado(dni, nombre, apellido) VALUES(34781269, 'Jazim Anabel', 'Gomez');
INSERT INTO empleado(dni, nombre, apellido) VALUES(35491277, 'Maria', 'Lopez');

INSERT INTO empleado_nacionalidad(empleado_id, pais_id) VALUES(1,1);
INSERT INTO empleado_nacionalidad(empleado_id, pais_id) VALUES(2,1);
INSERT INTO empleado_nacionalidad(empleado_id, pais_id) VALUES(3,2);
INSERT INTO empleado_nacionalidad(empleado_id, pais_id) VALUES(4,3);

INSERT INTO departamento_empleado(departamento_id, empleado_id) VALUES(1,1);
INSERT INTO departamento_empleado(departamento_id, empleado_id) VALUES(1,2);
INSERT INTO departamento_empleado(departamento_id, empleado_id) VALUES(2,3);
INSERT INTO departamento_empleado(departamento_id, empleado_id) VALUES(4,4);
