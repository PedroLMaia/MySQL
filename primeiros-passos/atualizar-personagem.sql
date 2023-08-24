SELECT * FROM personagem;

UPDATE personagem 
SET nome = 'Luke Skywalker' 
WHERE id = 1;

UPDATE personagem 
SET id = 100
WHERE id = 5
LIMIT 1;

UPDATE personagem 
SET nome = 'Leia Organa'
WHERE id = 5
LIMIT 1;

UPDATE personagem 
SET nome = 'Lider Supremo Snoke'
WHERE id = 100
LIMIT 1;