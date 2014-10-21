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
public class CategoriaMaterial {
    private int id;
    private String designacao;
    private String identiTipo;

    public CategoriaMaterial(int id, String designacao, String identiTipo) {
        this.id = id;
        this.designacao = designacao;
        this.identiTipo = identiTipo;
    }
    
    public CategoriaMaterial() {
        
    }

    public int getId() {
        return id;
    }

    public String getDesignacao() {
        return designacao;
    }

    public String getIdentiTipo() {
        return identiTipo;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setDesignacao(String designacao) {
        if(designacao.equalsIgnoreCase("N"))
            designacao = "Nao-Electronico";
        else
            if(designacao.equalsIgnoreCase("E"))
                designacao = "Electronico";
        this.designacao = designacao;
    }

    public void setIdentiTipo(String identiTipo) {
        this.identiTipo = identiTipo;
    }

    @Override
    public String toString() {
        return designacao;
    }
}
