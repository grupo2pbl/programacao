/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.CompartimentoResponsavel;

/**
 *
 * @author elton
 */
public class CompartimentoResponsavelDAO {
    private Connection con;
    private PreparedStatement stmt;
    private ResultSet rs;
    
    public CompartimentoResponsavelDAO(){
         try {
           this.con = ConexaoBD.getConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(CompartimentoResponsavelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public boolean adicionar(CompartimentoResponsavel cr){
        try {
            String sql = "call AddCompartimentoResponsavel(?,?,?,?)";
            stmt = this.con.prepareStatement(sql);
            
            stmt.setInt(1, cr.getCompartimento().getId());
            stmt.setInt(2, cr.getResponsavel().getId());
            stmt.setString(3, cr.getDataInicio());
            
            stmt.execute();
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(CompartimentoResponsavelDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return true;
    }
        public List<CompartimentoResponsavel> listarTodos(){
        String sql = "call ListaCompartimentoResponsavel()";
        CompartimentoDAO cdao = new CompartimentoDAO();
        ResponsavelDAO rdao = new ResponsavelDAO();
        try {
            List<CompartimentoResponsavel> lista = new ArrayList<>();
            stmt = this.con.prepareStatement(sql);//Conexao feita
            rs = stmt.executeQuery();
            while(rs.next()){
                CompartimentoResponsavel cr = new CompartimentoResponsavel();
                cr.setId(rs.getInt("id"));
                cr.setCompartimento(cdao.procuraPorId(rs.getInt("idCompartimento")));
                cr.setResponsavel(rdao.procuraPorId(rs.getInt("idResponsavel")));
                cr.setDataInicio(rs.getString("dataInicio"));
                cr.setDataFim(rs.getString("dataFim"));
                
                lista.add(cr);
            }
            rs.close();
            stmt.close();
            return lista;
            
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}