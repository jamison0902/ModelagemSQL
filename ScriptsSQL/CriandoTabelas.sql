USE Loja;

CREATE TABLE Pessoa (
  idPessoa INT  NOT NULL,
  nome VARCHAR(255)  NOT NULL,
  logradouro VARCHAR(255)  NOT NULL,
  cidade VARCHAR(255)  NOT NULL,
  estado CHAR(2) NOT NULL,
  telefone VARCHAR(11) NOT NULL,
  email VARCHAR(255) NOT NULL,
PRIMARY KEY(idPessoa));
GO

CREATE TABLE Produto (
  idProduto INT NOT NULL IDENTITY(1,1) ,
  nome VARCHAR(255) NOT NULL,
  quantidade INTEGER NOT NULL,
  precoVenda MONEY NOT NULL,
PRIMARY KEY(idProduto));
GO

CREATE TABLE Usuario (
  idUsuario INT NOT NULL IDENTITY(1,1),
  login VARCHAR(20)  NOT NULL,
  senha VARCHAR(20)  NOT NULL,
PRIMARY KEY(idUsuario));
GO

CREATE TABLE PessoaJuridica (
  idPessoa INT NOT NULL,
  cnpj VARCHAR(20));
GO

CREATE TABLE PessoaFisica (
  idPessoa INT,
  cpf VARCHAR(11));
GO

CREATE TABLE Movimento (
  idMovimento INT NOT NULL IDENTITY(1,1),
  idUsuario INT NOT NULL,
  idPessoa INT NOT NULL,
  idProduto INT NOT NULL,
  quantidade INTEGER NOT NULL,
  tipo CHAR(1) NOT NULL,
  valorUnitario MONEY NOT NULL,
CHECK (tipo ='E' OR tipo='S'),
PRIMARY KEY(idMovimento));
GO