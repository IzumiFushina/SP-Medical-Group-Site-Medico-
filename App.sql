CREATE DATABASE IF NOT EXISTS spmedicalgroupdb;
USE spmedicalgroupdb;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    usernamecomplete VARCHAR(255) NOT NULL,
    Datadenascimento VARCHAR(255) NOT NULL,
    sexo VARCHAR(255) NOT NULL,
);

CREATE TABLE IF NOT EXISTS consultas (
    usernamecomplete VARCHAR(255) NOT NULL,
    data VARCHAR(12) NOT NULL,
    hora VARCHAR(6) NOT NULL,
    medico VARCHAR(255) NOT NULL,
    informacoes VARCHAR(255) NOT NULL,
);