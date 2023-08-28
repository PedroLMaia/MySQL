drop TABLE curso_stat;
drop TABLE curso;

CREATE TABLE IF NOT EXISTS curso (
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    nome varchar(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS curso_stat (
    id_curso int NOT NULL,
    nota int NOT NULL,
    qtde_alunos int NOT NULL,
    qtde_acessos int NOT NULL,
    qtde_avaliacoes int NOT NULL,
    FOREIGN KEY (id_curso) REFERENCES curso(id)
);


INSERT INTO curso (nome) VALUES ('Java'), ('C#'), ('Python'), ('PHP');

INSERT INTO curso_stat (id_curso, nota, qtde_alunos, qtde_acessos, qtde_avaliacoes) VALUES (1, 9, 100, 100, 100), (2, 8, 100, 100, 100), (3, 7, 100, 100, 100), (4, 6, 100, 100, 100);


SELECT * FROM curso;
SELECT * FROM curso_stat;


SELECT 
    id as 'Id do curso', nome as 'Nome do curso', nota as 'Nota do curso', qtde_alunos as 'Quantidade de alunos', qtde_acessos as 'Quantidade de acessos', qtde_avaliacoes as 'Quantidade de avaliações'
FROM
    curso, curso_stat
WHERE
    curso.id = curso_stat.id_curso;


-- VERSAO LEO

DROP TABLE IF EXISTS curso_stat;
DROP TABLE IF EXISTS curso;

CREATE TABLE IF NOT EXISTS curso (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(120) NOT NULL
);

CREATE TABLE IF NOT EXISTS curso_stat (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nota DECIMAL(3,2) NOT NULL DEFAULT 0,
    qtde_alunos INT UNSIGNED NOT NULL DEFAULT 0,
    qtde_acessos INT UNSIGNED NOT NULL DEFAULT 0,
    qtde_avaliacoes INT UNSIGNED NOT NULL DEFAULT 0,
    id_curso INT UNSIGNED NOT NULL UNIQUE,
    FOREIGN KEY (id_curso) REFERENCES curso(id)
);

INSERT INTO curso (nome) VALUES ('Java'), ('C#'), ('Python'), ('PHP');

INSERT INTO curso_stat (nota, qtde_alunos, qtde_acessos, qtde_avaliacoes, id_curso) VALUES
    (8.5, 100, 1000, 10000, 1),
    (9.5, 200, 2000, 20000, 2),
    (7.5, 300, 3000, 30000, 3),
    (6.5, 400, 4000, 40000, 4);

SELECT * FROM curso;
SELECT * FROM curso_stat;

SELECT 
    curso.id as 'Id do curso', nome as 'Nome do curso', nota as 'Nota do curso', qtde_alunos as 'Quantidade de alunos', qtde_acessos as 'Quantidade de acessos', qtde_avaliacoes as 'Quantidade de avaliações'
FROM
    curso, curso_stat
WHERE
    curso.id = curso_stat.id_curso;