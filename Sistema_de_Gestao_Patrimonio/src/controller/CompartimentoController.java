
package controller;

import dao.CompartimentoDAO;
import model.Compartimento;
import model.TipoCompartimento;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author e1000son
 */
public class CompartimentoController {
    private List<Compartimento> compartimentos;
    private CompartimentoDAO cdao;

    public CompartimentoController() {
        compartimentos = new ArrayList<>();
        cdao = new CompartimentoDAO();
    }

    public boolean adicionar(String designacao, String descricao, String piso, TipoCompartimento tc){
        
        try {
            Compartimento compartimento= new Compartimento();
            compartimento.setDesignacao(designacao);
            compartimento.setDescricao(descricao);
            compartimento.setPiso(piso);
            compartimento.setTipoCompartimento(tc);
            return cdao.adicionar(compartimento);
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }
    
    public List<Compartimento> geCompartimentos(){
        compartimentos = cdao.listarTodos();
        return compartimentos;
    }
    
    public Compartimento procurarPorId(int id){
        Compartimento cm = cdao.procuraPorId(id);
        return cm;
    }
    
    public Compartimento ultimo(){
        Compartimento cm = cdao.ultimo();
        return cm;
    }
}