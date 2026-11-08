#creación de tablas
codigo de ejemplo
CREATE TABLE usuarios (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    correo VARCHAR(100),
    password VARCHAR(255),
    rol VARCHAR(30)
);

CREATE TABLE categorias (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100)
);

CREATE TABLE platos (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    descripcion TEXT,
    precio DECIMAL(10,2),
    disponible BOOLEAN,
    categoria_id BIGINT,
    FOREIGN KEY(categoria_id)
    REFERENCES categorias(id)
);