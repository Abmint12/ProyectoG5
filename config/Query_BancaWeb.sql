-- Crear la base de datos

-- Tabla de Roles
CREATE TABLE Roles (
    ID INT PRIMARY KEY IDENTITY,
    Nombre NVARCHAR(50) NOT NULL
);

-- Tabla de Usuarios
CREATE TABLE Usuarios (
    ID INT PRIMARY KEY IDENTITY,
    Nombre NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    Contrasena NVARCHAR(255) NOT NULL,
    FechaCreacion DATETIME DEFAULT GETDATE(),
    RolID INT NOT NULL,
    FOREIGN KEY (RolID) REFERENCES Roles(ID)
);

-- Tabla de Clientes
CREATE TABLE Clientes (
    ID INT PRIMARY KEY IDENTITY,
    Nombre NVARCHAR(100) NOT NULL,
    Direccion NVARCHAR(255),
    Telefono NVARCHAR(15)
);

-- Tabla de Contactos (relacionados con Clientes)
CREATE TABLE Contactos (
    ID INT PRIMARY KEY IDENTITY,
    ClienteID INT NOT NULL,
    Nombre NVARCHAR(100) NOT NULL,
    Telefono NVARCHAR(15),
    Relacion NVARCHAR(50),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ID)
);

-- Tabla de �rdenes de Compra
CREATE TABLE OrdenesCompra (
    ID INT PRIMARY KEY IDENTITY,
    ClienteID INT NOT NULL,
    Fecha DATETIME DEFAULT GETDATE(),
    Total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ID)
);

-- Tabla de Valores a Pagar
CREATE TABLE ValoresPagar (
    ID INT PRIMARY KEY IDENTITY,
    OrdenID INT NOT NULL,
    Tipo NVARCHAR(50) NOT NULL,
    Monto DECIMAL(10, 2) NOT NULL,
    Estado NVARCHAR(50) NOT NULL,
    FOREIGN KEY (OrdenID) REFERENCES OrdenesCompra(ID)
);

-- Tabla de Transferencias Bancarias
CREATE TABLE TransferenciasBancarias (
    ID INT PRIMARY KEY IDENTITY,
    ClienteOrigenID INT NOT NULL,
    ClienteDestinoID INT NOT NULL,
    Monto DECIMAL(10, 2) NOT NULL,
    Fecha DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ClienteOrigenID) REFERENCES Clientes(ID),
    FOREIGN KEY (ClienteDestinoID) REFERENCES Clientes(ID)
);

-- Tabla de Solicitudes de Transacciones
CREATE TABLE SolicitudesTransacciones (
    ID INT PRIMARY KEY IDENTITY,
    ClienteID INT NOT NULL,
    Tipo NVARCHAR(50) NOT NULL,
    Estado NVARCHAR(50) NOT NULL,
    Fecha DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ID)
);

-- Insertar datos iniciales para Roles
INSERT INTO Roles (Nombre) VALUES ('Administrador'), ('Usuario');
select * from Usuarios;

INSERT INTO Usuarios (Nombre, Email, Contrasena, RolID) VALUES 
('Maria Gomez', 'maria.gomez@gmail.com.com', 'password456', 2);

-- Insertar datos iniciales para Clientes
INSERT INTO Clientes (Nombre, Direccion, Telefono) VALUES 
  ('Roberto  Juarez', 'Av.Chirijos-Milagro', '0987654321'),
('Karla Denisse', 'TLas Mercedes-Naranjal', '0981122334');

-- Insertar datos iniciales para Contactos
INSERT INTO Contactos (ClienteID, Nombre, Telefono, Relacion) VALUES 
(1, 'Luis Lopez', '0991234567', 'Hermano'),
(2, 'Sara Torres', '0999876543', 'Amiga');

-- Insertar datos iniciales para �rdenes de Compra
INSERT INTO OrdenesCompra (ClienteID, Total) VALUES 
(1, 150.50),
(2, 300.00);

-- Insertar datos iniciales para Valores a Pagar
INSERT INTO ValoresPagar (OrdenID, Tipo, Monto, Estado) VALUES 
(1, 'Tarjeta de Cr�dito', 150.50, 'Pendiente'),
(2, 'Efectivo', 300.00, 'Pagado');

-- Insertar datos iniciales para Transferencias Bancarias
INSERT INTO TransferenciasBancarias (ClienteOrigenID, ClienteDestinoID, Monto) VALUES 
(1, 2, 75.00),
(2, 1, 125.00);

-- Insertar datos iniciales para Solicitudes de Transacciones
INSERT INTO SolicitudesTransacciones (ClienteID, Tipo, Estado) VALUES 
(1, 'Transferencia', 'Completada'),
(2, 'Pago', 'Pendiente');

-- Crear login con contrase�a


-- Cambiar a la base de datos BancaWebDB
USE BancaWebDB;

-- Crear usuario asociado al login


-- Establecer contrase�a y base de datos predeterminada para el login


-- Crear el usuario en la base de datos y asignar el rol db_owner


-- Listar tablas
SELECT * FROM INFORMATION_SCHEMA.TABLES;

-- Probar lectura en una tabla (verificar si la tabla Roles existe)
SELECT TOP 1 * FROM Roles;

-- Insertar datos (si tiene permisos de escritura en la tabla Roles)
INSERT INTO Roles (Nombre) VALUES ('PruebaRol');

SELECT 
    name AS LoginName,
    type_desc AS LoginType,
    is_disabled AS IsDisabled,
    default_database_name AS DefaultDatabase,
    create_date AS CreatedDate
FROM sys.sql_logins;
ALTER LOGIN LuisAbraham WITH PASSWORD = 'Clave2025';
