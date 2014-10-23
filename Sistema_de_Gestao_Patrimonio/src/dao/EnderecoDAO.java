/*
*fffff
 */
package dao;

import model.Endereco;
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
public class EnderecoDAO {
    
        private Connection con;
    private PreparedStatement stmt;
    private ResultSet rs;
    
    public EnderecoDAO(){
         try {
           this.con = ConexaoBD.getConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(Endereco.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    public List<Endereco> listarTodos(){
        String sql = "call ListaEndereco ()";
        PaisDAO pdao = new PaisDAO();
        try {
            List<Endereco> lista = new ArrayList<>();
            stmt = this.con.prepareStatement(sql);//Conexao feita
            rs = stmt.executeQuery();
            while(rs.next()){
                Endereco endereco = new Endereco();
                endereco.setId(rs.getInt("idEndereco"));
                endereco.setPais((Pais)(pdao.procuraPorId(rs.getInt("pais"))));
                endereco.setCidade(rs.getString("cidade"));
                endereco.setRua(rs.getString("rua"));
                endereco.setNumero(rs.getInt("numero"));
                lista.add(endereco);
            }
            rs.close();
            stmt.close();
            return lista;
            
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    
    public boolean adicionar(Endereco endereco){
        try {
            String sql = "call AddEndereco(?,?,?,?)";
            stmt = this.con.prepareStatement(sql);
            
            stmt.setInt(1,endereco.getPais().getId());         
            stmt.setString(2, endereco.getCidade());
            stmt.setInt(3, endereco.getNumero());
            stmt.setString(4, endereco.getRua());
            
            stmt.execute();
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(CompartimentoDAO.class.getName()).log(Level.SEVERE, null, ex);
            //return false;
        }
        return true;
    }

    
    public Endereco procuraPorId(int id){
        String sql = "call ProcuraEndereco(?)";
        PaisDAO pdao = new PaisDAO();
        try{ 
        stmt = this.con.prepareStatement(sql);
        stmt.setInt(1, id);
        rs = stmt.executeQuery();
        
        while (rs.next()){
            if(id == rs.getInt("idEndereco")){
                Endereco endereco = new Endereco();
                endereco.setId(rs.getInt("idEndereco"));
                endereco.setPais((Pais)(pdao.procuraPorId(rs.getInt("pais"))));
                endereco.setCidade(rs.getString("cidade"));
                endereco.setRua(rs.getString("rua"));
                endereco.setNumero(rs.getInt("numero"));
                return endereco;
            }
        }
        stmt.close();
        return null;
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    
    public Endereco ultimo(){
        String sql = "call ProcuraUltimoEndereco()";
        PaisDAO pdao = new PaisDAO();   
        try{ 
            stmt = this.con.prepareStatement(sql);
            rs = stmt.executeQuery();
                
            while (rs.next()){
                        Endereco endereco = new Endereco();
                        endereco.setId(rs.getInt("idEndereco"));
                        endereco.setPais((Pais)pdao.procuraPorId(rs.getInt("pais")));
                        endereco.setCidade(rs.getString("cidade"));
                        endereco.setRua(rs.getString("rua"));
                        endereco.setNumero(rs.getInt("numero"));
                        return endereco;
                }
                stmt.close();
                return null;
                }catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }  
}
    
