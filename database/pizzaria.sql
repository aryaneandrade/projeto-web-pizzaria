-- ===========================================================
-- BANCO DE DADOS: pizzaria
-- Autor: Aryane Andrade
-- Descrição: Estrutura do banco de dados para o sistema de pedidos de pizzaria
-- ===========================================================

CREATE DATABASE IF NOT EXISTS pizzaria CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE pizzaria;

-- ===========================================================
-- TABELA: bordas
-- ===========================================================
CREATE TABLE bordas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ===========================================================
-- TABELA: massas
-- ===========================================================
CREATE TABLE massas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ===========================================================
-- TABELA: sabores
-- ===========================================================
CREATE TABLE sabores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ===========================================================
-- TABELA: pizzas
-- ===========================================================
CREATE TABLE pizzas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    borda_id INT NOT NULL,
    massa_id INT NOT NULL,
    FOREIGN KEY (borda_id) REFERENCES bordas(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (massa_id) REFERENCES massas(id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ===========================================================
-- TABELA: pizza_sabor
-- Relação N:N entre pizzas e sabores
-- ===========================================================
CREATE TABLE pizza_sabor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pizza_id INT NOT NULL,
    sabor_id INT NOT NULL,
    FOREIGN KEY (pizza_id) REFERENCES pizzas(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (sabor_id) REFERENCES sabores(id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ===========================================================
-- TABELA: status
-- ===========================================================
CREATE TABLE status (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ===========================================================
-- TABELA: pedidos
-- ===========================================================
CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pizza_id INT NOT NULL,
    status_id INT NOT NULL,
    data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (pizza_id) REFERENCES pizzas(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (status_id) REFERENCES status(id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ===========================================================
-- INSERÇÃO DE DADOS INICIAIS
-- ===========================================================

-- Bordas
INSERT INTO bordas (tipo) VALUES
('Tradicional'),
('Recheada com Catupiry'),
('Recheada com Cheddar'),
('Recheada com Chocolate');

-- Massas
INSERT INTO massas (tipo) VALUES
('Massa Comum'),
('Massa Integral'),
('Massa Temperada');

-- Sabores
INSERT INTO sabores (nome) VALUES
('Calabresa'),
('Mussarela'),
('Portuguesa'),
('Frango com Catupiry'),
('Quatro Queijos'),
('Marguerita'),
('Pepperoni');

-- Status dos pedidos
INSERT INTO status (nome) VALUES
('Em produção'),
('A caminho'),
('Entregue');

-- ===========================================================
-- EXEMPLO DE DADOS (para teste rápido)
-- ===========================================================
INSERT INTO pizzas (borda_id, massa_id) VALUES (1, 1);
INSERT INTO pizza_sabor (pizza_id, sabor_id) VALUES (1, 1), (1, 2);
INSERT INTO pedidos (pizza_id, status_id) VALUES (1, 1);

-- ===========================================================
-- FIM DO ARQUIVO
-- ===========================================================
