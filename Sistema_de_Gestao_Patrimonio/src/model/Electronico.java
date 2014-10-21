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
public class Electronico {
    private int id;
    private int material_ID;
    private double energia;

    public Electronico(int id, int material_ID, double energia) {
        this.id = id;
        this.material_ID = material_ID;
        this.energia = energia;
    }
    
    public Electronico() {
        
    }

    public int getId() {
        return id;
    }

    public int getIdMaterial() {
        return material_ID;
    }

    public double getEnergia() {
        return energia;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setIdMaterial(int material_ID) {
        this.material_ID = material_ID;
    }

    public void setEnergia(double energia) {
        this.energia = energia;
    }

}
