/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package visao.paginas;

/**
 *
 * @author elton
 */
public interface Formulario {
    
    public void recebe();
    /*
    *   Verifica se os Campos obrigatorios estao devidamente preenchidos
    */
    public boolean isValido();
    
    /*
    *   Envia os dados para Controller's
    */
    public boolean envia();
    
    /*
    *   Limpa todos campos do formulario
    */
    public void limpaTudo();
    
}
