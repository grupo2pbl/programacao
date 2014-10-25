package visao.paginas.form;


import controller.EnderecoController;
import controller.FornecedorController;
import controller.PaisController;
import java.util.List;
import javax.swing.JOptionPane;
import model.CategoriaMaterial;
import model.Fornecedor;
import model.Pais;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/**
 *
 * @author elton
 */
public class AdicionarFornecedor extends javax.swing.JPanel implements Formulario{

    /**
     * Creates new form AdicionarFornecedor
     */
    public AdicionarFornecedor() {
        initComponents();
        preencherComboBoxCargo();
        limpaTudo();
    }


    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        nomeFornecedor = new javax.swing.JTextField();
        jLabel2 = new javax.swing.JLabel();
        tipoFornecimento = new javax.swing.JComboBox();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        pais = new javax.swing.JComboBox();
        jLabel5 = new javax.swing.JLabel();
        cidade = new javax.swing.JComboBox();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        rua = new javax.swing.JTextField();
        numero = new javax.swing.JTextField();
        jLabel8 = new javax.swing.JLabel();
        jLabel9 = new javax.swing.JLabel();
        email = new javax.swing.JTextField();
        jLabel10 = new javax.swing.JLabel();
        telefone = new javax.swing.JTextField();
        jSeparator3 = new javax.swing.JSeparator();
        jSeparator4 = new javax.swing.JSeparator();

        jLabel1.setText("Nome do Fornecedor:");

        jLabel2.setText("Tipo de Fornecedor:");

        tipoFornecimento.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "Empresa", "Individuo" }));
        tipoFornecimento.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                tipoFornecimentoItemStateChanged(evt);
            }
        });

        jLabel3.setText("Localizacao");

        jLabel4.setText("Pais:");

        pais.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));
        pais.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                paisItemStateChanged(evt);
            }
        });

        jLabel5.setText("Cidade:");

        cidade.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));
        cidade.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                cidadeItemStateChanged(evt);
            }
        });

        jLabel6.setText("Rua:");

        jLabel7.setText("Numero:");

        numero.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                numeroActionPerformed(evt);
            }
        });

        jLabel8.setText("Contactos");

        jLabel9.setText("Email:");

        jLabel10.setText("Telefone");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jSeparator3)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel3)
                            .addComponent(jLabel8)
                            .addGroup(layout.createSequentialGroup()
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jLabel1)
                                    .addComponent(jLabel2)
                                    .addComponent(jLabel4)
                                    .addComponent(jLabel5)
                                    .addComponent(jLabel6)
                                    .addComponent(jLabel7)
                                    .addComponent(jLabel9))
                                .addGap(85, 85, 85)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                    .addComponent(telefone)
                                    .addComponent(nomeFornecedor)
                                    .addComponent(tipoFornecimento, 0, 343, Short.MAX_VALUE)
                                    .addComponent(pais, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                    .addComponent(cidade, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                    .addComponent(rua)
                                    .addComponent(numero)
                                    .addComponent(email)))
                            .addComponent(jLabel10))
                        .addGap(0, 91, Short.MAX_VALUE))
                    .addComponent(jSeparator4))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(20, 20, 20)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(nomeFornecedor, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(tipoFornecimento, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addComponent(jSeparator3, javax.swing.GroupLayout.PREFERRED_SIZE, 10, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jLabel3)
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel4)
                    .addComponent(pais, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(cidade, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel5))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(rua, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel6))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(numero, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel7))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jSeparator4, javax.swing.GroupLayout.PREFERRED_SIZE, 6, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jLabel8)
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel9)
                    .addComponent(email, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel10)
                    .addComponent(telefone, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents

    private void numeroActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_numeroActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_numeroActionPerformed

    private void tipoFornecimentoItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_tipoFornecimentoItemStateChanged
        
    }//GEN-LAST:event_tipoFornecimentoItemStateChanged

    private void paisItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_paisItemStateChanged

    }//GEN-LAST:event_paisItemStateChanged

    private void cidadeItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_cidadeItemStateChanged

    }//GEN-LAST:event_cidadeItemStateChanged


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JComboBox cidade;
    private javax.swing.JTextField email;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JSeparator jSeparator3;
    private javax.swing.JSeparator jSeparator4;
    private javax.swing.JTextField nomeFornecedor;
    private javax.swing.JTextField numero;
    private javax.swing.JComboBox pais;
    private javax.swing.JTextField rua;
    private javax.swing.JTextField telefone;
    private javax.swing.JComboBox tipoFornecimento;
    // End of variables declaration//GEN-END:variables
    
    private PaisController paisController = new PaisController();
    
    private FornecedorController fc = new FornecedorController();
    private EnderecoController ec = new EnderecoController();
    
    private String cidadeTXT;
    private String emailTXT;
    private String nomeFornecedorTXT;
    private int numeroTXT;
    private Pais paisTXT;
    private String tipoFornecimentoTXT;
    private String telefoneTXT;
    private String ruaTXT;
    
    
    @Override
    public void recebe() {
        //Primeiro recebi-se os dados de Endereco do Fornecedor
        paisTXT = (Pais)pais.getSelectedItem();
        cidadeTXT = (String) cidade.getSelectedItem();
        ruaTXT = rua.getText();
        numeroTXT = Integer.parseInt(numero.getText());
        
        //Em seguida os dados do Fornecdor
        nomeFornecedorTXT = nomeFornecedor.getText();
        tipoFornecimentoTXT = (String)tipoFornecimento.getSelectedItem();
        
        emailTXT = email.getText();
        telefoneTXT = telefone.getText();
    }

    @Override
    public boolean isValido() {
        return true;
    }

    @Override
    public boolean envia() {
        recebe();
        boolean isAdicionado = true;
        //Verifica se os dados que em da GUI estao correctos(Pela Regra de Negocio)
        if(isValido()){
            //Adiciona Endereco (Manda para o controlador)
            ec.adicionar(paisTXT, cidadeTXT, numeroTXT, ruaTXT);
            //Em seguida Manda o os dados do fornecedor(Para controlador)
            fc.adicionar(nomeFornecedorTXT, ec.ultimo(),emailTXT,telefoneTXT);
            if(isAdicionado){
                JOptionPane.showMessageDialog(null, "Adicionado Com Sucesso");
                limpaTudo();
                return true;
            }else{
                JOptionPane.showMessageDialog(null, "Falha Do Sistema", "Erro", ERROR);
                limpaTudo();
                return false;
            }
        }else{
            JOptionPane.showMessageDialog(null, "Dados Incorrectos", "Erro", ERROR);
            limpaTudo();
            return false;
        }
        
    }

    @Override
    public void limpaTudo() {
        email.setText("");
        nomeFornecedor.setText("");
        numero.setText("");
        telefone.setText("");
        rua.setText("");
    }
    
    private void preencherComboBoxCargo(){
        pais.removeAllItems();
        List<Pais> paises = (List<Pais>)paisController.getPaises();
        for (Pais p : paises) {
            pais.addItem(p);
        }
        pais.setSelectedIndex(164);
    }
}
