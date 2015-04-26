package br.mackenzie.apd3.loja.util;

import br.mackenzie.apd3.loja.dto.PagamentoBoletoDTO;
import br.mackenzie.apd3.loja.dto.PagamentoDTO;
import br.mackenzie.apd3.loja.dto.PagamentoDebitoContaDTO;
import br.mackenzie.apd3.loja.dto.PagamentoPagSeguroDTO;
import br.mackenzie.apd3.loja.model.Pagamento;
import br.mackenzie.apd3.loja.model.PagamentoBoleto;
import br.mackenzie.apd3.loja.model.PagamentoDebitoConta;
import br.mackenzie.apd3.loja.model.PagamentoPagSeguro;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.BeanWrapper;
import org.springframework.beans.BeanWrapperImpl;

import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Created by BWeninger on 11/04/2015.
 */
public final class DTOUtil {

    private DTOUtil() {

    }

    public static <T> List<T> converterLista(List<? extends Object> src, Class<T> clazz) {
        List<T> target = new ArrayList<>(src.size());
        for (Object objSrc : src) {
            T objTgt = BeanUtils.instantiate(clazz);
            copiarPropriedades(objSrc, objTgt, obterNomesAtributos(clazz));
            target.add(objTgt);
        }
        return target;
    }

    public static void copiarPropriedades(
            final Object source,
            final Object target,
            final Iterable<String> properties) {

        final BeanWrapper src = new BeanWrapperImpl(source);
        final BeanWrapper trg = new BeanWrapperImpl(target);

        for (final String propertyName : properties) {
            Class<?> sourceType = src.getPropertyType(propertyName);
            Class<?> targetType = trg.getPropertyType(propertyName);
            if (sourceType != null && targetType != null
                    && src.getPropertyValue(propertyName) != null) {
                if ((source instanceof List &&
                        target instanceof List)) {
                    List collectionSrc = (List) source;
                    List collectionTgt = converterLista(collectionSrc,
                            ((ParameterizedType) target.getClass().
                                    getGenericSuperclass()).getActualTypeArguments()[0].getClass());
                    trg.setPropertyValue(propertyName, collectionTgt);
                } else if (sourceType == List.class && targetType == List.class) {
                    Field declaredField = null;
                    try {
                        declaredField = target.getClass().getDeclaredField(propertyName);
                    } catch (NoSuchFieldException e) {
                        e.printStackTrace();
                    }
                    ParameterizedType genericType = (ParameterizedType) declaredField.getGenericType();
                    List listaTgt = converterLista((List) src.getPropertyValue(propertyName),
                            (Class<?>) genericType.getActualTypeArguments()[0]);
                    trg.setPropertyValue(propertyName, listaTgt);
                } else if (targetType == sourceType) {
                    trg.setPropertyValue(propertyName, src.getPropertyValue(propertyName));
                } else {
                    Object instance = null;
                    if (src.getPropertyValue(propertyName) instanceof PagamentoDTO) {
                        instance = obterInstanciaPagamento((PagamentoDTO) src.getPropertyValue(propertyName));
                    } else if (src.getPropertyValue(propertyName) instanceof Pagamento) {
                        instance = obterInstanciaPagamentoDTO((Pagamento) src.getPropertyValue(propertyName));
                    } else {
                        instance = BeanUtils.instantiate(targetType);
                    }
                    copiarPropriedades(src.getPropertyValue(propertyName), instance, obterNomesAtributos(sourceType));
                    trg.setPropertyValue(propertyName, instance);
                }
            }
        }

    }

    public static <T> Iterable<String> obterNomesAtributos(Class<T> clazz) {
        List<String> fieldNames = new ArrayList<>();
        List<Field> fieldsList = Arrays.asList(clazz.getDeclaredFields());
        for (Field field : fieldsList) {
            fieldNames.add(field.getName());
        }
        return fieldNames;
    }

    private static Pagamento obterInstanciaPagamento(PagamentoDTO dto) {
        if (dto instanceof PagamentoBoletoDTO) {
            return new PagamentoBoleto();
        } else if (dto instanceof PagamentoDebitoContaDTO) {
            return new PagamentoDebitoConta();
        } else if (dto instanceof PagamentoPagSeguroDTO) {
            return new PagamentoPagSeguro();
        } else {
            return null;
        }
    }

    private static PagamentoDTO obterInstanciaPagamentoDTO(Pagamento dto) {
        if (dto instanceof PagamentoBoleto) {
            return new PagamentoBoletoDTO();
        } else if (dto instanceof PagamentoDebitoConta) {
            return new PagamentoDebitoContaDTO();
        } else if (dto instanceof PagamentoPagSeguro) {
            return new PagamentoPagSeguroDTO();
        } else {
            return null;
        }
    }
}
