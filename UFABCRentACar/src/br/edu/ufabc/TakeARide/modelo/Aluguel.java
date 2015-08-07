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

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="aluga")
public class Aluguel {
	
	@Id
	@GeneratedValue
	private int id;
	
	@NotEmpty(message="Data inicio não pode ser vazio!")
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable=false)
	private Date data_inicio;
	
	@NotEmpty(message="Data Devolucao não pode ser vazio!")
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable=false)
	private Date data_devolucao;
	
	private String observacao;
	
	private String alugacol;
	
	@ManyToOne
	@JoinColumn(name = "cpf_cliente")
	private Pessoa pessoa;
	
	@ManyToOne
	@JoinColumn(name = "chassi_veiculo")
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
	public String getAlugacol() {
		return alugacol;
	}
	public void setAlugacol(String alugacol) {
		this.alugacol = alugacol;
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
	

}
