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
public class Compartimento {
    private int id;
    private String designacao;
    private String descricao;
    private String piso;
    private TipoCompartimento tipoCompartimento;

    public Compartimento(int id, String designacao, String descricao, String piso, TipoCompartimento tipoCompartimento) {
        this.id = id;
        this.designacao = designacao;
        this.descricao = descricao;
        this.piso = piso;
        this.tipoCompartimento = tipoCompartimento;
    }

    public Compartimento() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDesignacao() {
        return designacao;
    }

    public void setDesignacao(String designacao) {
        this.designacao = designacao;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getPiso() {
        return piso;
    }

    public void setPiso(String piso) {
        this.piso = piso;
    }

    public TipoCompartimento getTipoCompartimento() {
        return tipoCompartimento;
    }

    public void setTipoCompartimento(TipoCompartimento tipoCompartimento) {
        this.tipoCompartimento = tipoCompartimento;
    }

    @Override
    public String toString() {
        return "Compartimento{" + "id=" + id + ", designacao=" + designacao + 
                ", descricao=" + descricao + ", piso=" + piso +
                ", tipoCompartimento=" + tipoCompartimento + '}';
    }

    
}