SELECT * FROM planeta;

--Pares
SELECT * FROM planeta WHERE id % 2 = 0;
SELECT * FROM planeta WHERE !(id % 2);
SELECT * FROM planeta WHERE NOT (id % 2);

--Impares
SELECT * FROM planeta WHERE id % 2 = 1;
SELECT * FROM planeta WHERE id % 2;

DELETE FROM planeta WHERE id % 2 = 1;