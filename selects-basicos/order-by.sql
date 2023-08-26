SELECT 
    id, nome, duracao
FROM
    aula
WHERE
    duracao in (60, 120, 180, 240)
ORDER BY
    duracao;

SELECT 
    nome, duracao
FROM
    aula
WHERE
    duracao in (60, 120, 180, 240)
ORDER BY
    duracao DESC, id ASC;
