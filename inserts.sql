-- ===============================
-- 1) TABELA: usuarios
-- ===============================
INSERT INTO usuarios (nome_usuario, email, senha, telefone, cpf)
VALUES ('Usuario Teste', 'teste@teste.com', '123', '11999999999', '00000000000');

UPDATE usuarios
SET nome_usuario = 'Usuario Teste Alterado'
WHERE id = 1;

DELETE FROM usuarios WHERE id = 1; 
-- (Se quiser testar os próximos, comente este delete)


-- ===============================
-- 2) TABELA: categorias
-- ===============================
INSERT INTO categorias (nome, descricao)
VALUES ('Categoria Teste', 'Descricao de teste');

UPDATE categorias
SET descricao = 'Categoria atualizada'
WHERE id_categoria = 1;

DELETE FROM categorias WHERE id_categoria = 1;


-- ===============================
-- 3) TABELA: produtos
-- (depende de usuarios)
-- ===============================
INSERT INTO usuarios (nome_usuario, email, senha, telefone, cpf)
VALUES ('Vendedor', 'vendedor@teste.com', 'abc', '11988888888', '11111111111');

INSERT INTO produtos (nome_produto, descricao, preco, quantidade, id_vendedor)
VALUES ('Produto Teste', 'Descricao produto', 10.00, 5, 2);

UPDATE produtos
SET preco = 12.50
WHERE id_produto = 1;

DELETE FROM produtos WHERE id_produto = 1;


-- ===============================
-- 4) TABELA: anuncios
-- (depende de usuarios, categorias, produtos)
-- ===============================
INSERT INTO categorias (nome) VALUES ('Cat Anuncio');
INSERT INTO produtos (nome_produto, descricao, preco, quantidade, id_vendedor)
VALUES ('Prod Anuncio', 'teste', 20, 1, 2);

INSERT INTO anuncios (titulo, descricao, preco, estado, id_usuario, id_categoria, id_produto)
VALUES ('Anuncio Teste', 'Desc', 20.00, 'ativo', 2, 2, 2);

UPDATE anuncios
SET preco = 18.00
WHERE id_anuncio = 1;

DELETE FROM anuncios WHERE id_anuncio = 1;


-- ===============================
-- 5) TABELA: mensagens
-- (depende de usuarios)
-- ===============================
INSERT INTO mensagens (conteudo, id_remetente, id_destinatario)
VALUES ('Olá, tudo bem?', 2, 2);

UPDATE mensagens
SET estado = TRUE
WHERE id_mensagem = 1;

DELETE FROM mensagens WHERE id_mensagem = 1;


-- ===============================
-- 6) TABELA: carrinhos
-- (depende de usuarios)
-- ===============================
INSERT INTO carrinhos (id_usuario)
VALUES (2);

UPDATE carrinhos
SET id_usuario = 2
WHERE id_carrinho = 1;

DELETE FROM carrinhos WHERE id_carrinho = 1;


-- ===============================
-- 7) TABELA: carrinho_itens
-- (depende de carrinhos e produtos)
-- ===============================
INSERT INTO carrinhos (id_usuario) VALUES (2);
INSERT INTO produtos (nome_produto, descricao, preco, quantidade, id_vendedor)
VALUES ('Produto Carrinho', 'Desc', 15, 1, 2);

INSERT INTO carrinho_itens (quantidade, id_carrinho, id_produto)
VALUES (1, 2, 3);

UPDATE carrinho_itens
SET quantidade = 2
WHERE id_item = 1;

DELETE FROM carrinho_itens WHERE id_item = 1;


-- ===============================
-- 8) TABELA: notificacoes
-- (depende de usuarios)
-- ===============================
INSERT INTO notificacoes (tipo, conteudo, id_usuario)
VALUES ('mensagem', 'Você recebeu algo!', 2);

UPDATE notificacoes
SET estado = TRUE
WHERE id_notificacao = 1;

DELETE FROM notificacoes WHERE id_notificacao = 1;


-- ===============================
-- 9) TABELA: avaliacoes
-- (depende de usuarios)
-- ===============================
INSERT INTO avaliacoes (id_vendedor, id_comprador, nota, comentario)
VALUES (2, 2, 5, 'Ótimo vendedor!');

UPDATE avaliacoes
SET nota = 4
WHERE id_avaliacao = 1;

DELETE FROM avaliacoes WHERE id_avaliacao = 1;
