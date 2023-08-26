DROP TABLE IF EXISTS departamento;
DROP TABLE IF EXISTS funcionario;


CREATE TABLE IF NOT EXISTS departamento (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome varchar(60) NOT NULL UNIQUE,
    localizacao varchar(80) NULL,
    qtde_funcionarios INT NOT NULL 
        CHECK (qtde_funcionarios >= 0)
        DEFAULT 0
);

CREATE TABLE IF NOT EXISTS funcionario(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    id_departamento INT NOT NULL,
    salario DECIMAL(7,2) NOT NULL DEFAULT 2000,
    estado_civil ENUM('solteiro', 'casado', 'divorciado') NOT NULL DEFAULT 'solteiro',
    FOREIGN KEY (id_departamento)
        REFERENCES departamento(id)
);

INSERT INTO
    funcionario
    (nome, id_departamento)
VALUES
    ('Rafael', 2);

INSERT INTO
    funcionario
    (nome, id_departamento)
VALUES
    ('Bruno', 2);

INSERT INTO
    funcionario
    (nome, id_departamento)
VALUES
    ('Ana', 1);

INSERT INTO
    funcionario
    (nome, id_departamento)
VALUES
    ('Carlos', 112);


SELECT * FROM departamento;
SELECT * FROM funcionario;

SELECT f.nome as func, d.nome as dep
FROM funcionario f, departamento d
WHERE f.id_departamento = d.id;