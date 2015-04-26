 
CREATE DATABASE `apd3loja` /*!40100 DEFAULT CHARACTER SET utf8 */;

CREATE TABLE `categoria` (
  `idCategoria` bigint(20) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(20) NOT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `produto` (
  `idProduto` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `preco` decimal(6,2) NOT NULL,
  `descricao` varchar(500) DEFAULT NULL,
  `urlFoto` varchar(50) DEFAULT NULL,
  `avaliacaoMedia` int(11) NOT NULL,
  `idCategoria` bigint(20) NOT NULL,
  PRIMARY KEY (`idProduto`),
  KEY `produto_categoria_idx` (`idCategoria`),
  CONSTRAINT `produto_categoria` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

 CREATE TABLE `cliente` (
  `idCliente` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  PRIMARY KEY (`idCliente`,`nome`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

 
CREATE TABLE `endereco` (
  `idEndereco` bigint(20) NOT NULL AUTO_INCREMENT,
  `logradouro` varchar(80) NOT NULL,
  `numero` int(11) NOT NULL,
  `complemento` varchar(10) DEFAULT NULL,
  `cep` varchar(8) NOT NULL,
  `idCliente` bigint(20) NOT NULL,
  PRIMARY KEY (`idEndereco`),
  KEY `endereco_cliente_idx` (`idCliente`),
  CONSTRAINT `endereco_cliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

 

CREATE TABLE `pagamento` (
  `cdPagamento` bigint(20) NOT NULL AUTO_INCREMENT,
  `valor` decimal(6,2) NOT NULL,
  `idStatusPagamento` bigint(20) NOT NULL,
  `tipoPagamento` int(11) NOT NULL,
  PRIMARY KEY (`cdPagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `pedido` (
  `cdPedido` bigint(50) NOT NULL,
  `idCliente` bigint(20) NOT NULL,
  `idEndereco` bigint(20) NOT NULL,
  `dataPedido` date NOT NULL,
  `dataPrevisaoEntrega` date DEFAULT NULL,
  `idStatusPedido` bigint(20) NOT NULL,
  `cdPagamento` bigint(20) NOT NULL,
  PRIMARY KEY (`cdPedido`),
  KEY `pedido_cliente_idx` (`idCliente`),
  KEY `pedido_endereco_idx` (`idEndereco`),
  KEY `pedido_pagamento_idx` (`cdPagamento`),
  CONSTRAINT `pedido_cliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pedido_endereco` FOREIGN KEY (`idEndereco`) REFERENCES `endereco` (`idEndereco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pedido_pagamento` FOREIGN KEY (`cdPagamento`) REFERENCES `pagamento` (`cdPagamento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `item_pedido` (
  `idProduto` bigint(20) NOT NULL,
  `idPedido` bigint(50) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `comentario` varchar(200) DEFAULT NULL,
  `avaliacao` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProduto`,`idPedido`),
  KEY `item_pedido_pedido_idx` (`idPedido`),
  KEY `item_pedido_produto_idx` (`idProduto`),
  CONSTRAINT `item_pedido_pedido` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`cdPedido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `item_pedido_produto` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into categoria  (descricao) values ('Eletr�nicos');
insert into categoria  (descricao) values ('Produtos de Beleza');
insert into categoria  (descricao) values ('Filmes');
insert into categoria  (descricao) values ('M�sica');
insert into categoria  (descricao) values ('Livros');
insert into categoria  (descricao) values ('Games');
insert into categoria  (descricao) values ('Escrit�rio');

insert into produto(nome, preco, descricao, urlFoto, avaliacaoMedia, idCategoria)
values ('Box Trilogia Jogos Vorazes', 80.00, 'Katniss Everdeen � uma jovem de dezesseis anos que mora no Distrito 12 com a m�e e a irm�. Katniss sustenta sua fam�lia ca�ando ilegalmente na floresta com seu melhor amigo Gale. No dia da colheita, sua irm� mais nova � selecionada para participar dos Jogos Vorazes, mas ela se oferece para ir em seu lugar. Mas at� onde ela estar� disposta a ir para ser vitoriosa?',
'img/jogosvorazes.jpg', 8, 5);
insert into produto(nome, preco, descricao, urlFoto, avaliacaoMedia, idCategoria)
values ('Motorola Novo Moto X', 1349.00, 'A Motorola inova em tecnologia trazendo a 2� gera��o do incr�vel Moto X, um aparelho com uma s�rie de novas tecnologias que j� era capaz de antecipar seus desejos e conta agora com mais intera��o com usu�rio atrav�s da voz.',
'img/motox.jpg', 7, 1);
insert into produto(nome, preco, descricao, urlFoto, avaliacaoMedia, idCategoria)
values ('Game Grand Theft Auto V - PS4', 148.90, 'O mundo aberto da Rockstar Games que gerou sucesso de cr�tica chega a uma nova gera��o, depois da espera finalmente chega o atualizado Grand Theft Auto V!
Entre nas vidas de tr�s criminosos muito diferentes, Michael, Franklin e Trevor, enquanto eles arriscam tudo em uma s�rie de assaltos ousados que podem garantir o resto de suas vidas.',
'img/gta-5-ps4.png', 9, 6);
insert into produto(nome, preco, descricao, urlFoto, avaliacaoMedia, idCategoria)
values ('Blu-ray - Guardi�es da Gal�xia', 49.00, 'Da Marvel, o est�dio que trouxe franquias globais campe�s de bilheteria como Homem de Ferro, Thor, Capit�o Am�rica e Os Vingadores - The Avengers, chega uma nova equipe, os Guardi�es da Gal�xia.',
'img/guardioesDaGalaxia.png', 7, 3);
insert into produto(nome, preco, descricao, urlFoto, avaliacaoMedia, idCategoria)
values ('Blu-ray The Rolling Stones - Ladies And Gentlemen', 69.90, '"Ladies And Gentlemen... The Rolling Stones" finalmente chega em Blu-ray. Esta lend�ria grava��o ao vivo do Rolling Stones, filmada em quatro noites no Texas durante a turn� "Exile On Main Street", de 1972, foi lan�ada nos cinemas para poucas exibi��es, em 1974, e permaneceu in�dita por longo tempo. Agora, restaurada e remasterizada, "Ladies And Gentlemen... The Rolling Stones" faz sua primeira apari��o autorizada em Blu-ray. ',
'img/rollingStones.jpg', 8, 4);

