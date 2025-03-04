CREATE DATABASE IF NOT EXISTS JhostynSanchezAsencio;
USE JhostynSanchezAsencio;

-- Tabla de Clientes
CREATE TABLE IF NOT EXISTS cliente (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ruc VARCHAR(20) NOT NULL UNIQUE,
    direccion TEXT NOT NULL
);

-- Tabla de Vendedores
CREATE TABLE IF NOT EXISTS vendedor (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE
);

-- Tabla de Facturas
CREATE TABLE IF NOT EXISTS factura (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT UNSIGNED NOT NULL,
    vendedor_id INT UNSIGNED NOT NULL,
    numero_factura VARCHAR(20) NOT NULL UNIQUE,
    fecha DATE NOT NULL DEFAULT CURDATE(),
    condicion_pago VARCHAR(50) NOT NULL,
    subtotal DECIMAL(12,2) NOT NULL,
    igv DECIMAL(12,2) NOT NULL,
    total DECIMAL(12,2) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id) ON DELETE CASCADE,
    FOREIGN KEY (vendedor_id) REFERENCES vendedor(id) ON DELETE SET NULL
);

-- Tabla de Detalle de Factura
CREATE TABLE IF NOT EXISTS detalle_factura (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    factura_id INT UNSIGNED NOT NULL,
    codigo VARCHAR(50) NOT NULL,
    descripcion TEXT NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad > 0),
    precio_unitario DECIMAL(12,2) NOT NULL CHECK (precio_unitario > 0),
    total DECIMAL(12,2) NOT NULL,
    FOREIGN KEY (factura_id) REFERENCES factura(id) ON DELETE CASCADE
);

-- Índices para optimizar consultas
CREATE INDEX idx_factura_cliente ON factura(cliente_id);
CREATE INDEX idx_factura_vendedor ON factura(vendedor_id);
