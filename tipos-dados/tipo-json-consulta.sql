SELECT 
    sumario_diciplina
FROM aluno;

SELECT 
    json_extract(
        sumario_diciplina, "$.semestres[0].disciplinas[1].mediaFinal"
    )
FROM aluno;

SELECT * 
FROM aluno 
WHERE 
    json_contains(
        sumario_diciplina, 
        '{"nome": "Calculo 1"}', 
        "$.semestres[0].disciplinas"
    );