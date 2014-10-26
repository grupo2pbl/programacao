
package dao;

/**
 *
 * @author e1000son
 */

import model.Fornecimento;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Material;

public class FornecimentoDAO {
    private Connection con;
    private PreparedStatement stmt;
    private ResultSet rs;
    
    public FornecimentoDAO(){
        try {
           this.con = ConexaoBD.getConnection();
        }catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ResponsavelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
          
    public boolean adicionar(Fornecimento fornecimento){
        MaterialDAO materialDAO = new MaterialDAO();
        try {
            String sql = "call AddFornecimento(?,?,?,?,?,?)";
            stmt = this.con.prepareStatement(sql);
            stmt.setInt(1,fornecimento.getFornecedor().getId());
            stmt.setInt(2, fornecimento.getGrupoMaterial().getId());
            stmt.setInt(3, fornecimento.getQuantidade());
            stmt.setString(4, fornecimento.getTipoFornecimento());
            stmt.setInt(5, fornecimento.getGarantia());
            stmt.setDouble(6, fornecimento.getPreco());
            
            stmt.execute();
            stmt.close();
            Material material = new Material();
            material.setGrupoMaterial(fornecimento.getGrupoMaterial());
            materialDAO.adicionar(material,fornecimento.getQuantidade());
        } catch (SQLException ex) {
            Logger.getLogger(FornecimentoDAO.class.getName()).log(Level.SEVERE, null, ex);
            //return false;
        }
        return true;
    
    }
     
    public List<Fornecimento> listarTodos(){
        String sql = "call ListaFornecimento()";
        try{ 
        stmt = this.con.prepareStatement(sql);
        rs = stmt.executeQuery();
       
        FornecedorDAO fdao = new FornecedorDAO();
        GrupoMaterialDAO gmdao = new GrupoMaterialDAO();
        
        List<Fornecimento> fornecimentos = new ArrayList<>();
        while (rs.next()){
            Fornecimento fornecimento = new Fornecimento();
            fornecimento.setFornecedor(fdao.procuraPorId(rs.getInt("Fornecedor_idFornecedor")));
            fornecimento.setGrupoMaterial(gmdao.procuraPorId(rs.getInt("GrupoMaterial_idGrupoMaterial")));
            fornecimento.setQuantidade(rs.getInt("quantidade"));
            fornecimento.setDataAquisicao(rs.getString("dataAquisicao"));
            fornecimento.setGarantia(rs.getInt("garantia"));
            fornecimento.setPreco(rs.getDouble("preco"));
            fornecimento.setTipoFornecimento(rs.getString("TipoFornecimento"));
            fornecimentos.add(fornecimento);
        }
        stmt.close();
        return fornecimentos;
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    
    public Fornecimento ultimo(){
        String sql = "call ProcuraUltimoFornecimento()";  
        FornecedorDAO fdao = new FornecedorDAO();
        GrupoMaterialDAO gmdao = new GrupoMaterialDAO();
        try{ 
            stmt = this.con.prepareStatement(sql);
            rs = stmt.executeQuery();
                
            while (rs.next()){
                Fornecimento fornecimento = new Fornecimento();
                fornecimento.setFornecedor(fdao.procuraPorId(rs.getInt("Fornecedor_idFornecedor")));
                fornecimento.setGrupoMaterial(gmdao.procuraPorId(rs.getInt("GrupoMaterial_idGrupoMaterial")));
                fornecimento.setQuantidade(rs.getInt("quantidade"));
                fornecimento.setDataAquisicao(rs.getString("dataAquisicao"));
                fornecimento.setGarantia(rs.getInt("garantia"));
                fornecimento.setPreco(rs.getDouble("preco"));
                fornecimento.setTipoFornecimento(rs.getString("TipoFornecimento"));
                return fornecimento;
            }
            stmt.close();
            return null;
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }  
    
    public long quantidadePorGrupo(int idGrupoMaterial){
        String sql = "CALL quantidadePorGrupo(?)"; 
        long quant;
        
        try{ 
            stmt = this.con.prepareStatement(sql);
            stmt.setInt(1, idGrupoMaterial);
            rs = stmt.executeQuery();
            
            
            while (rs.next()){
                quant = rs.getInt(1);
                return quant;
            }
            stmt.close();
            return 0;
        }catch (SQLException e) {
            //throw new RuntimeException(e);
            return 0;
        }
    }
    
    
    //precoMaterialPorGrupo
        public double precoMaterialPorGrupo(int idGrupoMaterial){
        String sql = "CALL precoMaterialPorGrupo(?)"; 
        double quant;
        
        try{ 
            stmt = this.con.prepareStatement(sql);
            stmt.setInt(1, idGrupoMaterial);
            rs = stmt.executeQuery();
            
            
            while (rs.next()){
                quant = rs.getInt(1);
                return quant;
            }
            stmt.close();
            return 0;
        }catch (SQLException e) {
            //throw new RuntimeException(e);
            return 0;
        }
    }
    /*public void apagar(Fornecimento fornecimento) {
        try {
            String sql = "DELETE FROM Responsavel WHERE idResponsavel=?";
            stmt = this.con.prepareStatement(sql);
            stmt.setInt(1, fornecimento.);
            stmt.execute();
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(ResponsavelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
      
    public void actualizarResponsavel(Responsavel responsavel){
        String sql = "update responsavel set apelido=?, outrosNomes=?  where idResponsavel=?"; //morada=?
        try {
            stmt = this.con.prepareStatement(sql);
            stmt.setString(1,responsavel.getApelido());
            stmt.setString(2,responsavel.getOutrosNomes());
            //stmt.setObject(3,responsavel.getCargo_idCargo());
            stmt.setInt(3,responsavel.getId());
            stmt.execute();
            
            stmt.close();
            
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }      
    }
    */
}