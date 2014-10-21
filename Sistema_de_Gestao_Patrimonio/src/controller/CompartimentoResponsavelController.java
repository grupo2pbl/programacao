/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CompartimentoResponsavelDAO;
import java.util.ArrayList;
import java.util.List;
import model.Compartimento;
import model.CompartimentoResponsavel;
import model.Responsavel;

/**
 *
 * @author elton
 */
public class CompartimentoResponsavelController {
    private CompartimentoResponsavelDAO crdao;
    private List<CompartimentoResponsavel> lista;

    public CompartimentoResponsavelController() {
        crdao = new CompartimentoResponsavelDAO();
        lista = new ArrayList<>();
    }
    
    public boolean adiciona(int id, Compartimento compartimento, Responsavel responsavel, String dataInicio){
        try {
            CompartimentoResponsavel cr = new CompartimentoResponsavel();
            cr.setCompartimento(compartimento);
            cr.setDataInicio(dataInicio);
            cr.setResponsavel(responsavel);
            return crdao.adicionar(cr);
        } catch (Exception e) {
             System.out.println(e);
        }
        return false;
    }
    
    public List<CompartimentoResponsavel> getCompartimentoResponsavels(){
        lista = crdao.listarTodos();
        return lista;
    }
    
}