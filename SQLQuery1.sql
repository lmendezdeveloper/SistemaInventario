DROP DATABASE inventario;
CREATE DATABASE inventario;
use inventario;

CREATE TABLE Cargo(
	idCargo int IDENTITY(1,1) PRIMARY KEY NOT NULL,  
    descripcion varchar(45) NOT NULL,
);

CREATE TABLE Usuario(
	idUsuario int IDENTITY(1,1) PRIMARY KEY NOT NULL,  
    rut varchar(45) NOT NULL,
    clave varchar(45) NOT NULL,
    nombre varchar(45) NOT NULL,
    apellidoP varchar(45) NOT NULL,
    apellidoM varchar(45) NOT NULL,
    fechaDeIngreso date,
    idCargo int FOREIGN KEY REFERENCES Cargo(idCargo)
);

CREATE TABLE Contrato(
	idContrato int IDENTITY(1,1) PRIMARY KEY NOT NULL,  
    descripcion varchar(45) NOT NULL,
);

CREATE TABLE Trabajador(
	idTrabajador int IDENTITY(1,1) PRIMARY KEY NOT NULL,  
    rut varchar(45) NOT NULL,
    clave varchar(45) NOT NULL,
    nombre varchar(45) NOT NULL,
    apellidoP varchar(45) NOT NULL,
    apellidoM varchar(45) NOT NULL,
    fechaInicio date,
    idContrato int FOREIGN KEY REFERENCES Contrato(idContrato)
);

CREATE TABLE Producto(
	idProducto int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	CodigoGenerico varchar(45) NOT NULL,
	nombre varchar(45) NOT NULL,
	marca varchar(45) NOT NULL,
	modelo varchar(45) NOT NULL,
	numeroFactura varchar(45) NOT NULL,
	precio int NOT NULL,
	fechaCompra date
);use inventario;
insert into Producto values ('S01E02', 'Notebook', 'Lenovo', 'E-431', '0122', 300000, '2018-07-05');
select *from Producto

CREATE TABLE tipoPrestamo(
	idtipoPrestamo int IDENTITY(1,1) PRIMARY KEY NOT NULL,  
    descripcion varchar(45) NOT NULL,
);

insert into tipoPrestamo values ('Limitado'), ('Indefinido');

CREATE TABLE Prestamo (
	idPrestamo int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	fecha date,
	fechaEntrega date,
	observacion varchar(45),
	estado varchar(45),
	idtipoPrestamo int FOREIGN KEY REFERENCES tipoPrestamo(idtipoPrestamo),
	idProducto int FOREIGN KEY REFERENCES Producto(idProducto),
	idTrabajador int FOREIGN KEY REFERENCES Trabajador(idTrabajador),
	idUsuario int FOREIGN KEY REFERENCES Usuario(idUsuario)
);

insert into Prestamo values ('2018-07-03', '2018-07-03', 'Cualquier cosa', 'Prestamo', 1, 1, 1, 1);
select *from Prestamo;

SELECT Prestamo.fecha, Prestamo.fechaEntrega, Prestamo.observacion, Prestamo.estado, tipoPrestamo.descripcion as tipoPrestamo, Producto.nombre as producto, Trabajador.nombre as trabajador, Usuario.nombre as usuario FROM Prestamo 
JOIN tipoPrestamo ON Prestamo.idtipoPrestamo = tipoPrestamo.idtipoPrestamo
JOIN Producto ON Prestamo.idProducto = Producto.idProducto
JOIN Trabajador ON Prestamo.idTrabajador = Trabajador.idTrabajador
JOIN Usuario ON Prestamo.idUsuario = Usuario.idUsuario;

insert into Cargo values ('Administrador'), ('Encargado'), ('Visor');
select *from Cargo;
delete from Usuario where idCargo = 1;
insert into Usuario values ('1-1', '1234', 'Luis', 'Mendez', 'Mendez', '2018-07-03', 1);
insert into Usuario values ('1-2', '1234', 'Rodrigo', 'Manriquez', 'Gonzalez', '2018-05-07', 2);
insert into Usuario values ('1-3', '1234', 'Visor', 'Visor', 'Visor', '2018-07-03', 3);
select *from Usuario;

insert into Contrato values ('Temporda'), ('Plazo Fijo'), ('Indefinido');
select *from Contrato;

insert into Trabajador values ('12345678-9', '1234', 'Juan', 'Perez', 'Perez', '2018-07-03', 1);
