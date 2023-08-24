-- criar novos personagens...
INSERT INTO
    personagem (id, nome)
VALUES
    (1000, 'Carlos');


INSERT INTO
    personagem (id, nome, altura)
VALUES
    (1001, 'Daniel', 1.83);


INSERT INTO
    personagem (id, nome)
VALUES
    (1002, 'Maria'),
    (1003, 'Bia'),
    (1004, 'Ana')
;

SELECT * FROM personagem;