
package controller;

import model.Fornecedor;
import model.Fornecimento;
import model.GrupoMaterial;
import dao.FornecimentoDAO;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author elton
 */
public class FornecimentoController {
    private FornecimentoDAO fdao;
    private List<Fornecimento> fornecimentos;

    public FornecimentoController() {
        fdao = new FornecimentoDAO();
        fornecimentos = new ArrayList<>();
    }
    
    public boolean adicionar(String dataAquisao, Fornecedor fornecedor, int garantia,
                            GrupoMaterial gm, double preco, int quantidade, String tipoFornecimento){
        try {
            Fornecimento fornecimento = new  Fornecimento();
            //fornecimento.setDataAquisicao(dataAquisao);
            fornecimento.setFornecedor(fornecedor);
            fornecimento.setGarantia(garantia);
            fornecimento.setGrupoMaterial(gm);
            fornecimento.setPreco(preco);
            fornecimento.setQuantidade(quantidade);
            fornecimento.setTipoFornecimento(tipoFornecimento);
            return fdao.adicionar(fornecimento);
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }
    
    
    public List<Fornecimento> geFornecimentos(){
        fornecimentos = fdao.listarTodos();
        return fornecimentos;
    }
    
    public Fornecimento ultimo(){
        Fornecimento fornecimento = fdao.ultimo();
        return fornecimento;
    }
    
    public long quantidadePorGrupo(int idGrupoMaterial){
        long qtd = fdao.quantidadePorGrupo(idGrupoMaterial);
        return qtd;
    }
    
    /*
    *   Retorna preco total de todos materiais de um certo compartimento 
    */
    public double precoMaterialPorGrupo(int idGrupoMaterial){
        double preco = fdao.precoMaterialPorGrupo(idGrupoMaterial);
        return preco;
    }
    
}
