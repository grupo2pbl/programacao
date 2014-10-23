
package dao;

import model.GrupoMaterial;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Endereco;
import model.Pais;

/**
 *
 * @author e1000son
 */
public class GrupoMaterialDAO {
    private Connection con;
    private PreparedStatement stmt;
    private ResultSet rs;
    
    public GrupoMaterialDAO(){
         try {
           this.con = ConexaoBD.getConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ResponsavelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public boolean adicionar(GrupoMaterial grupoMaterial){
        try {
            String sql = "call AddGrupoMaterial(?,?,?,?,?,?,?,?)";
                    
            stmt = this.con.prepareStatement(sql);
            stmt.setInt(1, grupoMaterial.getTempo_Vida());
            stmt.setInt(2, grupoMaterial.getCategoriaMaterial_ID().getId());
            stmt.setString(3, grupoMaterial.getModelo());
            stmt.setString(4, grupoMaterial.getCor());
            stmt.setDouble(5,grupoMaterial.getAltura());
            stmt.setDouble(6, grupoMaterial.getComprimento());
            stmt.setDouble(7, grupoMaterial.getProfundidade());
            stmt.setDouble(8, grupoMaterial.getPeso());
            
            stmt.execute();
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(ResponsavelDAO.class.getName()).log(Level.SEVERE, null, ex);
            //return false;
        }
        return true;
    }
     
    public List<GrupoMaterial> listarTodos(){
        String sql = "call ListaGrupoMaterial()";
        try{ 
        stmt = this.con.prepareStatement(sql);
        rs = stmt.executeQuery();
       
        CategoriaMaterialDAO cmdao = new CategoriaMaterialDAO();
        
        List<GrupoMaterial> gruposMaterial = new ArrayList<>();
        while (rs.next()){
            GrupoMaterial grupoMaterial = new GrupoMaterial();
            grupoMaterial.setId(rs.getInt("idGrupoMaterial"));
            grupoMaterial.setTempo_Vida(rs.getInt("tempo_vida"));
            grupoMaterial.setModelo(rs.getString("modelo"));
            grupoMaterial.setCor(rs.getString("cor"));
            grupoMaterial.setAltura(rs.getInt("altura"));
            grupoMaterial.setComprimento(rs.getInt("comprimento"));
            grupoMaterial.setProfundidade(rs.getDouble("profundidade"));
            grupoMaterial.setPeso(rs.getInt("peso"));
            grupoMaterial.setCategoriaMaterial_ID(cmdao.procuraPorId(rs.getInt("CategoriaMaterial_idCategoria")));
            gruposMaterial.add(grupoMaterial);
        }
        stmt.close();
        return gruposMaterial;
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    
    public GrupoMaterial procuraPorId(int id){
        String sql = "call ProcuraGrupoMaterial(?)";
        
        try{ 
        stmt = this.con.prepareStatement(sql);
        stmt.setInt(1, id);
        rs = stmt.executeQuery();
        
        GrupoMaterial grupoMaterial = new GrupoMaterial();
        CategoriaMaterialDAO cmdao = new CategoriaMaterialDAO();
        while (rs.next()){
            if(id == rs.getInt("idGrupoMaterial")){
                grupoMaterial.setId(rs.getInt("idGrupoMaterial"));
                grupoMaterial.setTempo_Vida(rs.getInt("tempo_vida"));
                grupoMaterial.setModelo(rs.getString("modelo"));
                grupoMaterial.setCor(rs.getString("cor"));
                grupoMaterial.setAltura(rs.getInt("altura"));
                grupoMaterial.setComprimento(rs.getInt("comprimento"));
                grupoMaterial.setProfundidade(rs.getDouble("profundidade"));
                grupoMaterial.setPeso(rs.getInt("peso"));
                grupoMaterial.setCategoriaMaterial_ID(cmdao.procuraPorId(rs.getInt("CategoriaMaterial_idCategoria")));
                return grupoMaterial;
            }
        }
        stmt.close();
        return null;
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
     
    public GrupoMaterial ultimo(){
        String sql = " call ProcuraUltimoGrupoMaterial()";
        
        GrupoMaterial grupoMaterial = new GrupoMaterial();
        CategoriaMaterialDAO cmdao = new CategoriaMaterialDAO();
        
        try{ 
            stmt = this.con.prepareStatement(sql);
            rs = stmt.executeQuery();
                
            while (rs.next()){
                grupoMaterial.setId(rs.getInt("idGrupoMaterial"));
                grupoMaterial.setTempo_Vida(rs.getInt("tempo_vida"));
                grupoMaterial.setModelo(rs.getString("modelo"));
                grupoMaterial.setCor(rs.getString("cor"));
                grupoMaterial.setAltura(rs.getInt("altura"));
                grupoMaterial.setComprimento(rs.getInt("comprimento"));
                grupoMaterial.setProfundidade(rs.getDouble("profundidade"));
                grupoMaterial.setPeso(rs.getInt("peso"));
                grupoMaterial.setCategoriaMaterial_ID(cmdao.procuraPorId(rs.getInt("CategoriaMaterial_idCategoria"))); 
                return grupoMaterial;
            }
            stmt.close();
            return null;
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }  
      /*public void apagar(GrupoMaterial grupoMaterial) {
        try {
            String sql = "DELETE FROM Responsavel WHERE idResponsavel=?";
            stmt = this.con.prepareStatement(sql);
            stmt.setInt(1, grupoMaterial.getId());
            stmt.execute();
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(ResponsavelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
      
      public void actualizarGrupoMaterial(GrupoMaterial grupoMaterial){
        String sql = "update grupoMaterial set tempo_Vida=?,modelo=?,cor=?,altura=?,comprimento=?, profundidade=?, peso=?, categoriaMaterial_idCategoria=?  where idResponsavel=?";
        try {
            stmt = this.con.prepareStatement(sql);
            stmt.setInt(1,grupoMaterial.getTempo_Vida());
            stmt.setString(2, grupoMaterial.getModelo());
            stmt.setString(3, grupoMaterial.getCor());
            stmt.setDouble(4, grupoMaterial.getAltura());
            stmt.setDouble(5, grupoMaterial.getComprimento());
            stmt.setDouble(6, grupoMaterial.getProfundidade());
            stmt.setDouble(7, grupoMaterial.getPeso());
            stmt.setInt(8, grupoMaterial.getCategoriaMaterial_ID());
            stmt.setInt(9, grupoMaterial.getId());
            
            stmt.execute();
            stmt.close();
            
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }*/
}
