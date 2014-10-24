/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import model.Compartimento;
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
public class CompartimentoDAO {
    private Connection con;
    private PreparedStatement stmt;
    private ResultSet rs;
    
    public CompartimentoDAO(){
         try {
           this.con = ConexaoBD.getConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ResponsavelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
         
    }
    
    public boolean adicionar(Compartimento compartimento ){
        try {
            String sql = "Insert into Compartimento(designacao,"
                    + "tipoCompartimento_idTipoCompartimento,"
                    + "descricao) values (?,?,?)";
            stmt = this.con.prepareStatement(sql);
            stmt.setString(1,compartimento.getDesignacao());
            stmt.setInt(2, compartimento.getTipoCompartimento().getId());
            stmt.setString(3,compartimento.getDescricao());
            
            stmt.execute();
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(CompartimentoDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } 
        return true;
    }
    
    public List<Compartimento> listarTodos(){
        String sql = "Select * from Compartimento";
        try{ 
        stmt = this.con.prepareStatement(sql);
        rs = stmt.executeQuery();
        
        TipoCompartimentoDAO tcdao = new TipoCompartimentoDAO();
        ResponsavelDAO rdao = new ResponsavelDAO();
        
        List<Compartimento> compartimentos = new ArrayList<>();
        while (rs.next()){
            Compartimento compartimento = new Compartimento();
            compartimento.setId(rs.getInt("idCompartimento"));
            compartimento.setDesignacao(rs.getString("designacao"));
            compartimento.setTipoCompartimento(tcdao.procuraPorId(rs.getInt("tipoCompartimento_idTipoCompartimento")));
            compartimento.setDescricao(rs.getString("descricao"));
            compartimentos.add(compartimento);
        }
        stmt.close();
        return compartimentos;
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    
    public Compartimento procuraPorId(int id){
        String sql = "SELECT * FROM Compartimento WHERE idCompartimento = ?";
        
        try{ 
        stmt = this.con.prepareStatement(sql);
        stmt.setInt(1, id);
        rs = stmt.executeQuery();
        
        TipoCompartimentoDAO tcdao = new TipoCompartimentoDAO();
        ResponsavelDAO rdao = new ResponsavelDAO();
        
        while (rs.next()){
            if(id == rs.getInt("idCompartimento")){
                Compartimento compartimento = new Compartimento();
                compartimento.setId(rs.getInt("idCompartimento"));
                compartimento.setDesignacao(rs.getString("designacao"));
                compartimento.setTipoCompartimento(tcdao.procuraPorId(rs.getInt("tipoCompartimento_idTipoCompartimento")));
                compartimento.setDescricao(rs.getString("descricao"));
                return compartimento;
            }
        }
        stmt.close();
        return null;
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    
    public Compartimento ultimo(){
        String sql = "Select * from Compartimento WHERE idCompartimento = (SELECT MAX(idCompartimento) FROM Compartimento)";
        TipoCompartimentoDAO tcdao = new TipoCompartimentoDAO();
        ResponsavelDAO rdao = new ResponsavelDAO();   
        try{ 
            stmt = this.con.prepareStatement(sql);
            rs = stmt.executeQuery();
                
            while (rs.next()){
                Compartimento compartimento = new Compartimento();
                compartimento.setId(rs.getInt("idCompartimento"));
                compartimento.setDesignacao(rs.getString("designacao"));
                compartimento.setTipoCompartimento(tcdao.procuraPorId(rs.getInt("tipoCompartimento_idTipoCompartimento")));
                compartimento.setDescricao(rs.getString("descricao"));
                return compartimento;
            }
                stmt.close();
                return null;
                }catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }  
    /*
    public void apagar(int idCompartimento) {
        try {
            String sql = "DELETE FROM Compartimento WHERE idCompartimento=?";
            stmt = this.con.prepareStatement(sql);
            stmt.setInt(1, idCompartimento);
            stmt.execute();
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(ResponsavelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    */
    
}