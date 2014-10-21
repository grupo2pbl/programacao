/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package visao.paginas;

import controller.CargoController;
import controller.EnderecoController;
import dao.EnderecoDAO;
import dao.PaisDAO;
import model.Endereco;
import model.Pais;

/**
 *
 * @author elton
 */
public class Teste {
    public static void main(String[] args) {
        EnderecoController ec = new EnderecoController();
        EnderecoDAO edao = new EnderecoDAO();
        
        System.out.println(ec.adicionar(new Pais(), "a", 0000,"ssss"));
        
    }
}
