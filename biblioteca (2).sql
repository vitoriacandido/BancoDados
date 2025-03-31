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
create table livros (
id INT auto_increment primary key,
titulo varchar (255) not null,
id_autor INT,
id_categoria INT,
ano_publicado INT,
FOREIGN KEY (id_autor) REFERENCES autores (id),
FOREIGN KEY (id_categoria) REFERENCES categoria (id));

-- iNSERIR DADOS DA TABELA AUTORES
INSERT INTO autores (nome,nacionalidade) VALUES
('Machado de Assis', 'Brasileiro'),
('George Orwell', 'Britânico'),
('J.K Roling','Britânico');


    


drop database biblioteca;