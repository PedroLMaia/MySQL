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
   sexo ENUM('masculino', 'feminino') NOT NULL,
   areas_interesse SET('Big Data', 'Banco de Dados', 'Desenvolvimento')
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
    'masculino', -- sexo
    'Banco de Dados,Desenvolvimento' -- areas_interesse
);

SELECT * FROM aluno;
SELECT * FROM aluno WHERE find_in_set('Desenvolvimento', areas_interesse);
SELECT * FROM aluno WHERE find_in_set('Banco de Dados', areas_interesse);
SELECT * FROM aluno WHERE FIND_IN_SET('Banco de Dados', areas_interesse) > 0 AND FIND_IN_SET('Desenvolvimento', areas_interesse) > 0;