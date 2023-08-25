DROP TABLE aluno;

CREATE TABLE aluno (
   matricula CHAR(10) NOT NULL,
   nome VARCHAR(120) NOT NULL,
   nome_social VARCHAR(80),
   semestre TINYINT,
   creditos_cursados SMALLINT,
   media_geral DECIMAL(4,2),
   data_ingresso DATE NOT NULL,
   data_conclusao DATE,
   sexo ENUM('masculino', 'feminino')
)

INSERT INTO aluno
VALUES(
    '202106A6F7', -- matricula, 
    'Marlos Pinheiro Borges', -- nome
    'Marlin', -- nome_social
    3, -- semestre
    56, -- creditos_cursados
    8.7, -- media_geral
    '2021-02-10', -- data_ingresso
    NULL, -- data_conclusao
    'masculino'
);

SELECT * FROM aluno;