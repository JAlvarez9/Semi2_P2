CREATE TABLE Proveedor(
	id_proveedor int PRIMARY KEY IDENTITY(1,1),
	cod varchar(6),
	nombre varchar(100),
	direccion varchar(200),
	numero int,
	web varchar(10)
);

CREATE TABLE Marca(
	id_marca int primary key identity(1,1),
	nombre varchar(25)
);

CREATE TABLE Categoria(
	id_categoria int primary key identity(1,1),
	nombre varchar(30)
);

CREATE TABLE Tipo(
	id_tipo int primary key identity(1,1),
	nombre varchar(30)
);

CREATE TABLE Vendedor(
	id_vendedor int primary key identity(1,1),
	codVendedor varchar(6),
	nombre varchar(150),
	vacacionista varchar(3)
);

CREATE TABLE Departamento(
	id_departamento int primary key identity(1,1),
	nombre varchar(150)
);

CREATE TABLE Region(
	id_region int primary key identity(1,1),
	nombre varchar(150)
);

CREATE TABLE Producto(
	id_producto int primary key identity(1,1),
	codProducto varchar(15),
	nombre varchar(100),
	id_marca int,
	id_categoria int,
	foreign key (id_marca) references dbo.Marca(id_marca),
	foreign key (id_categoria) references dbo.Categoria(id_categoria),
);

CREATE TABLE Cliente(
	id_cliente int primary key identity(1,1),
	codCliente varchar(7),
	nombre varchar(150),
	id_tipo int,
	direccion varchar(150),
	numero int,
	foreign key (id_tipo) references dbo.Tipo(id_tipo),
);

CREATE TABLE Sucursal(
	id_sucursal int primary key identity(1,1),
	codSucursal varchar(10),
	nombre varchar(100),
	direccion varchar(200),
	id_region int,
	id_departamento int,
	foreign key (id_region) references dbo.Region(id_region),
	foreign key (id_departamento) references dbo.Departamento(id_departamento),
);

CREATE TABLE Venta(
	id_venta int primary key identity(1,1),
	id_cliente int,
	id_vendedor int,
	id_producto int,
	id_sucursal int,
	unidades int,
	precioUnitario decimal(5,2),
	fecha varchar(25),
	foreign key (id_cliente) references dbo.Cliente(id_cliente),
	foreign key (id_vendedor) references dbo.Vendedor(id_vendedor),
	foreign key (id_producto) references dbo.Producto(id_producto),
	foreign key (id_sucursal) references dbo.Sucursal(id_sucursal),
);

CREATE TABLE Compra(
	id_compra int primary key identity(1,1),
	id_proveedor int,
	id_producto int,
	id_sucursal int,
	unidades int,
	costoUnitario decimal(5,2),
	fecha varchar(25),
	foreign key (id_proveedor) references dbo.Proveedor(id_proveedor),
	foreign key (id_producto) references dbo.Producto(id_producto),
	foreign key (id_sucursal) references dbo.Sucursal(id_sucursal),
);

SELECT * FROM dbo.Proveedor;
SELECT COUNT(*) from dbo.Proveedor;
SELECT COUNT(*) from dbo.Categoria;
SELECT COUNT(*) from dbo.Marca;
SELECT COUNT(*) from dbo.Departamento;
SELECT COUNT(*) from dbo.Region;
SELECT COUNT(*) from dbo.Tipo;

SELECT * FROM dbo.Departamento
order by id_departamento;


SELECT * FROM dbo.Cliente 
order by codCliente;
SELECT * FROM dbo.Producto 
order by codProducto;
SELECT * FROM dbo.Vendedor 
order by codVendedor;
SELECT * FROM dbo.Sucursal 
order by codSucursal;
SELECT * FROM dbo.Compra 
order by id_compra;
SELECT COUNT(*) FROM dbo.Cliente;
SELECT COUNT(*) FROM dbo.Producto;
SELECT COUNT(*) FROM dbo.Vendedor;
SELECT COUNT(*) FROM dbo.Sucursal;
SELECT COUNT(*) FROM dbo.Compra;
SELECT COUNT(*) FROM dbo.Venta;


DELETE FROM dbo.Compra;
DELETE FROM dbo.Venta;
DELETE FROM dbo.Sucursal;
DELETE FROM dbo.Cliente;
DELETE FROM dbo.Producto;
DELETE FROM dbo.Region;
DELETE FROM dbo.Departamento;
DELETE FROM dbo.Vendedor;
DELETE FROM dbo.Tipo;
DELETE FROM dbo.Categoria;
DELETE FROM dbo.Marca;
DELETE FROM dbo.Proveedor;

DROP TABLE dbo.Compra;
DROP TABLE dbo.Venta;
DROP TABLE dbo.Sucursal;
DROP TABLE dbo.Cliente;
DROP TABLE dbo.Producto;
DROP TABLE dbo.Region;
DROP TABLE dbo.Departamento;
DROP TABLE dbo.Vendedor;
DROP TABLE dbo.Tipo;
DROP TABLE dbo.Categoria;
DROP TABLE dbo.Marca;
DROP TABLE dbo.Proveedor;

