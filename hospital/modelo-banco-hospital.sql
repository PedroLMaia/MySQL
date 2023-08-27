CREATE SCHEMA IF NOT EXISTS hospital;

DROP SCHEMA IF EXISTS hospital;

DROP TABLE IF EXISTS manutencao;

CREATE TABLE IF NOT EXISTS manutencao (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome_equipamento VARCHAR(90) NOT NULL,
    numero_tombamento INT NOT NULL,
    data_saida DATE NOT NULL,
    data_retorno DATE NOT NULL,
    tipo_manutencao VARCHAR(90) NOT NULL,
    nome_funcionario_responsavel VARCHAR(90) NOT NULL,
    problema_apresentado VARCHAR(90) NOT NULL,
    descricao_servico VARCHAR(90) NOT NULL,
    nome_empresa_ou_tecnico VARCHAR(90) NOT NULL,
    data_proxima_manutencao DATE
);

CREATE TABLE IF NOT EXISTS manutencao (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome_equipamento VARCHAR(90) NOT NULL,
    numero_tombamento INT NOT NULL,
    data_saida DATE NOT NULL,
    data_retorno DATE NOT NULL,
    nome_funcionario_responsavel VARCHAR(90) NOT NULL,
    problema_apresentado VARCHAR(90) NOT NULL,
    descricao_servico VARCHAR(90) NOT NULL,
    nome_empresa_ou_tecnico VARCHAR(90) NOT NULL,
    data_proxima_manutencao DATE,
    tipo_manutencao TINYINT NOT NULL,
    CONSTRAINT chk_tipo_manutencao CHECK (tipo_manutencao IN (0, 1))
);


CREATE TRIGGER calculate_next_maintenance
BEFORE INSERT ON manutencao
FOR EACH ROW
BEGIN
    CASE
        WHEN NEW.nome_equipamento = 'Equipamento A' THEN
            SET NEW.data_proxima_manutencao = DATE_ADD(NEW.data_saida, INTERVAL 6 MONTH);
        WHEN NEW.nome_equipamento = 'Equipamento B' THEN
            SET NEW.data_proxima_manutencao = DATE_ADD(NEW.data_saida, INTERVAL 1 YEAR);
        WHEN NEW.nome_equipamento = 'Equipamento C' THEN
            SET NEW.data_proxima_manutencao = DATE_ADD(NEW.data_saida, INTERVAL 2 YEAR);
    END CASE;
END;

DROP TRIGGER calculate_next_maintenance;

INSERT INTO manutencao
(
    nome_equipamento,
    numero_tombamento,
    data_saida,
    data_retorno,
    nome_funcionario_responsavel,
    problema_apresentado,
    descricao_servico,
    nome_empresa_ou_tecnico,
    tipo_manutencao
) VALUES (
    'Equipamento A',
    1,
    '2022-01-01',
    '2022-01-02',
    'João da Silva',
    'Não liga',
    'Substituição da fonte de alimentação',
    'TecnicoX da EmpresaY',
    1
);

INSERT INTO manutencao(
    nome_equipamento,
    numero_tombamento,
    data_saida,
    data_retorno,
    nome_funcionario_responsavel,
    problema_apresentado,
    descricao_servico,
    nome_empresa_ou_tecnico,
    tipo_manutencao
) VALUES (
    'Equipamento B',
    2,
    '2022-01-01',
    '2022-01-02',
    'Silva',
    'Liga',
    'Substituição alimentação',
    'TecnicotY',
    0
);

INSERT INTO manutencao(
    nome_equipamento,
    numero_tombamento,
    data_saida,
    data_retorno,
    nome_funcionario_responsavel,
    problema_apresentado,
    descricao_servico,
    nome_empresa_ou_tecnico,
    tipo_manutencao
) VALUES (
    'Equipamento C',
    3,
    '2022-01-01',
    '2022-01-02',
    'João',
    'Não',
    'Substituição fonte',
    'TecnicoX da EmpresaY',
    1
);

SELECT
    nome_equipamento AS "Nome Equipamento",
    numero_tombamento AS "Numero Tombamento",
    DATE_FORMAT(data_saida, '%d/%m/%Y') AS "Data Saida",
    DATE_FORMAT(data_retorno, '%d/%m/%Y') AS "Data Retorno",
    nome_funcionario_responsavel AS "Funcionario Responsavel",
    problema_apresentado AS "Problema",
    descricao_servico AS "Servico",
    nome_empresa_ou_tecnico AS "Empresa/Tecnico",
    DATE_FORMAT(data_proxima_manutencao, '%d/%m/%Y') AS "Proxima Manutencao",
    CASE
        WHEN tipo_manutencao = 0 THEN 'Preventiva'
        WHEN tipo_manutencao = 1 THEN 'Corretiva'
    END AS "Tipo Manutencao"
FROM manutencao;























-- Criação da Tabela de Categorias
CREATE TABLE IF NOT EXISTS categoria (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(120) NOT NULL,
    periodicidade_meses INT NOT NULL
);

-- Criação da Tabela de Equipamentos
CREATE TABLE IF NOT EXISTS equipamento (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(90) NOT NULL,
    numero_tombamento INT NOT NULL,
    data_aquisicao DATE NOT NULL,
    numero_nota_fiscal VARCHAR(50) NOT NULL,
    id_categoria INT UNSIGNED,
    numero_manutencoes INT DEFAULT 0,
    ultima_manutencao_bem_sucedida BOOLEAN,
    data_proxima_manutencao DATE, -- Adicionei o campo aqui
    FOREIGN KEY (id_categoria) REFERENCES categoria(id)
);

-- Criação da Tabela de Manutenção
CREATE TABLE IF NOT EXISTS manutencao (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    id_equipamento INT UNSIGNED NOT NULL,
    data_saida DATE NOT NULL,
    data_retorno DATE NOT NULL,
    tipo_manutencao VARCHAR(90) NOT NULL,
    nome_funcionario_responsavel VARCHAR(90) NOT NULL,
    problema_apresentado TEXT NOT NULL,
    descricao_servico TEXT NOT NULL,
    nome_empresa_ou_tecnico VARCHAR(90) NOT NULL,
    data_proxima_manutencao DATE,
    FOREIGN KEY (id_equipamento) REFERENCES equipamento(id)
);

-- Inserção de Dados de Exemplo na Tabela de Categorias
INSERT INTO categoria (nome, periodicidade_meses)
VALUES
    ('Categoria A', 6),
    ('Categoria B', 12),
    ('Categoria C', 24);

-- Inserção de Dados de Exemplo na Tabela de Equipamentos
INSERT INTO equipamento (nome, numero_tombamento, data_aquisicao, numero_nota_fiscal, id_categoria, data_proxima_manutencao) -- Adicionei o campo aqui
VALUES
    ('Equipamento 1', 12345, '2022-01-01', 'NF123', 1, '2023-02-01'), -- Adicionei a data aqui
    ('Equipamento 2', 54321, '2020-05-15', 'NF456', 2, '2023-05-15'); -- Adicionei a data aqui

-- Inserção de Dados de Exemplo na Tabela de Manutenção
INSERT INTO manutencao (id_equipamento, data_saida, data_retorno, tipo_manutencao, nome_funcionario_responsavel, problema_apresentado, descricao_servico, nome_empresa_ou_tecnico, data_proxima_manutencao)
VALUES
    (1, '2023-08-01', '2023-08-10', 'Manutenção Preventiva', 'João Silva', 'Barulho estranho', 'Realizada lubrificação', 'Manutenções Ltda.', '2023-02-01'),
    (2, '2023-07-20', '2023-07-25', 'Manutenção Corretiva', 'Maria Souza', 'Não liga', 'Substituição do cabo de energia', 'Técnico André', '2023-05-15');

-- Atualização do campo de número de manutenções na tabela de equipamentos
UPDATE equipamento e
SET numero_manutencoes = (SELECT COUNT(*) FROM manutencao m WHERE m.id_equipamento = e.id);

-- Atualização manual do campo de última manutenção bem-sucedida
UPDATE equipamento
SET ultima_manutencao_bem_sucedida = TRUE
WHERE id = 1;

-- Seleção de todos os equipamentos com os novos campos e datas formatadas
SELECT
    id,
    nome,
    numero_tombamento,
    DATE_FORMAT(data_aquisicao, '%d/%m/%Y') AS data_aquisicao_formatada,
    numero_nota_fiscal,
    id_categoria,
    numero_manutencoes,
    ultima_manutencao_bem_sucedida,
    DATE_FORMAT(data_proxima_manutencao, '%d/%m/%Y') AS data_proxima_manutencao_formatada
FROM equipamento;