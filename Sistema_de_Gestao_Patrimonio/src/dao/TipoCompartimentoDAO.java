/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import model.TipoCompartimento;
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
 * @author e1000son
 */
public class TipoCompartimentoDAO {
    private Connection con;
    private PreparedStatement stmt;
    private ResultSet rs;
    
    public TipoCompartimentoDAO(){
        try {
           this.con = ConexaoBD.getConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ResponsavelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
     public boolean adicionar(TipoCompartimento tipoCompartimento){
        try {
            String sql = "Insert into TipoCompartimento(idTipoCompartimento,designacao) values (?,?)";
            
            stmt = this.con.prepareStatement(sql);
            stmt.setInt(1, tipoCompartimento.getId());
            stmt.setString(2,tipoCompartimento.getDesignacao());
                       
            stmt.execute();
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(ResponsavelDAO.class.getName()).log(Level.SEVERE, null, ex);
            //return false
        }
        return true;
    
}
     
     public List<TipoCompartimento> listarTodos(){
        String sql = "Select * from TipoCompartimento";
        try{ 
        stmt = this.con.prepareStatement(sql);
        rs = stmt.executeQuery();
       
         List<TipoCompartimento> tipoCompartimentos = new ArrayList<>();
        while (rs.next()){
            TipoCompartimento tipoCompartimento = new TipoCompartimento();
            tipoCompartimento.setId(rs.getInt("idTipoCompartimento"));
            tipoCompartimento.setDesignacao(rs.getString("designacao"));
            tipoCompartimentos.add(tipoCompartimento);
        }
        stmt.close();
        return tipoCompartimentos;
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
     
    public TipoCompartimento procuraPorId(int id){
        String sql = "SELECT * FROM TipoCompartimento WHERE idTipoCompartimento = ?";
        
        try{ 
        stmt = this.con.prepareStatement(sql);
        stmt.setInt(1, id);
        rs = stmt.executeQuery();
        
        while (rs.next()){
            if(id == rs.getInt("idTipoCompartimento")){
                TipoCompartimento tipoCompartimento = new TipoCompartimento();
                tipoCompartimento.setId(rs.getInt("idTipoCompartimento"));
                tipoCompartimento.setDesignacao(rs.getString("designacao"));
            
                return tipoCompartimento;
            }
        }
        stmt.close();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }
     
    /*public void apagar(int idTipoCompartimento) {
        try {
            String sql = "DELETE FROM TipoCompartimento WHERE idTipoCompartimento=?";
            stmt = this.con.prepareStatement(sql);
            stmt.setInt(1, idTipoCompartimento);
            stmt.execute();
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(ResponsavelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }*/
}