create database db_coffee DEFAULT CHARACTER SET utf8 ;

USE db_coffee ;

-- -----------------------------------------------------
-- Table Tipo
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tipo (
  idTipo INT NOT NULL AUTO_INCREMENT,
  Tipo VARCHAR(45) NOT NULL,
  PRIMARY KEY (idTipo));


-- -----------------------------------------------------
-- Table Categoria
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Categoria (
  idCategoria INT NOT NULL AUTO_INCREMENT,
  Nombre VARCHAR(45) NOT NULL,
  PRIMARY KEY (idCategoria));


-- -----------------------------------------------------
-- Table Producto
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Producto (
  idProducto INT NOT NULL AUTO_INCREMENT,
  Nombre VARCHAR(100) NOT NULL,
  Precio DECIMAL NOT NULL,
  Descripcion VARCHAR(200) NULL,
  Categoria_idCategoria INT NOT NULL,
  PRIMARY KEY (idProducto, Categoria_idCategoria),
  INDEX fk_Producto_Categoria1_idx (Categoria_idCategoria ASC) VISIBLE,
  CONSTRAINT fk_Producto_Categoria1
    FOREIGN KEY (Categoria_idCategoria)
    REFERENCES Categoria (idCategoria)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table Usuario
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Usuario (
  NIT INT NOT NULL,
  Nombre VARCHAR(100) NOT NULL,
  Direccion VARCHAR(150) NULL,
  Correo VARCHAR(150) NOT NULL,
  DPI INT NULL,
  Tipo_idTipo INT NOT NULL,
  PRIMARY KEY (NIT, Tipo_idTipo),
  INDEX fk_Usuario_Tipo1_idx (Tipo_idTipo ASC) VISIBLE,
  CONSTRAINT fk_Usuario_Tipo1
    FOREIGN KEY (Tipo_idTipo)
    REFERENCES Tipo (idTipo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table Venta
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Venta (
  idVenta INT NOT NULL,
  Usuario_NIT INT NULL DEFAULT 0,
  Usuario_Tipo_idTipo INT NULL DEFAULT 0,
  PRIMARY KEY (idVenta),
  INDEX fk_Venta_Usuario1_idx (Usuario_NIT ASC, Usuario_Tipo_idTipo ASC) VISIBLE,
  CONSTRAINT fk_Venta_Usuario1
    FOREIGN KEY (Usuario_NIT , Usuario_Tipo_idTipo)
    REFERENCES Usuario (NIT , Tipo_idTipo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table Venta_Producto
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Venta_Producto (
  Venta_idVenta INT NOT NULL,
  Producto_idProducto INT NOT NULL,
  Producto_Categoria_idCategoria INT NOT NULL,
  Cantidad INT NOT NULL,
  Total DECIMAL NOT NULL,
  PRIMARY KEY (Venta_idVenta, Producto_idProducto, Producto_Categoria_idCategoria),
  INDEX fk_Venta_has_Producto_Producto1_idx (Producto_idProducto ASC, Producto_Categoria_idCategoria ASC) VISIBLE,
  INDEX fk_Venta_has_Producto_Venta1_idx (Venta_idVenta ASC) VISIBLE,
  CONSTRAINT fk_Venta_has_Producto_Venta1
    FOREIGN KEY (Venta_idVenta)
    REFERENCES Venta (idVenta)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Venta_has_Producto_Producto1
    FOREIGN KEY (Producto_idProducto , Producto_Categoria_idCategoria)
    REFERENCES Producto (idProducto , Categoria_idCategoria)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table Factura
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Factura (
  idFactura INT NOT NULL,
  Fecha VARCHAR(11) NOT NULL,
  Total DECIMAL NOT NULL,
  Venta_idVenta INT NOT NULL,
  PRIMARY KEY (idFactura, Venta_idVenta),
  INDEX fk_Factura_Venta1_idx (Venta_idVenta ASC) VISIBLE,
  CONSTRAINT fk_Factura_Venta1
    FOREIGN KEY (Venta_idVenta)
    REFERENCES Venta (idVenta)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
