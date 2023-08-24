SELECT nome, raio * 2 as diametro FROM planeta;

SELECT nome FROM planeta WHERE nome <> 'Tatooine';

SELECT id, nome, habitado FROM planeta WHERE habitado = 0;

SELECT id, nome, habitado FROM planeta WHERE habitado = 1;

SELECT id, nome, habitado FROM planeta WHERE habitado = true;

SELECT id, nome, habitado FROM planeta WHERE habitado = false;

SELECT id, nome, habitado FROM planeta WHERE habitado;

SELECT id, nome, habitado FROM planeta WHERE !habitado;

--Par
SELECT id, nome, habitado FROM planeta WHERE id % 2 = 0;

-Impar
SELECT id, nome, habitado FROM planeta WHERE id % 2 = 1;