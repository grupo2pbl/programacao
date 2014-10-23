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
import model.Cargo;
import model.Pais;

/**
 *
 * @author elton
 */
public class PaisDAO {
    private Connection con;
    private PreparedStatement stmt;
    private ResultSet rs;
    
    public PaisDAO(){
         try {
           this.con = ConexaoBD.getConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ResponsavelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    public List<Pais> listarTodos(){
        String sql = " call ListaPais()";
        try {
            List<Pais> lista = new ArrayList<>();
            stmt = this.con.prepareStatement(sql);//Conexao feita
            rs = stmt.executeQuery();
            while(rs.next()){
                Pais car = new Pais();
                car.setId(rs.getInt("paisId"));
                car.setNome(rs.getString("paisNome"));
                lista.add(car);
            }
            rs.close();
            stmt.close();
            return lista;
            
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    
    public Pais procuraPorId(int id){
        String sql = "call ProcuraPais(?)";
        
        try{ 
        stmt = this.con.prepareStatement(sql);
        stmt.setInt(1, id);
        rs = stmt.executeQuery();
        
        while (rs.next()){
            if(id == rs.getInt("paisId")){
                Pais pais = new Pais();
                pais.setId(rs.getInt("paisId"));
                pais.setNome(rs.getString("paisNome"));
                return pais;
            }
        }
        stmt.close();
        return null;
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}