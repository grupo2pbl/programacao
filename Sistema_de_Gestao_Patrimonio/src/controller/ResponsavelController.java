
package controller;

import model.Cargo;
import dao.ResponsavelDAO;
import model.Responsavel;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author e1000son
 */
public class ResponsavelController {
       
    private ResponsavelDAO responsavelDAO;
    private List<Responsavel> responsavels;

    public ResponsavelController() {
        responsavelDAO = new ResponsavelDAO();
        responsavels = new ArrayList<>();
    }
    
    public boolean adicionar(String apelido, Cargo cargo, String outrosNomes){
        try {
            Responsavel responsavel = new Responsavel();
            responsavel.setApelido(apelido);
            responsavel.setCargo_idCargo(cargo);
            responsavel.setOutrosNomes(outrosNomes);
            return responsavelDAO.adicionar(responsavel);
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }
    
    public List<Responsavel> getResponsavels(){
        responsavels = responsavelDAO.listarTodos();
        return responsavels;
    }
    
    public Responsavel procurarPorId(int id){
        Responsavel responsavel = responsavelDAO.procuraPorId(id);
        return responsavel;
    }   
}
