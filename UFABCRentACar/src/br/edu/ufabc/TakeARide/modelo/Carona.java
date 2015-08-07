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
@Table(name="carona")
public class Carona {
	
	@Id
	@GeneratedValue
	@Column(name="id_carona")
	private int id;
	
	@NotEmpty(message="Quantidade de vagas não pode ser vazio!")
	@Column(nullable=false)
	private int qtd_vagas;
	
	@NotEmpty(message="Partida não pode ser vazio!")
	@Column(name="local_partida",nullable=false)
	private String partida;
	
	@NotEmpty(message="Destino não pode ser vazio!")
	@Column(nullable=false)
	private String destino;
	
	@NotEmpty(message="Destino não pode ser vazio!")
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable=false)
	private Date data_saida;
	
	@ManyToOne
	@JoinColumn(name = "cpf_cliente",nullable=false)
	private Pessoa pessoa;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getQtd_vagas() {
		return qtd_vagas;
	}

	public void setQtd_vagas(int qtd_vagas) {
		this.qtd_vagas = qtd_vagas;
	}

	public String getDestino() {
		return destino;
	}

	public void setDestino(String destino) {
		this.destino = destino;
	}

	public Date getData_saida() {
		return data_saida;
	}

	public void setData_saida(Date data_saida) {
		this.data_saida = data_saida;
	}

	public Pessoa getPessoa() {
		return pessoa;
	}

	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
	}

	public String getPartida() {
		return partida;
	}

	public void setPartida(String partida) {
		this.partida = partida;
	}

}

