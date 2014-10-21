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
public class Endereco {
    private int id;
    private Pais pais;
    private String cidade;
    private String rua;
    private int numero;

    public Endereco(int id, Pais pais, String cidade, String rua, int numero) {
        this.id = id;
        this.pais = pais;
        this.cidade = cidade;
        this.rua = rua;
        this.numero = numero;
    }

    public Endereco() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Pais getPais() {
        return pais;
    }

    public void setPais(Pais pais) {
        this.pais = pais;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getRua() {
        return rua;
    }

    public void setRua(String rua) {
        this.rua = rua;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    @Override
    public String toString() {
        return "Endereco{" + "id=" + id + ", pais=" + pais + ", cidade=" + cidade + ", rua=" + rua + ", numero=" + numero + '}';
    }

    
}
