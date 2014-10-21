
package auxiliar;

import java.io.*;

public class Validacoes implements Validacao{

    public Validacoes(){}

    @Override
    public boolean validarInt(int min, int max, String valor) {
       int x=0;
       BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));
       do { 
           
           try{
               x = Integer.parseInt(valor);
               if ( x < min || x > max)
              return false;
		}catch (NumberFormatException f){
                }	} while ( x < min || x > max);
       return true;
    }

    @Override
    public boolean validarTelefoneMovel(String tel) {
        return tel.matches("8[2467]\\d{7}");
    }

    @Override //feito
    public boolean validarTexto(int min, int max, String valor) {
        if(valor.length()<min || valor.length()>max)
            return false;
        return valor.matches("[A-Z][a-z]+([ -][A-Z][a-z]+)?");
    }

    @Override // feito
    public boolean validarEmail(String email) {
        return email.matches("[a-z]([.]?[\\w])+@[a-z]([.]?[\\w])+[.]{1}[\\w]{2,3}(.[\\w]{2})?");
    }

    @Override
    public boolean validarNome(String nome) {
    
        return nome.matches("[A-Z][a-z]+([A-Z][a-z]+)?");// sem espaco
    }

    @Override
    public boolean validarTelefoneFixo(String tel) {
        return tel.matches("2[1-9]\\d{6}");
    }

    @Override
    public boolean validarFloat(float min, float max, String valor) {
        float x=0;
        
        do {    
            try{
               x = Float.parseFloat(valor);
               if ( x < min || x > max)
               return false;
		}catch (NumberFormatException f){
                    System.out.println(" O numero deve ser inteiro.");
                }	} while ( x < min || x > max);
     return true;
    }
}