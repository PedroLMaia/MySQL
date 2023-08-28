DROP TABLE IF EXISTS ator_filme;
DROP TABLE IF EXISTS filme;
DROP TABLE IF EXISTS ator;

CREATE TABLE IF NOT EXISTS ator (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(120) NOT NULL
);

CREATE TABLE IF NOT EXISTS filme (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(120) NOT NULL
);

CREATE TABLE IF NOT EXISTS ator_filme (
    id_ator INT UNSIGNED NOT NULL,
    id_filme INT UNSIGNED NOT NULL,
    nota_atuacao DECIMAL(4,2) NOT NULL DEFAULT 0,
    PRIMARY KEY (id_ator, id_filme),
    FOREIGN KEY (id_ator) REFERENCES ator(id),
    FOREIGN KEY (id_filme) REFERENCES filme(id)
);

INSERT INTO ator (nome) VALUES ('Ana'), ('Pedro'),('Fernanda');
INSERT INTO filme (nome) VALUES ('Uma historia #1'), ('Guerra Mundial'), ('Todo mundo louco!');

INSERT INTO ator_filme (id_ator, id_filme, nota_atuacao) 
VALUES 
(1, 1, 8.2), 
(1, 2, 6.2), 
(1, 3, 9.8),
(2, 1, 5.2), 
(2, 2, 4.7), 
(2, 3, 6.1),
(3, 1, 9.2), 
(3, 2, 9.2), 
(3, 3, 9.8);

SELECT * FROM ator;
SELECT * FROM filme;
SELECT * FROM ator_filme;























INSERT INTO ator (nome) VALUES
('João'),
('Maria'),
('José'),
('Pedro'),
('Ana');

SELECT * FROM ator;

INSERT INTO filme (nome) VALUES
('Filme 1'),
('Filme 2'),
('Filme 3'),
('Filme 4'),
('Filme 5');

SELECT * FROM filme;

INSERT INTO ator_filme (id_ator, id_filme, nota_atuacao) VALUES
(1, 1, 5.0),
(2, 1, 5.0),
(3, 1, 5.0),
(4, 1, 5.0),
(5, 1, 5.0),
(1, 2, 5.0),
(2, 2, 5.0),
(3, 2, 5.0),
(4, 2, 5.0),
(5, 2, 5.0),
(1, 3, 5.0),
(2, 3, 5.0),
(3, 3, 5.0),
(4, 3, 5.0),
(5, 3, 5.0),
(1, 4, 5.0),
(2, 4, 5.0),
(3, 4, 5.0),
(4, 4, 5.0);

SELECT * FROM ator_filme


SELECT * FROM funcionario;
SELECT * FROM professor;
SELECT * FROM vendedor;

SELECT 
    ator.nome as 'Nome Ator', filme.nome as 'Nome Filme', ator_filme.nota_atuacao as 'Nota Atuacao', id_filme as 'Filme ID', id_ator as 'Ator ID'
FROM
    ator_filme, ator, filme
WHERE
    ator.id = ator_filme.id_ator AND
    filme.id = ator_filme.id_filme
ORDER BY filme.nome;