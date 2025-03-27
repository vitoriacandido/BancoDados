-- Criar banco de dados 
CREATE DATABASE Biblioteca;
USE Biblioteca;
-- Criar tabela de autores
CREATE TABLE autores (
id INT AUTO_INCREMENT PRIMARY KEY,
nome  VARCHAR (255) NOT NULL,
nacionalidade  VARCHAR (100));

-- Criar tabela de categorias
CREATE TABLE  categoria (
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR (100) NOT NULL
);

-- Criar tabela de livros
CREATE TABLE livros (
id INT AUTO_INCREMENT PRIMARY KEY,
titulo VARCHAR (255) NOT NULL,
id_autor INT,
id_categoria INT,
ano_publicado INT,
FOREIGN KEY (id_autor) REFERENCES autores (id),
FOREIGN KEY (id_categorias) REFERENCES categoria (id));

-- iNSERIR DADOS DA TABELA AUTORES
INSERT INTO autores (nome,nacionalidade) VALUES
('Machado de Assis', 'Brasileiro'),
('George Orwell', 'Britânico'),
('J.K Roling','Britânico');

-- Insert dados na tabela categorias 
INSERT INTO categorias (nome) VALUES
('Romance'),
('Ficção Cientifica'),
('Fantasia');

