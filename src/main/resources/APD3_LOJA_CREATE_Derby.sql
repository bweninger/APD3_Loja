CREATE  TABLE Cliente (
idCliente BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
nome VARCHAR(50) NOT NULL ,
email VARCHAR(50) NOT NULL ,
cpf VARCHAR(11) NOT NULL ,
senha VARCHAR(50) NOT NULL ,
PRIMARY KEY (idCliente) ,
UNIQUE (email),
UNIQUE (cpf));

CREATE  TABLE Endereco (
  idEndereco BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1) ,
  logradouro VARCHAR(80) NOT NULL ,
  numero INT NOT NULL ,
  complemento VARCHAR(10) NOT NULL ,
  cep VARCHAR(8) NOT NULL ,
  idCliente BIGINT NOT NULL ,
  PRIMARY KEY (idEndereco),
  FOREIGN KEY (idCliente)
  REFERENCES cliente (idCliente)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE  TABLE Categoria (
idCategoria BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1) ,
descricao VARCHAR(20) NOT NULL ,
PRIMARY KEY (idCategoria));

CREATE  TABLE Produto (
idProduto BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1) ,
nome VARCHAR(100) NOT NULL ,
preco DECIMAL(6,2) NOT NULL ,
descricao VARCHAR(500) ,
urlFoto VARCHAR(50) ,
avaliacaoMedia INT NOT NULL ,
idCategoria BIGINT NOT NULL ,
PRIMARY KEY (idProduto) ,
FOREIGN KEY (idCategoria)
REFERENCES categoria (idCategoria)
ON DELETE NO ACTION
ON UPDATE NO ACTION);

CREATE  TABLE StatusPagamento (
idStatusPagamento BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1) ,
descricao VARCHAR(20) NOT NULL ,
PRIMARY KEY (idStatusPagamento) );

CREATE  TABLE Pagamento (
cdPagamento BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1) ,
valor DECIMAL(6,2) NOT NULL ,
idStatusPagamento BIGINT NOT NULL ,
tipoPagamento INT NOT NULL ,
PRIMARY KEY (cdPagamento),
FOREIGN KEY (idStatusPagamento )
REFERENCES statuspagamento (idStatusPagamento )
ON DELETE NO ACTION
ON UPDATE NO ACTION);

CREATE  TABLE StatusPedido (
idStatusPedido BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1) ,
descricao VARCHAR(30) NOT NULL ,
PRIMARY KEY (idStatusPedido));

CREATE TABLE pedido (
cdPedido bigint NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1000, INCREMENT BY 1) ,
idCliente bigint NOT NULL,
idEndereco bigint NOT NULL,
dataPedido date NOT NULL,
dataPrevisaoEntrega date NOT NULL,
idStatusPedido bigint NOT NULL,
cdPagamento bigint NOT NULL,
PRIMARY KEY (cdPedido),
 FOREIGN KEY (cdPagamento) REFERENCES pagamento (cdPagamento) ON DELETE NO ACTION ON UPDATE NO ACTION,
 FOREIGN KEY (idCliente) REFERENCES cliente (idCliente) ON DELETE NO ACTION ON UPDATE NO ACTION,
 FOREIGN KEY (idEndereco) REFERENCES endereco (idEndereco) ON DELETE NO ACTION ON UPDATE NO ACTION,
 FOREIGN KEY (idStatusPedido) REFERENCES statuspedido (idStatusPedido) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE item_pedido (
idProduto bigint NOT NULL,
idPedido bigint NOT NULL,
quantidade int NOT NULL,
comentario varchar(200) DEFAULT NULL,
avaliacao int DEFAULT NULL,
PRIMARY KEY (idProduto,idPedido),
 FOREIGN KEY (idPedido) REFERENCES pedido (cdPedido) ON DELETE NO ACTION ON UPDATE NO ACTION,
 FOREIGN KEY (idProduto) REFERENCES produto (idProduto) ON DELETE NO ACTION ON UPDATE NO ACTION
);

insert into categoria  (descricao) values ('Eletr�nicos');
insert into categoria  (descricao) values ('Produtos de Beleza');
insert into categoria  (descricao) values ('Filmes');
insert into categoria  (descricao) values ('M�sica');
insert into categoria  (descricao) values ('Livros');
insert into categoria  (descricao) values ('Games');
insert into categoria  (descricao) values ('Escrit�rio');

insert into produto(nome, preco, descricao, urlFoto, avaliacaoMedia, idCategoria)
values ('Box Trilogia Jogos Vorazes', 80.00, 'Katniss Everdeen � uma jovem de dezesseis anos que mora no Distrito 12 com a m�e e a irm�. Katniss sustenta sua fam�lia ca�ando ilegalmente na floresta com seu melhor amigo Gale. No dia da colheita, sua irm� mais nova � selecionada para participar dos Jogos Vorazes, mas ela se oferece para ir em seu lugar. Mas at� onde ela estar� disposta a ir para ser vitoriosa?',
null, 8, 5);
insert into produto(nome, preco, descricao, urlFoto, avaliacaoMedia, idCategoria)
values ('Motorola Novo Moto X', 1349.00, 'A Motorola inova em tecnologia trazendo a 2� gera��o do incr�vel Moto X, um aparelho com uma s�rie de novas tecnologias que j� era capaz de antecipar seus desejos e conta agora com mais intera��o com usu�rio atrav�s da voz.',
null, 7, 1);
insert into produto(nome, preco, descricao, urlFoto, avaliacaoMedia, idCategoria)
values ('Game Grand Theft Auto V - PS4', 148.90, 'O mundo aberto da Rockstar Games que gerou sucesso de cr�tica chega a uma nova gera��o, depois da espera finalmente chega o atualizado Grand Theft Auto V! Entre nas vidas de tr�s criminosos muito diferentes, Michael, Franklin e Trevor, enquanto eles arriscam tudo em uma s�rie de assaltos ousados que podem garantir o resto de suas vidas.',
null, 9, 6);
insert into produto(nome, preco, descricao, urlFoto, avaliacaoMedia, idCategoria)
values ('Blu-ray - Guardi�es da Gal�xia', 49.00, 'Da Marvel, o est�dio que trouxe franquias globais campe�s de bilheteria como Homem de Ferro, Thor, Capit�o Am�rica e Os Vingadores - The Avengers, chega uma nova equipe, os Guardi�es da Gal�xia.',
null, 7, 3);
insert into produto(nome, preco, descricao, urlFoto, avaliacaoMedia, idCategoria)
values ('Blu-ray The Rolling Stones - Ladies And Gentlemen', 69.90, '"Ladies And Gentlemen... The Rolling Stones" finalmente chega em Blu-ray. Esta lend�ria grava��o ao vivo do Rolling Stones, filmada em quatro noites no Texas durante a turn� "Exile On Main Street", de 1972, foi lan�ada nos cinemas para poucas exibi��es, em 1974, e permaneceu in�dita por longo tempo. Agora, restaurada e remasterizada, "Ladies And Gentlemen... The Rolling Stones" faz sua primeira apari��o autorizada em Blu-ray.',
null, 8, 4);















