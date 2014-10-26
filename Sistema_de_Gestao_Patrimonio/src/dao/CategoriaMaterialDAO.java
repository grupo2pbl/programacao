/*
*ffffff
 */
package dao;

import model.CategoriaMaterial;
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
public class CategoriaMaterialDAO {
    private Connection con;
    private PreparedStatement stmt;
    private ResultSet rs;
    
    public CategoriaMaterialDAO(){
         try {
           this.con = ConexaoBD.getConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ResponsavelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public boolean adicionar(CategoriaMaterial cm){
        try {
            String sql = "call AddCategoriaMaterial(?,?)";
            stmt = this.con.prepareStatement(sql);
            stmt.setString(1,cm.getDesignacao());
            stmt.setString(2,cm.getIdentiTipo());         
            
            stmt.execute();
            stmt.close();
        } catch (SQLException ex) {
            //Logger.getLogger(CompartimentoDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return true;
    }
    
    
    public List<CategoriaMaterial> listar(){
        String sql = "call ListaCategoriaMaterial()";
        try{ 
        stmt = this.con.prepareStatement(sql);
        rs = stmt.executeQuery();
       
        List<CategoriaMaterial> cms = new ArrayList<>();
        while (rs.next()){
            CategoriaMaterial cm = new CategoriaMaterial();
            cm.setId(rs.getInt("idCategoria"));
            cm.setDesignacao(rs.getString("designacao"));
            cm.setIdentiTipo(rs.getString("identiTipo"));
            cms.add(cm);
        }
        
        stmt.close();
        return cms;
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    
    public CategoriaMaterial procuraPorId(int id){
        String sql = "call ProcuraCategoriaMaterial(?)";
        
        try{ 
        stmt = this.con.prepareStatement(sql);
        stmt.setInt(1, id);
        rs = stmt.executeQuery();
        
        while (rs.next()){
            if(id == rs.getInt("idCategoria")){
                CategoriaMaterial cm = new CategoriaMaterial();
                cm.setId(rs.getInt("idCategoria"));
                cm.setDesignacao(rs.getString("designacao"));
                cm.setIdentiTipo(rs.getString("identiTipo"));
                return cm;
            }
        }
        stmt.close();
        return null;
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    
//    public CategoriaMaterial ultimo(){
//        
//    }
}
