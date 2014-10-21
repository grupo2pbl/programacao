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
public class NaoElectronico {
    private int id;
    private int material_ID;

    public NaoElectronico(int id, int material_ID) {
        this.id = id;
        this.material_ID = material_ID;
    }

     public NaoElectronico() {
       
    }

    public int getId() {
        return id;
    }

    public int getIdMaterial() {
        return material_ID;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setIdMaterial(int material_ID) {
        this.material_ID = material_ID;
    }
   
       
}
