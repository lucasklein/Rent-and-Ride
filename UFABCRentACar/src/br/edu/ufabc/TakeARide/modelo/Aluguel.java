package br.edu.ufabc.TakeARide.modelo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;



@Entity
@Table(name="aluga")
public class Aluguel {
	
	@Id
	@GeneratedValue
	private int id;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable=false)
	private Date data_inicio;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable=false)
	private Date data_devolucao;
	
	private String observacao;
	
	@ManyToOne
	@JoinColumn(name = "cpf_cliente",nullable=false)
	private Pessoa pessoa;
	
	@ManyToOne
	@JoinColumn(name = "cpf_locatario",nullable=false)
	private Pessoa locatario;
	
	@ManyToOne
	@JoinColumn(name = "chassi_veiculo",nullable=false)
	private Veiculo veiculo;

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
	public Pessoa getPessoa() {
		return pessoa;
	}
	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
	}
	public Veiculo getVeiculo() {
		return veiculo;
	}
	public void setVeiculo(Veiculo veiculo) {
		this.veiculo = veiculo;
	}
	public Pessoa getLocatario() {
		return locatario;
	}
	public void setLocatario(Pessoa locatario) {
		this.locatario = locatario;
	}
	
	public void serialize(AluguelSerializer serializer){
		this.data_devolucao = serializer.getData_devolucao();
		this.data_inicio = serializer.getData_inicio();
		this.observacao = serializer.getObservacao();
	}

}
