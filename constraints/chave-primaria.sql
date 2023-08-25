DROP TABLE IF EXISTS departamento;

CREATE TABLE IF NOT EXISTS departamento (
    id INT PRIMARY KEY, -- EQUIVALENTE A PK
    nome varchar(60) NOT NULL UNIQUE,
    localizacao varchar(80) NULL
);

INSERT INTO 
    departamento
VALUES
    (NULL, 'Gerencia de TI', NULL);

INSERT INTO 
    departamento
VALUES
    (1, 'Gerencia de TI', NULL);

INSERT INTO 
    departamento
VALUES
    (2, 'Gerencia de TI', NULL);

INSERT INTO 
    departamento
VALUES
    (1, 'Gerencia de TI', 'Bloco B, Terceiro andar SL310');

INSERT INTO 
    departamento
VALUES
    (2, 'RH', 'Bloco B, Terceiro andar SL407');

SELECT * FROM departamento;