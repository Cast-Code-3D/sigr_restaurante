#instalación y puesta en marcha

Manual de Despliegue
Sistema Integral de Gestión de Restaurante (SIGR)
1. Introducción
Este documento describe el proceso de instalación, configuración y puesta en marcha del Sistema Integral de Gestión de Restaurante (SIGR).

El sistema permite gestionar usuarios, menús, pedidos, reservas, facturación y reportes operativos.

2. Requisitos del Sistema
Hardware Mínimo
Procesador: Intel Core i3 o superior
Memoria RAM: 4 GB
Espacio en disco: 2 GB libres
Hardware Recomendado
Procesador: Intel Core i5 o superior
Memoria RAM: 8 GB
Espacio en disco: 10 GB libres
3. Software Requerido
Backend
Java JDK 21
Maven 3.9 o superior
Verificar instalación:

java -version
mvn -version
Frontend
Node.js 20 o superior
npm 10 o superior
Verificar instalación:

node -v
npm -v
Base de Datos
MySQL Server 8.0
Verificar:

SELECT VERSION();
Control de Versiones
Git
Verificar:

git --version
4. Clonación del Repositorio
Ejecutar:

git clone https://github.com/Cast-Code-3D/sigr_restaurante.git
Ingresar al proyecto:

cd sigr
5. Configuración de Base de Datos
Ingresar a MySQL y crear la base de datos:

CREATE DATABASE sigr;
Seleccionar la base:

USE sigr;
Ejecutar:

database/schema.sql
Posteriormente:

database/seed.sql
Esto creará las tablas iniciales y los datos de prueba.

6. Configuración de Variables de Entorno
Crear archivo:

.env
Basado en:

.env.example
Ejemplo:

DB_HOST=localhost
DB_PORT=3306
DB_NAME=sigr
DB_USER=root
DB_PASSWORD=123456
7. Instalación del Backend
Ubicarse en:

cd backend
Descargar dependencias:

mvn clean install
Iniciar aplicación:

mvn spring-boot:run
Servidor disponible en:

http://localhost:8080
8. Instalación del Frontend
Ubicarse en:

cd frontend
Instalar dependencias:

npm install
Ejecutar:

npm run dev
Aplicación disponible en:

http://localhost:5173
9. Verificación del Despliegue
Las siguientes validaciones deben realizarse:

Autenticación
Registro de usuario.
Inicio de sesión.
Menú
Consulta de platos.
Registro de platos.
Pedidos
Creación de pedidos.
Actualización de estados.
Reservas
Registro de reserva.
Consulta de disponibilidad.
Caja
Apertura de caja.
Cierre de caja.
Reportes
Consulta de ventas diarias.
10. Estructura General del Proyecto
sigr/
│
├── src/
├── database/
├── docs/
├── tests/
├── README.md
├── CHANGELOG.md
└── LICENSE.txt
11. Solución de Problemas
Error de conexión a MySQL
Verificar:

DB_HOST
DB_PORT
DB_USER
DB_PASSWORD
Error de dependencias Maven
Ejecutar:

mvn clean install
Error de dependencias Node.js
Ejecutar:

npm install
12. Línea Base
Versión:

v1.0
Identificador:

LB-SIGR-001

Estado:

Aprobado