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
    id_vendedor INT UNSIGNED NOT NULL UNIQUE,
    FOREIGN KEY (id_vendedor) REFERENCES funcionario(id)
);