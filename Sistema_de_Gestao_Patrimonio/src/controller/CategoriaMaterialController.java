
package controller;

import model.CategoriaMaterial;
import dao.CategoriaMaterialDAO;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author elton
 */
public class CategoriaMaterialController {
    private CategoriaMaterialDAO cmdao;
    private List<CategoriaMaterial> materiais;

    public CategoriaMaterialController() {
        cmdao = new CategoriaMaterialDAO();
        materiais = new ArrayList<>();
    }
    
    public boolean adicionar(String designacao, String identi){
        try {
            CategoriaMaterial cm = new CategoriaMaterial();
            cm.setDesignacao(designacao);
            cm.setIdentiTipo(identi);
            return cmdao.adicionar(cm);
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }
    
    public List<CategoriaMaterial> getMateriais(){
        materiais = cmdao.listar();
        return materiais;
    }
    
    public CategoriaMaterial procurarPorId(int id){
        CategoriaMaterial cm = cmdao.procuraPorId(id);
        return cm;
    }
}
