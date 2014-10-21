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
public class Capacidade {
    private Compartimento compartimento;
    private CategoriaMaterial categoria;
    private int capacidade;

    public Capacidade(Compartimento compartimento, CategoriaMaterial categoria, int capacidade) {
        this.compartimento = compartimento;
        this.categoria = categoria;
        this.capacidade = capacidade;
    }

    public Capacidade() {
    }

    
    public Compartimento getCompartimento() {
        return compartimento;
    }

    public void setCompartimento(Compartimento compartimento) {
        this.compartimento = compartimento;
    }

    public CategoriaMaterial getCategoria() {
        return categoria;
    }

    public void setCategoria(CategoriaMaterial categoria) {
        this.categoria = categoria;
    }

    public int getCapacidade() {
        return capacidade;
    }

    public void setCapacidade(int capacidade) {
        this.capacidade = capacidade;
    }

    @Override
    public String toString() {
        return "Capacidade{" + "Compartimento=" + compartimento + ", categoria="
                + categoria + ", capacidade=" + capacidade + '}';
    }  
}