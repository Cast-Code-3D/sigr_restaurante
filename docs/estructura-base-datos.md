#modelo entidad-relación y diccionario de datos
codigo de ejemplo

CREATE DATABASE sigr;

USE sigr;

-- =====================================
-- USUARIOS
-- =====================================

CREATE TABLE usuarios (

    id_usuario BIGINT AUTO_INCREMENT PRIMARY KEY,

    nombre VARCHAR(100) NOT NULL,

    correo VARCHAR(100) UNIQUE NOT NULL,

    password VARCHAR(255) NOT NULL,

    rol ENUM(
        'ADMINISTRADOR',
        'MESERO',
        'CLIENTE'
    ) NOT NULL
);

-- =====================================
-- RESERVAS
-- =====================================

CREATE TABLE reservas (

    id_reserva BIGINT AUTO_INCREMENT PRIMARY KEY,

    fecha DATE NOT NULL,

    hora TIME NOT NULL,

    cantidad_personas INT NOT NULL,

    estado VARCHAR(30),

    id_usuario BIGINT,

    CONSTRAINT fk_reserva_usuario
        FOREIGN KEY(id_usuario)
        REFERENCES usuarios(id_usuario)
);

-- =====================================
-- CATEGORIAS
-- =====================================

CREATE TABLE categorias (

    id_categoria BIGINT AUTO_INCREMENT PRIMARY KEY,

    nombre VARCHAR(100) NOT NULL
);

-- =====================================
-- PLATOS
-- =====================================

CREATE TABLE platos (

    id_plato BIGINT AUTO_INCREMENT PRIMARY KEY,

    nombre VARCHAR(150) NOT NULL,

    descripcion TEXT,

    precio DECIMAL(10,2) NOT NULL,

    disponible BOOLEAN DEFAULT TRUE,

    id_categoria BIGINT,

    CONSTRAINT fk_plato_categoria
        FOREIGN KEY(id_categoria)
        REFERENCES categorias(id_categoria)
);

-- =====================================
-- PEDIDOS
-- =====================================

CREATE TABLE pedidos (

    id_pedido BIGINT AUTO_INCREMENT PRIMARY KEY,

    fecha_hora DATETIME NOT NULL,

    estado VARCHAR(30) NOT NULL,

    mesa INT NOT NULL,

    total DECIMAL(10,2),

    id_usuario BIGINT,

    CONSTRAINT fk_pedido_usuario
        FOREIGN KEY(id_usuario)
        REFERENCES usuarios(id_usuario)
);

-- =====================================
-- DETALLE PEDIDO
-- =====================================

CREATE TABLE detalle_pedido (

    id_detalle BIGINT AUTO_INCREMENT PRIMARY KEY,

    cantidad INT NOT NULL,

    subtotal DECIMAL(10,2),

    id_pedido BIGINT,

    id_plato BIGINT,

    CONSTRAINT fk_detalle_pedido
        FOREIGN KEY(id_pedido)
        REFERENCES pedidos(id_pedido),

    CONSTRAINT fk_detalle_plato
        FOREIGN KEY(id_plato)
        REFERENCES platos(id_plato)
);

-- =====================================
-- FACTURAS
-- =====================================

CREATE TABLE facturas (

    id_factura BIGINT AUTO_INCREMENT PRIMARY KEY,

    fecha DATETIME NOT NULL,

    total DECIMAL(10,2) NOT NULL,

    id_pedido BIGINT UNIQUE,

    CONSTRAINT fk_factura_pedido
        FOREIGN KEY(id_pedido)
        REFERENCES pedidos(id_pedido)
);

-- =====================================
-- CAJA
-- =====================================

CREATE TABLE cajas (

    id_caja BIGINT AUTO_INCREMENT PRIMARY KEY,

    fecha DATE NOT NULL,

    saldo_inicial DECIMAL(12,2),

    total_ingresos DECIMAL(12,2),

    total_egresos DECIMAL(12,2),

    saldo_final DECIMAL(12,2)
);
