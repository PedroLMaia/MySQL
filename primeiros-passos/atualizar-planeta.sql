SELECT * FROM planeta;

--Tirando duplicidade
UPDATE planeta SET id = 100 WHERE id = 600 LIMIT 1;

--Ordenando os registros na sequencia
UPDATE planeta SET id = id/100;