SELECT
    id, nome, duracao
FROM
    aula
WHERE
    duracao <= 60
    AND duracao >= 1;


SELECT
    id, nome, duracao
FROM
    aula
WHERE
    duracao BETWEEN 1 AND 60;
