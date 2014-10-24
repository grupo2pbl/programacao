/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import model.Capacidade;
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
public class CapacidadeDAO {
    private Connection con;
    private PreparedStatement stmt;
    private ResultSet rs;
    
    public CapacidadeDAO(){
         try {
           this.con = ConexaoBD.getConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ResponsavelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    
    public boolean adicionar(Capacidade capacidade){
        try {
            String sql = "Insert into Capacidade(CategoriaMaterial_idCategoria,Compartimento_idCompartimento"
                    + ",capacidade) values(?,?,?)";
            stmt = this.con.prepareStatement(sql);
            stmt.setInt(1,capacidade.getCategoria().getId());
            stmt.setInt(2, capacidade.getCompartimento().getId());
            stmt.setInt(3, capacidade.getCapacidade());
            
            stmt.execute();
            stmt.close();
        } catch (SQLException ex) {
            //Logger.getLogger(CompartimentoDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return true;
    }
    
    public List<Capacidade> listarTodos(){
        String sql = "select * from Capacidade";
        try {
            List<Capacidade> lista = new ArrayList<>();
            stmt = this.con.prepareStatement(sql);//Conexao feita
            rs = stmt.executeQuery();
            
            CategoriaMaterialDAO cmdao = new CategoriaMaterialDAO();
            CompartimentoDAO cdao = new CompartimentoDAO();
            
            
            while(rs.next()){
                Capacidade capacidade = new Capacidade();
                capacidade.setCategoria(cmdao.procuraPorId(rs.getInt("CategoriaMaterial_idCategoria")));
                capacidade.setCompartimento(cdao.procuraPorId(rs.getInt("Compartimento_idCompartimento")));
                capacidade.setCapacidade(rs.getInt("capacidade"));
                lista.add(capacidade);
            }
            rs.close();
            stmt.close();
            return lista;
            
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    
    public Capacidade procuraPorId(int idCategoria, int idCompartimento){
        String sql = "SELECT * FROM Capacidade WHERE  CategoriaMaterial_idCategoria = ? AND "
                + "Compartimento_idCompartimento = ?";
        
        try{ 
        stmt = this.con.prepareStatement(sql);
        stmt.setInt(1, idCategoria);
        stmt.setInt(2, idCompartimento);
        rs = stmt.executeQuery();
        
        CategoriaMaterialDAO cmdao = new CategoriaMaterialDAO();
        CompartimentoDAO cdao = new CompartimentoDAO();
        
        while (rs.next()){
            if(idCategoria == rs.getInt("CategoriaMaterial_idCategoria") && idCompartimento == rs.getInt("Compartimento_idCompartimento")){
                Capacidade capacidade = new Capacidade();
                capacidade.setCategoria(cmdao.procuraPorId(rs.getInt("CategoriaMaterial_idCategoria")));
                capacidade.setCompartimento(cdao.procuraPorId(rs.getInt("Compartimento_idCompartimento")));
                capacidade.setCapacidade(rs.getInt("capacidade"));
                return capacidade;
            }
        }
        stmt.close();
        return null;
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}