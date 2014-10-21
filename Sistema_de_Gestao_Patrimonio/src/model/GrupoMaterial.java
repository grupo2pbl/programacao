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
public class GrupoMaterial {
    private int id;
    private int tempo_Vida;
    private CategoriaMaterial CategoriaMaterial_ID;
    private String modelo;
    private String cor;
    private double altura;
    private double comprimento;
    private double profundidade;
    private double peso;

    public GrupoMaterial(int id, int tempo_Vida, CategoriaMaterial CategoriaMaterial_ID, String modelo, String cor, double altura, double comprimento, double profundidade, double peso) {
        this.id = id;
        this.tempo_Vida = tempo_Vida;
        this.CategoriaMaterial_ID = CategoriaMaterial_ID;
        this.modelo = modelo;
        this.cor = cor;
        this.altura = altura;
        this.comprimento = comprimento;
        this.profundidade = profundidade;
        this.peso = peso;
    }

    public GrupoMaterial() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTempo_Vida() {
        return tempo_Vida;
    }

    public void setTempo_Vida(int tempo_Vida) {
        this.tempo_Vida = tempo_Vida;
    }

    public CategoriaMaterial getCategoriaMaterial_ID() {
        return CategoriaMaterial_ID;
    }

    public void setCategoriaMaterial_ID(CategoriaMaterial CategoriaMaterial_ID) {
        this.CategoriaMaterial_ID = CategoriaMaterial_ID;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getCor() {
        return cor;
    }

    public void setCor(String cor) {
        this.cor = cor;
    }

    public double getAltura() {
        return altura;
    }

    public void setAltura(double altura) {
        this.altura = altura;
    }

    public double getComprimento() {
        return comprimento;
    }

    public void setComprimento(double comprimento) {
        this.comprimento = comprimento;
    }

    public double getProfundidade() {
        return profundidade;
    }

    public void setProfundidade(double profundidade) {
        this.profundidade = profundidade;
    }

    public double getPeso() {
        return peso;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }

    @Override
    public String toString() {
        return "GrupoMaterial{" + "id=" + id + ", tempo_Vida=" + tempo_Vida +
                ", CategoriaMaterial_ID=" + CategoriaMaterial_ID + ", modelo=" 
                + modelo + ", cor=" + cor + ", altura=" + altura + 
                ", comprimento=" + comprimento + ", profundidade=" 
                + profundidade + ", peso=" + peso + '}';
    }

    
    
}