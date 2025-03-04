
CREATE DATABASE JhostynSanchezAsencio;
USE JhostynSanchezAsencio;

-- Tabla de Facturas
CREATE TABLE factura (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    ruc VARCHAR(20) NOT NULL,
    numero_factura VARCHAR(20) NOT NULL,
    fecha DATE NOT NULL,
    cliente VARCHAR(100) NOT NULL,
    direccion TEXT NOT NULL,
    vendedor VARCHAR(100) NOT NULL,
    condicion_pago VARCHAR(50) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    igv DECIMAL(10,2) NOT NULL,
    total DECIMAL(10,2) NOT NULL
);

-- Tabla de Detalle de Factura
CREATE TABLE detalle_factura (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    factura_id INT UNSIGNED NOT NULL,
    codigo VARCHAR(50) NOT NULL,
    descripcion TEXT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (factura_id) REFERENCES factura(id) ON DELETE CASCADE
);
