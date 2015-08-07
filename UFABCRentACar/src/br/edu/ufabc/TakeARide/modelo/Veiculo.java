package br.edu.ufabc.TakeARide.modelo;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="veiculo")
public class Veiculo {
	
	@Id
	@Column(name="chassi_veiculo",unique=true)
	private String chassi;
	
	@NotEmpty(message="Marca n�o pode ser vazio!")
	@Column(name="marca_veiculo",nullable=false)
	private String marca;
	
	@NotEmpty(message="Ano n�o pode ser vazio!")
	@Column(name="ano_veiculo",nullable=false)
	private int ano;
	
	@NotEmpty(message="Kilometragem n�o pode ser vazio!")
	@Column(name="km_veiculo",nullable=false)
	private int kilometragem;
	
	@Column(name="obs_veiculo")
	private String observacao;
	
	@NotEmpty(message="Status n�o pode ser vazio!")
	@Column(name="status_veiculo",nullable=false)
	private int status;
	
	@ManyToOne
	@JoinColumn(name = "cpf_cliente",nullable=false)
	private Pessoa pessoa;
	
	@OneToMany(targetEntity=Aluguel.class,mappedBy="veiculo")
	private List<Aluguel> alugueis;

	public String getChassi() {
		return chassi;
	}

	public void setChassi(String chassi) {
		this.chassi = chassi;
	}

	public String getMarca() {
		return marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

	public int getAno() {
		return ano;
	}

	public void setAno(int ano) {
		this.ano = ano;
	}

	public int getKilometragem() {
		return kilometragem;
	}

	public void setKilometragem(int kilometragem) {
		this.kilometragem = kilometragem;
	}

	public String getObservacao() {
		return observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Pessoa getPessoa() {
		return pessoa;
	}

	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
	}
	
}
