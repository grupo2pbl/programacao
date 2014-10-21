
package controller;

import dao.TipoCompartimentoDAO;
import model.TipoCompartimento;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author e1000son
 */
public class TipoCompartimentoController {
    
    private TipoCompartimentoDAO tipoCompartimentoDAO ;
    private List<TipoCompartimento> tipoCompartimentos;
    
    public TipoCompartimentoController(){
        tipoCompartimentoDAO = new TipoCompartimentoDAO();
        tipoCompartimentos = new ArrayList<>();
    }

    public boolean adicionar(String designacao){
        try {
            TipoCompartimento compartimento = new TipoCompartimento();
            compartimento.setDesignacao(designacao);
            return tipoCompartimentoDAO.adicionar(compartimento);
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }
    
    public List<TipoCompartimento> getTipoCompartimentos(){
        tipoCompartimentos  = tipoCompartimentoDAO.listarTodos();
        return tipoCompartimentos;
    }
    
    public TipoCompartimento procurarPorId(int id){
        TipoCompartimento compartimento = tipoCompartimentoDAO.procuraPorId(id);
        return compartimento;
    }
}
