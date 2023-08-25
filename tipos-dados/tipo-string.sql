CREATE TABLE aluno (
   matricula CHAR(10) NOT NULL,
   nome VARCHAR(120) NOT NULL,
   nome_social VARCHAR(80)
)

INSERT INTO aluno
VALUES(
    '202106A6F7', -- matricula, 
    'Marlos Pinheiro Borges', -- nome
    'Marlin' -- nome_social
);

SELECT * FROM aluno;