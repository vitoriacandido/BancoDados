-- Criação do banco de dados
CREATE DATABASE SistemaNotasFiscais;
USE SistemaNotasFiscais;
-- Tabela de empresas (emitente da nota)
CREATE TABLE Empresa (
    id_empresa INT PRIMARY KEY AUTO_INCREMENT,
    nome_fantasia VARCHAR(100),
    razao_social VARCHAR(100),
    telefone VARCHAR(20),
    endereco VARCHAR(150),
    cnpj VARCHAR(20),
    inscricao_estadual VARCHAR(20)
);
-- Tabela de notas fiscais
CREATE TABLE NotaFiscal (
    id_nota INT PRIMARY KEY AUTO_INCREMENT,
    id_empresa INT,
    data_emissao DATE,
    numero_nota VARCHAR(20),
    total DECIMAL(10, 2),
    FOREIGN KEY (id_empresa) REFERENCES Empresa(id_empresa)
);
-- Tabela de itens da nota
CREATE TABLE ItemNota (
    id_item INT PRIMARY KEY AUTO_INCREMENT,
    id_nota INT,
    quantidade INT,
    descricao VARCHAR(100),
    valor_unitario DECIMAL(10, 2),
    valor_total DECIMAL(10, 2),
    FOREIGN KEY (id_nota) REFERENCES NotaFiscal(id_nota)
);


-- Inserir empresas
INSERT INTO Empresa (nome_fantasia, razao_social, telefone, endereco, cnpj, inscricao_estadual) VALUES
('Loja XPTO', 'XPTO Comércio Ltda', '(61) 3333-3333', 'Rua A, QD 1, LT 10', '00.000.000/0001-00', '12345678'),
('Mercado Boa Compra', 'Boa Compra Ltda', '(61) 4444-4444', 'Av. Central, nº 200', '11.111.111/0001-11', '87654321');
-- Inserir notas fiscais
INSERT INTO NotaFiscal (id_empresa, data_emissao, numero_nota, total) VALUES
(1, '2025-04-07', 'NF001', 150.00),
(1, '2025-04-06', 'NF002', 300.00),
(2, '2025-04-07', 'NF003', 75.00);
-- Inserir itens nas notas (total de 15 registros aqui)
INSERT INTO ItemNota (id_nota, quantidade, descricao, valor_unitario, valor_total) VALUES
(1, 2, 'Mouse USB', 25.00, 50.00),
(1, 1, 'Teclado USB', 100.00, 100.00),
(2, 3, 'Cabo HDMI', 50.00, 150.00),
(2, 3, 'Pen Drive 32GB', 50.00, 150.00),
(3, 1, 'Caixa de Som', 75.00, 75.00),
(1, 1, 'Webcam HD', 75.00, 75.00),
(2, 1, 'Adaptador USB-C', 50.00, 50.00),
(2, 2, 'Hub USB', 75.00, 150.00),
(3, 2, 'Mousepad', 20.00, 40.00),
(3, 1, 'Fone de Ouvido', 35.00, 35.00),
(1, 1, 'HD Externo', 250.00, 250.00),
(1, 2, 'Monitor LED', 600.00, 1200.00),
(2, 4, 'Cabo de Força', 15.00, 60.00),
(3, 2, 'Controle de Xbox', 200.00, 400.00),
(3, 1, 'Base para notebook', 90.00, 90.00);
-- UPDATE em um item
UPDATE ItemNota SET valor_unitario = 30.00, valor_total = 60.00 WHERE id_item = 1;
-- DELETE de um item
DELETE FROM ItemNota WHERE id_item = 15;