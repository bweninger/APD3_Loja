package br.mackenzie.apd3.loja.dto;

import br.mackenzie.apd3.loja.model.StatusPagamento;

import java.math.BigDecimal;

/**
 * Created by BWeninger on 21/04/2015.
 */
public class PagamentoDebitoContaDTO extends PagamentoDTO {

    public PagamentoDebitoContaDTO(BigDecimal valor, StatusPagamento status) {
        super(valor, status);
    }

    public PagamentoDebitoContaDTO() {
    }

}
