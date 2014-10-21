/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author elton
 */
public class CompartimentoResponsavel {
    private int id;
    private Compartimento compartimento;
    private Responsavel responsavel;
    private String dataInicio;
    private String dataFim;

    public CompartimentoResponsavel(int id, Compartimento compartimento, Responsavel responsavel, String dataInicio, String dataFim) {
        this.id = id;
        this.compartimento = compartimento;
        this.responsavel = responsavel;
        this.dataInicio = dataInicio;
        this.dataFim = dataFim;
    }

    public CompartimentoResponsavel() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Compartimento getCompartimento() {
        return compartimento;
    }

    public void setCompartimento(Compartimento compartimento) {
        this.compartimento = compartimento;
    }

    public Responsavel getResponsavel() {
        return responsavel;
    }

    public void setResponsavel(Responsavel responsavel) {
        this.responsavel = responsavel;
    }

    public String getDataInicio() {
        return dataInicio;
    }

    public void setDataInicio(String dataInicio) {
        this.dataInicio = dataInicio;
    }

    public String getDataFim() {
        return dataFim;
    }

    public void setDataFim(String dataFim) {
        this.dataFim = dataFim;
    }

    @Override
    public String toString() {
        return "CompartimentoResponsavel{" + "id=" + id + ", compartimento=" +
                compartimento + ", responsavel=" + responsavel + ", dataInicio=" + 
                dataInicio + ", dataFim=" + dataFim + '}';
    }
    
    
}
