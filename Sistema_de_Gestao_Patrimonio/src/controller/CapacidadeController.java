
package controller;

import model.Capacidade;
import model.CategoriaMaterial;
import model.Compartimento;
import dao.CapacidadeDAO;
import java.util.List;

/**
 *
 * @author elton
 */
public class CapacidadeController {
    private CapacidadeDAO cdao;
    private List<Capacidade> capacidades;
    
    public boolean adicionar(int quatindade, CategoriaMaterial cm, Compartimento compartimento){
        try {
            Capacidade capacidade = new Capacidade();
            capacidade.setCapacidade(quatindade);
            capacidade.setCategoria(cm);
            capacidade.setCompartimento(compartimento);
            return cdao.adicionar(capacidade);
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }
    
    public List<Capacidade> getCapacidades(){
        capacidades = cdao.listarTodos();
        return capacidades;
    }
    
    public Capacidade procurarPorId(int idCategoria, int idCompartimento){
        Capacidade capacidade = cdao.procuraPorId(idCategoria,idCompartimento);
        return capacidade;
    }   
}