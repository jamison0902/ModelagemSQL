USE Loja;

ALTER TABLE PessoaJuridica
   ADD CONSTRAINT PessoaJuridica_FK FOREIGN KEY (idPessoa)
       REFERENCES Pessoa(idPessoa);
GO

ALTER TABLE PessoaFisica
   ADD CONSTRAINT PessoaFisica_FK FOREIGN KEY (idPessoa)
       REFERENCES Pessoa(idPessoa);
GO

ALTER TABLE Movimento
   ADD CONSTRAINT Pessoa_FK FOREIGN KEY (idPessoa)
       REFERENCES Pessoa(idPessoa);
GO

ALTER TABLE Movimento
   ADD CONSTRAINT Produto_FK FOREIGN KEY(idProduto)
    REFERENCES Produto(idProduto);
GO

ALTER TABLE Movimento
   ADD CONSTRAINT Usuario_FK FOREIGN KEY(idUsuario)
    REFERENCES Usuario(idUsuario);
GO


