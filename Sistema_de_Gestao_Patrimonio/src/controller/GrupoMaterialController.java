
package controller;

import model.CategoriaMaterial;
import dao.GrupoMaterialDAO;
import model.GrupoMaterial;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author eunice
 */
public class GrupoMaterialController {
    private List<GrupoMaterial> grupoMaterials;
    private GrupoMaterialDAO grupoMaterialDAO;

    public GrupoMaterialController() {
        grupoMaterialDAO = new GrupoMaterialDAO();
        grupoMaterials = new ArrayList<>();
    }

    public boolean adicionar(double altura, CategoriaMaterial cm, double comprimento, String 
            cor, String modelo, double peso, double profundidade, int tempo_Vida){
        try {
            GrupoMaterial grupoMaterial = new GrupoMaterial();
            grupoMaterial.setAltura(altura);
            grupoMaterial.setCategoriaMaterial_ID(cm);
            grupoMaterial.setComprimento(comprimento);
            grupoMaterial.setCor(cor);
            grupoMaterial.setModelo(modelo);
            grupoMaterial.setPeso(peso);
            grupoMaterial.setProfundidade(profundidade);
            grupoMaterial.setTempo_Vida(tempo_Vida);
            return grupoMaterialDAO.adicionar(grupoMaterial);
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }
    
    public List<GrupoMaterial> getGrupoMaterials(){
        grupoMaterials  = grupoMaterialDAO.listarTodos();
        return grupoMaterials;
    }
    
    public GrupoMaterial procurarPorId(int id){
        GrupoMaterial cm = grupoMaterialDAO.procuraPorId(id);
        return cm;
    }
    
    public GrupoMaterial ultimo(){
        GrupoMaterial gm = grupoMaterialDAO.ultimo();
        return gm;
    }
}