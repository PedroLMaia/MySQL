SELECT 
    id, nome, duracao
FROM
    aula
WHERE
    duracao in (60, 120, 180, 240);


SELECT 
    id, nome, duracao
FROM
    aula
WHERE
    duracao = 60 
    OR duracao = 120 
    OR duracao = 180 
    OR duracao = 240