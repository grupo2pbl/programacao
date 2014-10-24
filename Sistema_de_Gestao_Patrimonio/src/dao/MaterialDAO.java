/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import model.Material;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author elton
 */
public class MaterialDAO {
    private Connection con;
    private PreparedStatement stmt;
    private ResultSet rs;
    
    public MaterialDAO(){
         try {
           this.con = ConexaoBD.getConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ResponsavelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
         
    }
    
    public boolean adicionar(Material material,int quantidade){
        try {
//            String sql = "Insert into Material(estado,Compartimento_idCompartimento"
//                    + ",GrupoMaterial_idGrupoMaterial,estadoChegada) "
//                    + "values (?,?,?,?)"; SET @p0='1'; SET @p1='1'; SET @p2='1',
//            ; SET @p3='1'; SET @p4='2'; CALL `geraMaterial`(@p0, @p1, @p2, @p3, @p4);
            
            FornecimentoDAO fornecimentoDAO = new FornecimentoDAO();
            GrupoMaterialDAO grupoMaterialDAO = new GrupoMaterialDAO();
            
            String sql = "CALL geraMaterial(?,?)";
            stmt = this.con.prepareStatement(sql);
            
            stmt.setInt(1, grupoMaterialDAO.ultimo().getId());
            stmt.setInt(2, quantidade);
            
            stmt.execute();
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(CompartimentoDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }    
        return true;
    }
    
    public List<Material> listarTodos(){
        String sql = "Select idMaterial,estado,Compartimento_idCompartimento"
                    + ",GrupoMaterial_idGrupoMaterial,estadoChegada from Material";
        try{ 
        stmt = this.con.prepareStatement(sql);
        rs = stmt.executeQuery();
        
        GrupoMaterialDAO gmdao = new GrupoMaterialDAO();
        CompartimentoDAO cdao = new CompartimentoDAO();
        
        List<Material> lista = new ArrayList<>();
        while (rs.next()){
            Material material = new Material();
            material.setId(rs.getInt("idMaterial"));
            material.setGrupoMaterial(gmdao.procuraPorId(rs.getInt("GrupoMaterial_idGrupoMaterial")));
            material.setCompartimento((cdao.procuraPorId(rs.getInt("Compartimento_idCompartimento"))));
            material.setEstado_Chegada(rs.getString("estadoChegada").charAt(0));
            lista.add(material);
        }
        stmt.close();
        return lista;
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    
    public Material procuraPorId(int id){
        String sql = "SELECT * FROM Material WHERE idMaterial = ?";
        
        try{ 
        stmt = this.con.prepareStatement(sql);
        stmt.setInt(1, id);
        rs = stmt.executeQuery();
        
        GrupoMaterialDAO gmdao = new GrupoMaterialDAO();
        CompartimentoDAO cdao = new CompartimentoDAO();
        
        while (rs.next()){
            if(id == rs.getInt("idMaterial")){
                Material material = new Material();
                material.setId(rs.getInt("idMaterial"));
                material.setGrupoMaterial(gmdao.procuraPorId(rs.getInt("GrupoMaterial_idGrupoMaterial")));
                material.setCompartimento((cdao.procuraPorId(rs.getInt("Compartimento_idCompartimento"))));
                material.setEstado_Chegada(rs.getString("estadoChegada").charAt(0));
                return material;
            }
        }
        stmt.close();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }
}