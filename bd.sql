DROP DATABASE IF EXISTS swapDB;
CREATE DATABASE swapDB;
USE swapDB;

-- Tabela de usuários
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_usuario VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    endereco VARCHAR(255),
    telefone CHAR(11), -- permite somente numero sem máscara
    cpf CHAR(11) UNIQUE -- permite somente numero sem máscara
);

-- Tabela de categorias
CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) UNIQUE NOT NULL,
    descricao VARCHAR(255),
    imagem VARCHAR(255)
);

-- Tabela de produtos
CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(150) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    quantidade INT NOT NULL DEFAULT 1,
    id_vendedor INT NOT NULL
);

-- Tabela de anúncios
CREATE TABLE anuncios (
    id_anuncio INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    descricao TEXT NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    estado ENUM('ativo','vendido','expirado') NOT NULL DEFAULT 'ativo',
    data_criacao DATETIME NOT NULL DEFAULT now(),
    id_usuario INT NOT NULL,
    id_categoria INT NOT NULL,
    id_produto INT NOT NULL
);

-- Tabela de mensagens
CREATE TABLE mensagens (
    id_mensagem INT AUTO_INCREMENT PRIMARY KEY,
    conteudo TEXT NOT NULL,
    data_envio DATETIME NOT NULL DEFAULT now(),
    estado BOOLEAN DEFAULT FALSE,
    id_remetente INT NOT NULL,
    id_destinatario INT NOT NULL
);

-- Tabela de carrinhos
CREATE TABLE carrinhos (
    id_carrinho INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL
);

-- Tabela de itens no carrinho
CREATE TABLE carrinho_itens (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    quantidade INT NOT NULL,
    id_carrinho INT NOT NULL,
    id_produto INT NOT NULL,
    UNIQUE (id_carrinho, id_produto)
);

-- -- Tabela de transações
-- CREATE TABLE transacoes (
--     id_transacao INT AUTO_INCREMENT PRIMARY KEY,
--     valor DECIMAL(10,2) NOT NULL,
--     tipo ENUM('pix','debito','credito','boleto') NOT NULL,
--     estado ENUM('pendente','pago','cancelado') NOT NULL DEFAULT 'pendente',
--     data DATETIME NOT NULL DEFAULT now(),
--     id_usuario INT NOT NULL,
--     id_anuncio INT NOT NULL
-- );

-- Tabela de notificações
CREATE TABLE notificacoes (
    id_notificacao INT AUTO_INCREMENT PRIMARY KEY,
    tipo ENUM('mensagem','promocao','interesse', 'outros') NOT NULL,
    conteudo TEXT NOT NULL,
    data_envio DATETIME NOT NULL DEFAULT now(),
    estado BOOLEAN DEFAULT FALSE,
    id_usuario INT NOT NULL
);

-- Tabela de negociações
-- CREATE TABLE negociacoes (
--     id_negociacao INT AUTO_INCREMENT PRIMARY KEY,
--     id_anuncio INT NOT NULL,
--     id_comprador INT NOT NULL,
--     estado ENUM('em_andamento','concluida','cancelada') NOT NULL DEFAULT 'em_andamento',
--     data_inicio DATETIME NOT NULL DEFAULT now(),
--     data_fim DATETIME
-- );

-- Tabela de avaliações
CREATE TABLE avaliacoes (
    id_avaliacao INT AUTO_INCREMENT PRIMARY KEY,
    id_vendedor INT NOT NULL,
    id_comprador INT NOT NULL,
    nota INT CHECK (nota >= 0 AND nota <= 5),
    comentario TEXT,
    data_avaliacao DATETIME NOT NULL DEFAULT now()
);

-- ==========================================
-- Adicionando constraints nomeadas
-- ==========================================

-- produtos
ALTER TABLE produtos
    ADD CONSTRAINT fk_produtos_vendedor
    FOREIGN KEY (id_vendedor) REFERENCES usuarios(id);

-- anúncios
ALTER TABLE anuncios
    ADD CONSTRAINT fk_anuncios_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
    ADD CONSTRAINT fk_anuncios_categoria FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria),
    ADD CONSTRAINT fk_anuncios_produto FOREIGN KEY (id_produto) REFERENCES produtos(id_produto);

-- mensagens
ALTER TABLE mensagens
    ADD CONSTRAINT fk_mensagens_remetente FOREIGN KEY (id_remetente) REFERENCES usuarios(id),
    ADD CONSTRAINT fk_mensagens_destinatario FOREIGN KEY (id_destinatario) REFERENCES usuarios(id);

-- carrinhos
ALTER TABLE carrinhos
    ADD CONSTRAINT fk_carrinhos_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios(id);

-- carrinho_itens
ALTER TABLE carrinho_itens
    ADD CONSTRAINT fk_carrinhoitens_carrinho FOREIGN KEY (id_carrinho) REFERENCES carrinhos(id_carrinho),
    ADD CONSTRAINT fk_carrinhoitens_produto FOREIGN KEY (id_produto) REFERENCES produtos(id_produto);

-- -- transações
-- ALTER TABLE transacoes
--     ADD CONSTRAINT fk_transacoes_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
--     ADD CONSTRAINT fk_transacoes_anuncio FOREIGN KEY (id_anuncio) REFERENCES anuncios(id_anuncio);

-- notificações
ALTER TABLE notificacoes
    ADD CONSTRAINT fk_notificacoes_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios(id);

-- -- negociações
-- ALTER TABLE negociacoes
--     ADD CONSTRAINT fk_negociacoes_anuncio FOREIGN KEY (id_anuncio) REFERENCES anuncios(id_anuncio),
--     ADD CONSTRAINT fk_negociacoes_comprador FOREIGN KEY (id_comprador) REFERENCES usuarios(id);

-- avaliações
ALTER TABLE avaliacoes
    ADD CONSTRAINT fk_avaliacoes_vendedor FOREIGN KEY (id_vendedor) REFERENCES usuarios(id),
    ADD CONSTRAINT fk_avaliacoes_comprador FOREIGN KEY (id_comprador) REFERENCES usuarios(id)