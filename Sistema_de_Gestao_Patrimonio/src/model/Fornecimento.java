/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author Beula
 */
public class Fornecimento {
    private Fornecedor fornecedor;
    private GrupoMaterial grupoMaterial;
    private int quantidade;
    private String dataAquisicao;
    private String tipoFornecimento;
    private int garantia;
    private double preco;

    public Fornecimento(Fornecedor fornecedor, GrupoMaterial grupoMaterial, int quantidade, String dataAquisicao, String tipoFornecimento, int garantia, double preco) {
        this.fornecedor = fornecedor;
        this.grupoMaterial = grupoMaterial;
        this.quantidade = quantidade;
        this.dataAquisicao = dataAquisicao;
        this.tipoFornecimento = tipoFornecimento;
        this.garantia = garantia;
        this.preco = preco;
    }

    public Fornecimento() {
    }

    public Fornecedor getFornecedor() {
        return fornecedor;
    }

    public void setFornecedor(Fornecedor fornecedor) {
        this.fornecedor = fornecedor;
    }

    public GrupoMaterial getGrupoMaterial() {
        return grupoMaterial;
    }

    public void setGrupoMaterial(GrupoMaterial grupoMaterial) {
        this.grupoMaterial = grupoMaterial;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public String getDataAquisicao() {
        return dataAquisicao;
    }

    public void setDataAquisicao(String dataAquisicao) {
        this.dataAquisicao = dataAquisicao;
    }

    public String getTipoFornecimento() {
        return tipoFornecimento;
    }

    public void setTipoFornecimento(String tipoFornecimento) {
        this.tipoFornecimento = tipoFornecimento;
    }

    public int getGarantia() {
        return garantia;
    }

    public void setGarantia(int garantia) {
        this.garantia = garantia;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    @Override
    public String toString() {
        return "Fornecimento{" + "fornecedor=" + fornecedor + ", grupoMaterial=" + grupoMaterial + ", quantidade=" + quantidade + ", dataAquisicao=" + dataAquisicao + ", tipoFornecimento=" + tipoFornecimento + ", garantia=" + garantia + ", preco=" + preco + '}';
    }  
}
