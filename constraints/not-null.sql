DROP TABLE IF EXISTS apartamento;

CREATE TABLE IF NOT EXISTS apartamento (
    id int NOT NULL,
    nome varchar(60) NOT NULL,
    localizacao varchar(80) NULL
);

INSERT INTO 
    apartamento
VALUES
    (NULL, 'Gerencia de TI', 'Bloco B, Terceiro andar SL310');

INSERT INTO 
    apartamento
VALUES
    (1, NULL, 'Bloco B, Terceiro andar SL407');

INSERT INTO 
    apartamento
VALUES
    (1, 'Gerencia de TI', NULL);

INSERT INTO 
    apartamento
VALUES
    (2, 'RH', 'Bloco B, Terceiro andar SL310');


SELECT * FROM apartamento;

UPDATE apartamento SET nome = 'RH' WHERE id = 2;