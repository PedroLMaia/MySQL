SELECT * FROM personagem;
SELECT nome, id, destaque FROM personagem;
SELECT nome, id FROM personagem WHERE id = 5;
SELECT * FROM personagem WHERE nome = 'Luke Skaywalker';
SELECT nome, altura FROM personagem WHERE nome = 'Chewbacca';
SELECT nome, altura FROM personagem WHERE BINARY nome = 'Chewbacca';
SELECT altura * 2 as dobro FROM personagem;

-- Selects com WHERE 
SELECT * FROM personagem WHERE 0;
SELECT * FROM personagem WHERE 1;
SELECT * FROM personagem WHERE true;
SELECT * FROM personagem WHERE false;