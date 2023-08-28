DROP TABLE IF EXISTS categoria;

CREATE TABLE IF NOT EXISTS categoria (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(120) NOT NULL,
    categoria_pai INT UNSIGNED,
    FOREIGN KEY (categoria_pai) REFERENCES categoria(id)
);

INSERT INTO categoria (nome)
VALUES ('Web'),
       ('Mobile'),
       ('Desktop');

INSERT INTO categoria (nome, categoria_pai)
VALUES ('ReactJS', 1),
       ('Flutter', 2),
       ('ElectronJS', 3);

INSERT INTO categoria (nome, categoria_pai)
VALUES ('Redux', 4),
       ('Provider', 5),
       ('IPC', 6);

SELECT * FROM categoria;