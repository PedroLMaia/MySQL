SELECT
    id, nome, duracao
FROM
    aula
WHERE
    duracao <= 55
    AND duracao >= 39
    AND nome = 'Conclusão do Módulo'; 


SELECT
    id, nome, duracao
FROM
    aula
WHERE
    duracao BETWEEN 39 AND 55 AND nome = 'Conclusão do Módulo';
