
package controller;

import dao.CategoriaMaterialDAO;
import model.Endereco;
import dao.EnderecoDAO;
import java.util.ArrayList;
import java.util.List;
import model.CategoriaMaterial;
import model.Pais;

/**
 *
 * @author elton
 */
public class EnderecoController {
    private EnderecoDAO edao;
    private List<Endereco> enderecos;

    public EnderecoController() {
        edao = new EnderecoDAO();
        enderecos =new ArrayList<>();
    }
    
    public boolean adicionar(Pais pais, String cidade, int numero, String rua){
        try {
            Endereco endereco = new Endereco();
            endereco.setCidade(cidade);
            endereco.setNumero(numero);
            endereco.setPais(pais);
            endereco.setRua(rua);
            return edao.adicionar(endereco);
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }
    
    public List<Endereco> getEnderecos(){
        enderecos = edao.listarTodos();
        return enderecos;
    }
    
    public Endereco procurarPorId(int id){
        Endereco endereco = edao.procuraPorId(id);
        return endereco;
    }
    
    public Endereco ultimo(){
        Endereco endereco = edao.ultimo();
        return endereco;
    }
}