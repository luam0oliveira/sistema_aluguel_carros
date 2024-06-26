DROP TABLE IF EXISTS Clientes;
DROP TABLE IF EXISTS Carros;
DROP TABLE IF EXISTS Funcionarios;
DROP TABLE IF EXISTS Cache;

CREATE TABLE Clientes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    cpf VARCHAR(14) UNIQUE,
    nome VARCHAR(50)
);

CREATE TABLE Carros (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    cor VARCHAR(50),
    multa INTEGER,
    placa VARCHAR(7) UNIQUE,
	modelo VARCHAR(50),
	taxa_dia INTEGER,
	estimativa_devolucao DATETIME NULL,
    cliente_id INTEGER NULL,
	
	FOREIGN KEY (cliente_id) REFERENCES Clientes(id)
);

CREATE TABLE Funcionarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    cpf VARCHAR(50) UNIQUE,
    nome VARCHAR(50),
    permissoes INTEGER,
	hash_senha VARCHAR(128)
);

CREATE TABLE Cache(
	id INTEGER PRIMARY KEY CHECK (id = 1),
	funcionario_atual INTEGER NULL,
	FOREIGN KEY (funcionario_atual) REFERENCES Funcionarios(id)
);