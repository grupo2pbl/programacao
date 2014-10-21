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
public class Material {
    private int id;
    private char estado;
    private char estado_Chegada;
    private Compartimento compartimento;
    private GrupoMaterial grupoMaterial;

    public Material() {
    }

    public Material(int id, char estado, char estado_Chegada, Compartimento compartimento, GrupoMaterial grupoMaterial) {
        this.id = id;
        this.estado = estado;
        this.estado_Chegada = estado_Chegada;
        this.compartimento = compartimento;
        this.grupoMaterial = grupoMaterial;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public char getEstado() {
        return estado;
    }

    public void setEstado(char estado) {
        this.estado = estado;
    }

    public char getEstado_Chegada() {
        return estado_Chegada;
    }

    public void setEstado_Chegada(char estado_Chegada) {
        this.estado_Chegada = estado_Chegada;
    }

    public Compartimento getCompartimento() {
        return compartimento;
    }

    public void setCompartimento(Compartimento compartimento) {
        this.compartimento = compartimento;
    }

    public GrupoMaterial getGrupoMaterial() {
        return grupoMaterial;
    }

    public void setGrupoMaterial(GrupoMaterial grupoMaterial) {
        this.grupoMaterial = grupoMaterial;
    }

    @Override
    public String toString() {
        return "Material{" + "id=" + id + ", estado=" + estado + ", estado_Chegada=" + estado_Chegada + ", compartimento=" + compartimento + ", grupoMaterial=" + grupoMaterial + '}';
    }
}
