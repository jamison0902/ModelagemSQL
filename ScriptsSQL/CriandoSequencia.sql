USE Loja;

CREATE SEQUENCE PessoaSequence  
    START WITH 1  
    INCREMENT BY 1 ;  
GO 

ALTER TABLE Pessoa
ADD CONSTRAINT SQPessoa
DEFAULT NEXT VALUE FOR PessoaSequence
FOR idPessoa;
GO 