
import auxiliar.Mensagem;
import visao.paginas.dialog.MensagemConfirma;
import javax.swing.JFrame;
import visao.paginas.dialog.MensagemDialog;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author elton
 */
public class Teste {
    public static void main(String []args){
        //MensagemConfirma dialogo = new MensagemConfirma(new JFrame(), true,Mensagem.erroSys);
        MensagemDialog dialog = new MensagemDialog(null, true, Mensagem.numero);
    }
}