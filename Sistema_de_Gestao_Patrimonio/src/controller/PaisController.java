/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.PaisDAO;
import java.util.ArrayList;
import java.util.List;
import model.Cargo;
import model.Pais;

/**
 *
 * @author elton
 */
public class PaisController {
    private PaisDAO pdao;
    private List<Pais> lista;

    public PaisController() {
        pdao = new PaisDAO();
        lista = new ArrayList<>();
    }
        
    public List<Pais> getPaises(){
        lista = pdao.listarTodos();
        return lista;
    }
    
    public Pais procurarPorId(int id){
        Pais pais = pdao.procuraPorId(id);
        return pais;
    }
}
