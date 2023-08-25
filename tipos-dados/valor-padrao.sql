DROP TABLE aluno;

CREATE TABLE aluno (
   matricula CHAR(10) NOT NULL,
   nome VARCHAR(120) NOT NULL,
   nome_social VARCHAR(80),
   semestre TINYINT DEFAULT 1,
   creditos_cursados SMALLINT DEFAULT 0,
   media_geral DECIMAL(4,2) DEFAULT 0,
   data_ingresso DATE NOT NULL DEFAULT (CURRENT_DATE),
   data_conclusao DATE DEFAULT NULL,
   sexo ENUM('masculino', 'feminino'),
   periodo ENUM('matutino', 'noturno') NOT NULL,
   areas_interesse SET('Big Data', 'Banco de Dados', 'Desenvolvimento'),
   bolsista BOOLEAN DEFAULT false
);

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
    'noturno', -- periodo
    'Banco de Dados,Desenvolvimento', -- areas_interesse
    true -- bolsista
);

INSERT INTO 
    aluno
VALUES(
    '202106A6F7', -- matricula, 
    'Marlos Pinheiro Borges', -- nome
    'Marlin', -- nome_social
    DEFAULT, -- semestre
    DEFAULT, -- creditos_cursados
    DEFAULT, -- media_geral
    DEFAULT, -- data_ingresso
    NULL, -- data_conclusao
    'masculino', -- sexo
    'noturno', -- periodo
    'Banco de Dados,Desenvolvimento', -- areas_interesse
    DEFAULT -- bolsista
);

INSERT INTO 
    aluno( matricula, nome, nome_social, data_conclusao, sexo, periodo, areas_interesse)
VALUES(
    '202106A6F7', -- matricula, 
    'Pinheiro Borges', -- nome
    'Marlin', -- nome_social
    NULL, -- data_conclusao
    'masculino', -- sexo
    'noturno', -- periodo
    'Banco de Dados,Desenvolvimento' -- areas_interesse
);

SELECT * FROM aluno;