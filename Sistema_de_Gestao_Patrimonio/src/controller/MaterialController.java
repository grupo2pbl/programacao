
package controller;

import model.Compartimento;
import model.GrupoMaterial;
import model.Material;
import dao.MaterialDAO;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author elton
 */
public class MaterialController {
    private MaterialDAO materialDAO;
    private List<Material> materials;

    public MaterialController() {
        materialDAO = new MaterialDAO();
        materials = new ArrayList<>();
    }

////    public boolean adicionar(Compartimento c, char estado, char estado_Chegada){
////        try {
////            Material material = new Material();
////            material.setCompartimento(c);
////            material.setEstado(estado);
////            material.setEstado_Chegada(estado_Chegada);
////            //material.setGrupoMaterial(gm);
////            return materialDAO.adicionar(material);
////        } catch (Exception e) {
////            System.out.println(e);
////        }
////        return false;
////    }
    
    public List<Material> getMaterials(){
        materials = materialDAO.listarTodos();
        return materials;
    }
    
    public Material procurarPorId(int id){
        Material material = materialDAO.procuraPorId(id);
        return material;
    }   
}