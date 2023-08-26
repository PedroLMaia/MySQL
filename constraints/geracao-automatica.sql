DROP TABLE IF EXISTS departamento;


CREATE TABLE IF NOT EXISTS departamento (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome varchar(60) NOT NULL UNIQUE,
    localizacao varchar(80) NULL
);

INSERT INTO departamento
    (nome, localizacao)
VALUES
    ('Financeiro', NULL)


INSERT INTO departamento
VALUES
    (100, 'Financeiro', 'Bloco B, Quarto Andar SL407')


INSERT INTO departamento(nome)
VALUES
    ('Terc.', 'Bloco B, Quarto Andar SL407')


SELECT * FROM departamento;