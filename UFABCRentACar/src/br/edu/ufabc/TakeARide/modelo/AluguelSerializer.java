package br.edu.ufabc.TakeARide.modelo;

import java.util.Date;

public class AluguelSerializer {

	private int id;
	private Date data_inicio;
	private Date data_devolucao;
	private String observacao;
	private String idPessoa;
	private String idVeiculo;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getData_inicio() {
		return data_inicio;
	}
	public void setData_inicio(Date data_inicio) {
		this.data_inicio = data_inicio;
	}
	public Date getData_devolucao() {
		return data_devolucao;
	}
	public void setData_devolucao(Date data_devolucao) {
		this.data_devolucao = data_devolucao;
	}
	public String getObservacao() {
		return observacao;
	}
	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}
	public String getIdPessoa() {
		return idPessoa;
	}
	public void setIdPessoa(String idPessoa) {
		this.idPessoa = idPessoa;
	}
	public String getIdVeiculo() {
		return idVeiculo;
	}
	public void setIdVeiculo(String idVeiculo) {
		this.idVeiculo = idVeiculo;
	}

}
