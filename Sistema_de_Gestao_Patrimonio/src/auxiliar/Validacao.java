
package auxiliar;

/**
 *
 * @author Domingos.Palave
 */
public interface Validacao {
    
    public boolean validarNome(String nome);
    
    public boolean validarInt( int min, int max, String valor);
    
    public boolean validarFloat(float min,float max, String valor);
    
    public boolean validarTelefoneFixo(String valor);
    
    public boolean validarTelefoneMovel(String valor);
    
    public boolean validarTexto( int min, int max,String valor);
    
    public boolean validarEmail(String email);
}
