-- Criando o banco de dados
CREATE DATABASE SistemaEscolar;
USE SistemaEscolar;

-- Criando a tabela de Alunos
CREATE TABLE Alunos (
    idAluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    dataNascimento DATE,
    email VARCHAR(100) UNIQUE,
    telefone VARCHAR(15),
    endereco VARCHAR(200)
);
-- Criando a tabela de Professores
CREATE TABLE Professores (
    idProfessor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    telefone VARCHAR(15)
);
-- Criando a tabela de Cursos
CREATE TABLE Cursos (
    idCurso INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    duracao INT  -- em meses
);
-- Criando a tabela de Matrículas (relacionando Alunos com Cursos)
CREATE TABLE Matriculas (
    idMatricula INT AUTO_INCREMENT PRIMARY KEY,
    idAluno INT,
    idCurso INT,
    dataMatricula DATE,
    status VARCHAR(20), -- (ex: "Ativa", "Concluída", "Cancelada")
    FOREIGN KEY (idAluno) REFERENCES Alunos(idAluno) ON DELETE CASCADE,
    FOREIGN KEY (idCurso) REFERENCES Cursos(idCurso) ON DELETE CASCADE
);
-- Criando a tabela de Aulas (relacionando Professores e Cursos)
CREATE TABLE Aulas (
    idAula INT AUTO_INCREMENT PRIMARY KEY,
    idProfessor INT,
    idCurso INT,
    dataAula DATETIME,
    local VARCHAR(100),
    FOREIGN KEY (idProfessor) REFERENCES Professores(idProfessor) ON DELETE CASCADE,
    FOREIGN KEY (idCurso) REFERENCES Cursos(idCurso) ON DELETE CASCADE
);

-- Criando a tabela de Pagamentos (registro de pagamentos dos alunos)
CREATE TABLE Pagamentos (
    idPagamento INT AUTO_INCREMENT PRIMARY KEY,
    idAluno INT,
    valor DECIMAL(10, 2),
    dataPagamento DATE,
    formaPagamento VARCHAR(50), 
    FOREIGN KEY (idAluno) REFERENCES Alunos(idAluno) ON DELETE CASCADE
);


-- Inserindo dados fictícios na tabela Alunos
INSERT INTO Alunos (nome, dataNascimento, email, telefone, endereco) VALUES
('João Silva', '2005-03-15', 'joao.silva@email.com', '987654321', 'Rua A, 123'),
('Maria Oliveira', '2004-07-22', 'maria.oliveira@email.com', '987654322', 'Rua B, 456'),
('Pedro Santos', '2003-09-11', 'pedro.santos@email.com', '987654323', 'Rua C, 789'),
('Ana Souza', '2005-01-25', 'ana.souza@email.com', '987654324', 'Rua D, 101'),
('Carlos Pereira', '2004-05-30', 'carlos.pereira@email.com', '987654325', 'Rua E, 102'),
('Juliana Costa', '2003-11-15', 'juliana.costa@email.com', '987654326', 'Rua F, 103'),
('Lucas Rocha', '2005-03-02', 'lucas.rocha@email.com', '987654327', 'Rua G, 104'),
('Fernanda Lima', '2004-12-02', 'fernanda.lima@email.com', '987654328', 'Rua H, 105');
-- Inserindo dados fictícios na tabela Professores
INSERT INTO Professores (nome, especialidade, email, telefone) VALUES
('Roberto Martins', 'Matemática', 'roberto.martins@email.com', '987654329'),
('Cláudia Pereira', 'Português', 'claudia.pereira@email.com', '987654330'),
('Ricardo Alves', 'Física', 'ricardo.alves@email.com', '987654331'),
('Fernanda Almeida', 'História', 'fernanda.almeida@email.com', '987654332'),
('Gustavo Souza', 'Química', 'gustavo.souza@email.com', '987654333');
-- Inserindo dados fictícios na tabela Cursos
INSERT INTO Cursos (nome, descricao, duracao) VALUES
('Matemática para Iniciantes', 'Curso básico de Matemática', 6),
('Literatura Brasileira', 'Estudo das principais obras da literatura brasileira', 5),
('Física Moderna', 'Curso de Física avançada', 8),
('História Geral', 'Análise dos principais eventos históricos globais', 5),
('Química Orgânica', 'Introdução à Química Orgânica', 7);
-- Inserindo dados fictícios na tabela Matrículas
INSERT INTO Matriculas (idAluno, idCurso, dataMatricula, status) VALUES
(1, 1, '2025-02-01', 'Ativa'),
(1, 2, '2025-02-01', 'Ativa'),
(2, 1, '2025-02-02', 'Ativa'),
(3, 3, '2025-02-05', 'Ativa'),
(4, 2, '2025-02-07', 'Ativa'),
(5, 4, '2025-02-10', 'Ativa'),
(6, 5, '2025-02-12', 'Ativa'),
(7, 1, '2025-02-15', 'Ativa'),
(8, 4, '2025-02-18', 'Ativa');
-- Inserindo dados fictícios na tabela Aulas
INSERT INTO Aulas (idProfessor, idCurso, dataAula, local) VALUES
(1, 1, '2025-02-20 08:00:00', 'Sala 101'),
(2, 2, '2025-02-21 10:00:00', 'Sala 102'),
(3, 3, '2025-02-22 09:00:00', 'Laboratório 1'),
(4, 4, '2025-02-23 14:00:00', 'Sala 201'),
(5, 5, '2025-02-24 08:30:00', 'Laboratório 2');
-- Inserindo dados fictícios na tabela Pagamentos
INSERT INTO Pagamentos (idAluno, valor, dataPagamento, formaPagamento) VALUES
(1, 300.00, '2025-02-01', 'Boleto'),
(2, 250.00, '2025-02-02', 'Cartão'),
(3, 320.00, '2025-02-05', 'Transferência'),
(4, 280.00, '2025-02-07', 'Boleto'),
(5, 300.00, '2025-02-10', 'Cartão'),
(6, 350.00, '2025-02-12', 'Transferência'),
(7, 310.00, '2025-02-15', 'Boleto'),
(8, 290.00, '2025-02-18', 'Cartão');
-- Atualizando dados fictícios na tabela Alunos
UPDATE Alunos SET telefone = '987654999' WHERE idAluno = 1;
UPDATE Alunos SET endereco = 'Rua J, 999' WHERE idAluno = 2;
-- Atualizando dados fictícios na tabela Professores
UPDATE Professores SET telefone = '987654334' WHERE idProfessor = 1;
UPDATE Professores SET especialidade = 'Geometria' WHERE idProfessor = 2;
-- Atualizando dados fictícios na tabela Cursos
UPDATE Cursos SET duracao = 7 WHERE idCurso = 3;
UPDATE Cursos SET descricao = 'Estudo das principais obras de Literatura Brasileira' WHERE idCurso = 2;
-- Deletando registros fictícios
DELETE FROM Matriculas WHERE idMatricula = 2;
DELETE FROM Aulas WHERE idAula = 3;
DELETE FROM Pagamentos WHERE idPagamento = 6;






















































