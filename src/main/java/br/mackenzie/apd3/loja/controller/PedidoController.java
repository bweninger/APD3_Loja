package br.mackenzie.apd3.loja.controller;

import br.mackenzie.apd3.loja.dto.ClienteDTO;
import br.mackenzie.apd3.loja.dto.EnderecoDTO;
import br.mackenzie.apd3.loja.dto.ItemPedidoDTO;
import br.mackenzie.apd3.loja.dto.PedidoDTO;
import br.mackenzie.apd3.loja.service.ClienteService;
import br.mackenzie.apd3.loja.service.PedidoService;
import com.fasterxml.jackson.databind.util.BeanUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping(value = "/pedidos")
@Scope("session")
public class PedidoController {

    private PedidoDTO pedidoDTO = new PedidoDTO();

    @Autowired
    private PedidoService pedidoService;

    @RequestMapping(value = "/incluirProduto", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.OK)
    public void incluirProdutoCarrinho(@RequestBody ItemPedidoDTO item) {
        this.pedidoDTO.adicionarItem(item);
    }

    @RequestMapping(value = "/fecharPedido", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.OK)
    public void fecharPedido() {
        this.pedidoDTO.fecharPedido();
    }

    @RequestMapping(value = "/selecionarPagamento/{id}", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.OK)
    public void selecionarPagamento(@PathVariable("id") Integer idTipoPagamento) {
        switch (idTipoPagamento) {
            case 1:
                this.pedidoDTO.pagarPorBoleto();
                break;
            case 2:
                this.pedidoDTO.pagarPorDebitoEmConta();
                break;
            case 3:
                this.pedidoDTO.pagarPorPagSeguro();
                break;
            default:
                throw new IllegalArgumentException("Forma de pagamento inválida");
        }
    }

    @RequestMapping(value = "/selecionarDadosEntrega/{idCliente}/{idEndereco}", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.OK)
    public void selecionarDadosEntrega(@PathVariable("idCliente") Long idCliente,
                                       @PathVariable("idEndereco") Long idEndereco) {
        ClienteDTO clienteDTO = new ClienteDTO();
        clienteDTO.setId(idCliente);
        EnderecoDTO enderecoDTO = new EnderecoDTO();
        enderecoDTO.setIdEndereco(idEndereco);
        this.pedidoDTO.incluirDadosEntrega(clienteDTO, enderecoDTO);
    }

    @RequestMapping(value = "/concluirPedido", method = RequestMethod.POST)
    @ResponseBody
    public String concluirPedido() {
        Long nroPedido = this.pedidoDTO.gerarNumeroPedido();
        this.pedidoService.cadastrarPedido(pedidoDTO);
        return "Pedido n." + nroPedido + " gerado com sucesso.";
    }
}
