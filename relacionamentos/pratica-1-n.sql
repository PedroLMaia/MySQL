DROP TABLE IF EXISTS postagem;
DROP TABLE IF EXISTS usuario;

CREATE TABLE IF NOT EXISTS usuario (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(120) NOT NULL,
    email VARCHAR(120) NOT NULL
);

CREATE TABLE IF NOT EXISTS postagem (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(120) NOT NULL,
    conteudo TEXT NOT NULL,
    id_usuario INT UNSIGNED,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);

INSERT INTO usuario
VALUES
    (1, 'Thiago', 'Thiago@gamil.com'),
    (2, 'Maria', 'Maria@gamil.com'),
    (3, 'João', 'João@gamil.com');

SELECT * FROM usuario;

INSERT INTO postagem
VALUES
    (1, 'Título 1', 'Conteúdo 1', 3),
    (2, 'Título 2', 'Conteúdo 2', 1),
    (3, 'Título 3', 'Conteúdo 3', 2);

SELECT * FROM postagem;
