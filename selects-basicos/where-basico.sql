SELECT 
    id, nome, duracao
FROM
    aula
WHERE
    duracao <= 60
    AND duracao <> 0;

SELECT 
    id, nome, duracao, gratis
FROM
    aula
WHERE
    duracao >= 20 * 60 
    AND gratis = 1;

SELECT 
    id, nome, duracao
FROM
    curso
WHERE
    duracao >= 40 * 60 * 60 
    AND NOT gratis

SELECT * FROM aula;