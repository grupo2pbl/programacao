/*
* ffffff
 */
package dao;

import model.Fornecedor;
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
public class FornecedorDAO {
    
    private Connection con;
    private PreparedStatement stmt;
    private ResultSet rs;
    
    public FornecedorDAO(){
         try {
           this.con = ConexaoBD.getConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ResponsavelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
     public boolean adicionar(Fornecedor fornecedor){
        try {
            String sql = "Insert into Fornecedor(nomeFornecedor,Endereco_idEndereco,email,tell) values (?,?,?,?)";
    
            stmt = this.con.prepareStatement(sql);
            stmt.setString(1, fornecedor.getNome());
            stmt.setInt(2, fornecedor.getEndereco().getId());
            stmt.setString(3, fornecedor.getEmail());
            stmt.setString(4, fornecedor.getTell());
            stmt.execute();
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(ResponsavelDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return true;
    }
     
    public List<Fornecedor> listarTodos(){
        String sql = "Select * from Fornecedor";
        try{ 
        stmt = this.con.prepareStatement(sql);
        rs = stmt.executeQuery();
        EnderecoDAO enderecoDAO = new EnderecoDAO();
        
        List<Fornecedor> fornecedores = new ArrayList<>();
        while (rs.next()){
            Fornecedor fornecedor = new Fornecedor();
            fornecedor.setId(rs.getInt("idFornecedor"));
            fornecedor.setNome(rs.getString("nomeFornecedor"));
            fornecedor.setEndereco(enderecoDAO.procuraPorId(rs.getInt("Endereco_idEndereco")));
            fornecedor.setEmail(rs.getString("email"));
            fornecedor.setTell(rs.getString("tell"));
            fornecedores.add(fornecedor);
        }
        stmt.close();
        return fornecedores;
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    
    public Fornecedor procuraPorId(int id){
        String sql = "SELECT * FROM Fornecedor WHERE idFornecedor = ?";
        
        try{ 
        stmt = this.con.prepareStatement(sql);
        stmt.setInt(1, id);
        rs = stmt.executeQuery();
        
        EnderecoDAO enderecoDAO = new EnderecoDAO();
        while (rs.next()){
            if(id == rs.getInt("idFornecedor")){
                Fornecedor fornecedor = new Fornecedor();
                fornecedor.setId(rs.getInt("idFornecedor"));
                fornecedor.setNome(rs.getString("nomeFornecedor"));
                fornecedor.setEndereco(enderecoDAO.procuraPorId(rs.getInt("Endereco_idEndereco")));
                fornecedor.setEmail(rs.getString("email"));
                fornecedor.setTell(rs.getString("tell"));
                return fornecedor;
            }
        }
        stmt.close();
        return null;
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    
    /*public void apagar(Fornecedor fornecedor) {
        try {
            String sql = "DELETE FROM fornecedor WHERE idFornecedor=?";
            stmt = this.con.prepareStatement(sql);
            stmt.setInt(1, fornecedor.getId());
            stmt.execute();
            stmt.close();
        }catch (SQLException ex) {
            Logger.getLogger(ResponsavelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
      
    public void actualizar(Fornecedor fornecedor){
        String sql = "update fornecedor set nomeFornecedor=?, where idFornecedor=?";
        try {
            stmt = this.con.prepareStatement(sql);
            stmt.setString(1,fornecedor.getNome());
            //stmt.setString(2,fornecedor.get());
            //stmt.setObject(3,fornecedor.getIdEndereco());
            stmt.setInt(2,fornecedor.getId());
            stmt.execute();
            
            stmt.close();
            
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    } */     
}