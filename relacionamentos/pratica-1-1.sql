DROP TABLE IF EXISTS professor;
DROP TABLE IF EXISTS vendedor;
DROP TABLE IF EXISTS funcionario;

CREATE TABLE IF NOT EXISTS funcionario (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    tipo ENUM('professor', 'vendedor') NOT NULL,
    nome VARCHAR(120) NOT NULL,
    email VARCHAR(120) NOT NULL
);

CREATE TABLE IF NOT EXISTS professor (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    bio TEXT NOT NULL,
    lattes VARCHAR(120),
    id_funcionario INT UNSIGNED NOT NULL UNIQUE,
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id)
);

CREATE TABLE IF NOT EXISTS vendedor (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    bonus INT NOT NULL,
    meta DECIMAL(7,2) NOT NULL,
    id_funcionario INT UNSIGNED NOT NULL UNIQUE,
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id)
);

INSERT INTO funcionario (tipo, nome, email)
VALUES
    ('professor', 'Fernando', 'Fernando@gmail.com')


INSERT INTO professor (lattes, bio, id_funcionario)
VALUES
    ('https://...', 'Muito bom!', 1)



INSERT INTO funcionario (tipo, nome, email)
VALUES
    ('vendedor', 'Maria', 'Maria@gmail.com')


INSERT INTO vendedor (bonus, meta, id_funcionario)
VALUES
    (25, 99999.99, 2)

SELECT * FROM funcionario;
SELECT * FROM professor;
SELECT * FROM vendedor;

SELECT 
    nome, email, lattes, bio 
FROM
    funcionario f, professor p
WHERE
    f.tipo = 'professor' AND
    f.id = p.id_funcionario;
