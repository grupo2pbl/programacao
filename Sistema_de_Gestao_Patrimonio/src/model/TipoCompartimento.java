/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

/**
 *
 * @author estudante
 */
public class TipoCompartimento {
    private int id;
    private String designacao;

    public TipoCompartimento(int id, String designacao) {
        this.id = id;
        this.designacao = designacao;
    }
    
     public TipoCompartimento() {
        
    }

    public int getId() {
        return id;
    }

    public String getDesignacao() {
        return designacao;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setDesignacao(String designacao) {
        this.designacao = designacao;
    }

    @Override
    public String toString() {
        return designacao;
    }
   
    
}
