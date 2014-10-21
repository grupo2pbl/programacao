/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

import model.Responsavel;
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
 * @author Eunice Muzime
 */
public class ResponsavelDAO {
    private Connection con;
    private PreparedStatement stmt;
    private ResultSet rs;
    
    public ResponsavelDAO(){
         try {
           this.con = ConexaoBD.getConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ResponsavelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public boolean adicionar(Responsavel responsavel){
        try {
            String sql = "Insert into Responsavel(apelido,outrosNomes,Cargo_idCargo) values (?,?,?)";
            
            
            stmt = this.con.prepareStatement(sql);
            stmt.setString(1, responsavel.getApelido());
            stmt.setString(2, responsavel.getOutrosNomes());
            stmt.setInt(3, responsavel.getCargo_idCargo().getId());
            
            stmt.execute();
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(ResponsavelDAO.class.getName()).log(Level.SEVERE, null, ex);
            //return false;
        }
        return true;
    }
     
     public List<Responsavel> listarTodos(){
        String sql = "Select * from Responsavel";
        try{ 
        stmt = this.con.prepareStatement(sql);
        rs = stmt.executeQuery();
        CargoDAO cargoDAO = new CargoDAO();
        List<Responsavel> responsaveis = new ArrayList<>();
        while (rs.next()){
            Responsavel responsavel = new Responsavel();
            responsavel.setId(rs.getInt("idResponsavel"));
            responsavel.setApelido(rs.getString("apelido"));
            responsavel.setOutrosNomes(rs.getString("outrosNomes"));
            responsavel.setCargo_idCargo(cargoDAO.procuraPorId(rs.getInt("Cargo_idCargo")));
            responsaveis.add(responsavel);
        }
        stmt.close();
        return responsaveis;
       }catch (SQLException e) {
            throw new RuntimeException(e);
    }
}

    public Responsavel procuraPorId(int id){
        String sql = "SELECT * FROM Responsavel WHERE idResponsavel = ?";
        
        try{ 
        stmt = this.con.prepareStatement(sql);
        stmt.setInt(1, id);
        rs = stmt.executeQuery();
        CargoDAO cargoDAO =  new CargoDAO();
        while (rs.next()){
            if(id == rs.getInt("idResponsavel")){
                Responsavel responsavel = new Responsavel();
                responsavel.setId(rs.getInt("idResponsavel"));
                responsavel.setApelido(rs.getString("apelido"));
                responsavel.setOutrosNomes(rs.getString("outrosNomes"));
                responsavel.setCargo_idCargo(cargoDAO.procuraPorId(rs.getInt("Cargo_idCargo")));
            
                return responsavel;
            }
        }
        stmt.close();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }
         
    /*public void apagar(Responsavel responsavel) {
        try {
            String sql = "DELETE FROM Responsavel WHERE idResponsavel=?";
            stmt = this.con.prepareStatement(sql);
            stmt.setInt(1, responsavel.getId());
            stmt.execute();
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(ResponsavelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }*/
      
    public void actualizar(Responsavel responsavel){
        String sql = "update Responsavel set apelido=?, outrosNomes=?  where idResponsavel=?"; //morada=?
        try {
            stmt = this.con.prepareStatement(sql);
            stmt.setString(1,responsavel.getApelido());
            stmt.setString(2,responsavel.getOutrosNomes());
            stmt.setInt(3,responsavel.getId());
            stmt.execute();
            
            stmt.close();
            
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}