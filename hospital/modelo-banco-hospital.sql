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
