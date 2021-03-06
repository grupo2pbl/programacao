package visao.paginas.form;

import controller.CategoriaMaterialController;
import controller.GrupoMaterialController;
import controller.MaterialController;
import java.util.List;
import javax.swing.JOptionPane;
import model.CategoriaMaterial;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/**
 *
 * @author elton
 */
public class AdicionaMaterialPP extends javax.swing.JPanel implements Formulario{

    /**
     * Creates new form AdicionaMaterialPP
     */
    public AdicionaMaterialPP() {
        initComponents();
        preencherComboBoxCargo();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        categoria = new javax.swing.JComboBox();
        jbAddCategoria = new javax.swing.JButton();
        jLabel3 = new javax.swing.JLabel();
        modelo = new javax.swing.JTextField();
        jLabel4 = new javax.swing.JLabel();
        cor = new javax.swing.JComboBox();
        jLabel5 = new javax.swing.JLabel();
        altura = new javax.swing.JTextField();
        jLabel6 = new javax.swing.JLabel();
        comprimento = new javax.swing.JTextField();
        jLabel7 = new javax.swing.JLabel();
        profundidade = new javax.swing.JTextField();
        jLabel8 = new javax.swing.JLabel();
        peso = new javax.swing.JTextField();
        jLabel9 = new javax.swing.JLabel();
        tempoVida = new javax.swing.JTextField();
        jComboBox3 = new javax.swing.JComboBox();

        jLabel1.setFont(new java.awt.Font("Dialog", 1, 14)); // NOI18N
        jLabel1.setText("Dados do Material");

        jLabel2.setText("Categoria: ");

        jbAddCategoria.setText("+");
        jbAddCategoria.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jbAddCategoriaActionPerformed(evt);
            }
        });

        jLabel3.setText("Modelo:");

        modelo.setToolTipText("");
        modelo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                modeloActionPerformed(evt);
            }
        });

        jLabel4.setText("Cor:");

        cor.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "Azul", "Amarelo", "Preto" }));

        jLabel5.setText("Altura:");

        jLabel6.setText("Comprimento:");

        jLabel7.setText("Profundidade: ");

        jLabel8.setText("Peso:");

        jLabel9.setText("Tempo de Vida: ");

        jComboBox3.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "Dias", "Semanas", "Meses" }));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel9)
                        .addGap(104, 104, 104)
                        .addComponent(tempoVida, javax.swing.GroupLayout.PREFERRED_SIZE, 157, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(jComboBox3, javax.swing.GroupLayout.PREFERRED_SIZE, 158, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(jLabel1)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel2)
                            .addComponent(jLabel3)
                            .addComponent(jLabel4)
                            .addComponent(jLabel5)
                            .addComponent(jLabel6)
                            .addComponent(jLabel7)
                            .addComponent(jLabel8))
                        .addGap(112, 112, 112)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                            .addComponent(cor, javax.swing.GroupLayout.Alignment.LEADING, 0, 333, Short.MAX_VALUE)
                            .addComponent(altura, javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(comprimento, javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(profundidade, javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(peso, javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(categoria, javax.swing.GroupLayout.Alignment.LEADING, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(modelo, javax.swing.GroupLayout.Alignment.LEADING))
                        .addGap(46, 46, 46)
                        .addComponent(jbAddCategoria, javax.swing.GroupLayout.PREFERRED_SIZE, 69, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(110, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1)
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(categoria, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(jbAddCategoria))
                    .addComponent(jLabel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addGap(0, 0, Short.MAX_VALUE)
                        .addComponent(modelo, javax.swing.GroupLayout.PREFERRED_SIZE, 27, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(cor, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel4, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addGap(36, 36, 36)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel5)
                    .addComponent(altura, javax.swing.GroupLayout.PREFERRED_SIZE, 27, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(20, 20, 20)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel6)
                    .addComponent(comprimento, javax.swing.GroupLayout.PREFERRED_SIZE, 27, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(15, 15, 15)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel7)
                    .addComponent(profundidade, javax.swing.GroupLayout.PREFERRED_SIZE, 27, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel8)
                    .addComponent(peso, javax.swing.GroupLayout.PREFERRED_SIZE, 27, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(25, 25, 25)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel9)
                    .addComponent(tempoVida, javax.swing.GroupLayout.PREFERRED_SIZE, 27, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jComboBox3, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(55, 55, 55))
        );
    }// </editor-fold>//GEN-END:initComponents

    private void modeloActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_modeloActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_modeloActionPerformed

    private void jbAddCategoriaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jbAddCategoriaActionPerformed
        AdicionaCategoria novaCategoria = new AdicionaCategoria();
        preencherComboBoxCargo();
    }//GEN-LAST:event_jbAddCategoriaActionPerformed
    


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JTextField altura;
    private javax.swing.JComboBox categoria;
    private javax.swing.JTextField comprimento;
    private javax.swing.JComboBox cor;
    private javax.swing.JComboBox jComboBox3;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JButton jbAddCategoria;
    private javax.swing.JTextField modelo;
    private javax.swing.JTextField peso;
    private javax.swing.JTextField profundidade;
    private javax.swing.JTextField tempoVida;
    // End of variables declaration//GEN-END:variables
    private CategoriaMaterialController cmc = new CategoriaMaterialController();
    private MaterialController materialController = new MaterialController();
    private GrupoMaterialController grupoMaterialController = new GrupoMaterialController();
   
    /*
    *   Variaveis cuja terminacao contem TXT sao aquelas que recebem o valores 
    *   da GUI
    */
    private double alturaTXT;
    private CategoriaMaterial categoriaTXT;
    private double comprimentoTXT;
    private String corTXT;
    private String modeloTXT;
    private double pesoTXT;
    private double profundidadeTXT;
    private int tempoVidaTXT;
    
    @Override
    public void recebe() {
        alturaTXT = Double.parseDouble(altura.getText());
        categoriaTXT = (CategoriaMaterial)categoria.getSelectedItem();
        comprimentoTXT = Double.parseDouble(comprimento.getText());
        corTXT = (String)cor.getSelectedItem();
        modeloTXT = modelo.getText();
        pesoTXT = Double.parseDouble(peso.getText());
        profundidadeTXT = Double.parseDouble(profundidade.getText());
        tempoVidaTXT = Integer.parseInt(tempoVida.getText());
    }

    @Override
    public boolean isValido() {
       return true;
    }

    @Override
    public boolean envia() {
        recebe();
        if(isValido()){
            return grupoMaterialController.adicionar(alturaTXT, categoriaTXT, comprimentoTXT, corTXT, modeloTXT, pesoTXT, profundidadeTXT, tempoVidaTXT);
        }
        JOptionPane.showMessageDialog(null,"Dados Incorretos", "Dados Incorretos", ERROR);
        return false;
    }
    
    private void preencherComboBoxCargo(){
        categoria.removeAllItems();
        List<CategoriaMaterial> cm = (List<CategoriaMaterial>)cmc.getMateriais();
        for (CategoriaMaterial cm1 : cm) {
            categoria.addItem(cm1);
        }
    }
    
    
    //Metodo que limpa todos campos do formulario
    public void limpaTudo(){
        altura.setText("");
        comprimento.setText("");
        modelo.setText("");
        peso.setText("");
        profundidade.setText("");
        tempoVida.setText("");
    }

    
}