package br.mackenzie.apd3.loja.service;


import br.mackenzie.apd3.loja.dto.ProdutoDTO;
import br.mackenzie.apd3.loja.dto.ProdutoRestDTO;
import br.mackenzie.apd3.loja.model.Produto;

import java.util.List;

public interface ProdutoService {

    List<Produto> listarProdutos();

    void cadastrarProduto(Produto novoProduto);

    List<ProdutoRestDTO> listarProdutosRest();

    ProdutoDTO detalharProduto(Long idProduto);
}
