
package controller;

import model.Endereco;
import dao.FornecedorDAO;
import java.util.ArrayList;
import model.Fornecedor;
import java.util.List;

/**
 *
 * @author eunice
 */
public class FornecedorController {
    
    private FornecedorDAO fornecedorDAO;
    private List<Fornecedor> fornecedors;

    public FornecedorController() {
        fornecedorDAO = new FornecedorDAO();
        fornecedors = new ArrayList<>();
    }
    
    
    public boolean adicionar(String nome, Endereco endereco,String email, String tell){
        try {
            Fornecedor fornecedor = new Fornecedor();
            fornecedor.setEndereco(endereco);
            fornecedor.setNome(nome);
            fornecedor.setEmail(email);
            fornecedor.setTell(tell);
            return fornecedorDAO.adicionar(fornecedor);
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }
    
    public List<Fornecedor> getFornecedors(){
        fornecedors = fornecedorDAO.listarTodos();
        return fornecedors;
    }
    
    public Fornecedor procurarPorId(int id){
        Fornecedor fornecedor = fornecedorDAO.procuraPorId(id);
        return fornecedor;
    }   
}
