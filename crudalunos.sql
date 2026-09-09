CREATE DATABASE IF NOT EXISTS crudalunos;
USE crudalunos;

CREATE TABLE IF NOT EXISTS alunos (
  id    INT          AUTO_INCREMENT PRIMARY KEY,
  nome  VARCHAR(255) NOT NULL,
  idade INT          NOT NULL
);
