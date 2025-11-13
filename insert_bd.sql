USE swapDB;

-- =========================
-- 1️⃣ INSERÇÕES (INSERT)
-- =========================

-- Usuários
INSERT INTO usuarios (nome_usuario, email, senha, endereco, telefone, cpf)
VALUES
('João Silva', 'joao@email.com', '123456', 'Rua das Flores, 123', '11987654321', '12345678901'),
('Maria Souza', 'maria@email.com', 'abcdef', 'Av. Central, 456', '11912345678', '98765432100');

-- Categorias
INSERT INTO categorias (nome)
VALUES
('Eletrônicos'),
('Roupas');

-- Produtos
INSERT INTO produtos (nome_produto, descricao, preco, quantidade, id_vendedor)
VALUES
('Celular XYZ', 'Smartphone novo, 128GB', 1500.00, 2, 1),
('Camiseta Polo', 'Tamanho M, cor azul', 80.00, 5, 2);

-- Anúncios
INSERT INTO anuncios (titulo, descricao, preco, estado, id_usuario, id_categoria, id_produto)
VALUES
('Vendo celular novo', 'Celular em ótimo estado', 1500.00, 'ativo', 1, 1, 1),
('Promoção de camiseta', 'Camiseta nova com desconto', 70.00, 'ativo', 2, 2, 2);

-- Mensagens
INSERT INTO mensagens (conteudo, id_remetente, id_destinatario)
VALUES
('Olá, ainda está disponível?', 2, 1),
('Sim, ainda tenho!', 1, 2);

-- Carrinhos
INSERT INTO carrinhos (id_usuario)
VALUES
(2);

-- Itens do carrinho
INSERT INTO carrinho_itens (quantidade, id_carrinho, id_produto)
VALUES
(1, 1, 1);

-- Notificações
INSERT INTO notificacoes (tipo, conteudo, id_usuario)
VALUES
('mensagem', 'Você recebeu uma nova mensagem', 1),
('promocao', 'Desconto em eletrônicos!', 2);

-- Negociações
INSERT INTO negociacoes (id_anuncio, id_comprador)
VALUES
(1, 2);

-- Avaliações
INSERT INTO avaliacoes (id_vendedor, id_comprador, nota, comentario)
VALUES
(1, 2, 5, 'Vendedor muito atencioso!');


-- =========================
-- 2️⃣ ATUALIZAÇÕES (UPDATE)
-- =========================

UPDATE usuarios
SET endereco = 'Rua Nova, 321'
WHERE id = 1;

UPDATE categorias
SET nome = 'Tecnologia'
WHERE id_categoria = 1;

UPDATE produtos
SET preco = 1400.00, quantidade = 1
WHERE id_produto = 1;

UPDATE anuncios
SET estado = 'vendido'
WHERE id_anuncio = 1;

UPDATE mensagens
SET estado = TRUE
WHERE id_mensagem = 1;

UPDATE carrinho_itens
SET quantidade = 2
WHERE id_item = 1;

UPDATE notificacoes
SET estado = TRUE
WHERE id_notificacao = 1;

UPDATE negociacoes
SET estado = 'concluida', data_fim = NOW()
WHERE id_negociacao = 1;

UPDATE avaliacoes
SET nota = 4, comentario = 'Tudo certo, mas demorou um pouco.'
WHERE id_avaliacao = 1;


-- =========================
-- 3️⃣ EXCLUSÕES (DELETE)
-- =========================

-- Ordem reversa pra respeitar FK
DELETE FROM avaliacoes WHERE id_avaliacao = 1;
DELETE FROM negociacoes WHERE id_negociacao = 1;
DELETE FROM notificacoes WHERE id_notificacao = 1 OR id_notificacao = 2;
DELETE FROM carrinho_itens WHERE id_item = 1;
DELETE FROM carrinhos WHERE id_carrinho = 1;
DELETE FROM mensagens WHERE id_mensagem IN (1, 2);
DELETE FROM anuncios WHERE id_anuncio IN (1, 2);
DELETE FROM produtos WHERE id_produto IN (1, 2);
DELETE FROM categorias WHERE id_categoria IN (1, 2);
DELETE FROM usuarios WHERE id IN (1, 2);