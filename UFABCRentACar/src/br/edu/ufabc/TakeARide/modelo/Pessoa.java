package br.edu.ufabc.TakeARide.modelo;

import java.util.List;

import javax.validation.constraints.Pattern;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="pessoa")
public class Pessoa {
	
	private String opcao;
	
	@NotEmpty(message="Nome não pode ser vazio!")
	private String nome;
	
	@Id
	@NotEmpty(message="CPF não pode ser vazio!") 
	@Column(length = 11)
	private String cpf; 
	
	@NotEmpty(message="Telefone não pode ser vazio!") 
	@Column(length = 9)
	private String telefone; 
	
	@NotEmpty(message="Celular não pode ser vazio!") 
	@Column(length = 9)
	private String celular; 
	
	@NotEmpty(message="Email não pode ser vazio!") 
	@Pattern(message="Email deve ter o formato: palavra@palavra.palavra",
	regexp="^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$")
	private String email; 
	
	//@NotEmpty(message="RA não pode ser vazio!") 
	private String ra; 
	
	@NotEmpty(message="Logradouro não pode ser vazio!") 
	private String logradouro; 
	
	private int numero; 
	
	private String complemento;

	@NotEmpty(message="Cidade não pode ser vazio!") 
	private String cidade; 
	
	@NotEmpty(message="Estado não pode ser vazio!") 
	private String estado; 
	
	@NotEmpty(message="Senha não pode ser vazio!") 
	private String senha;
	int nivel;
	
	@OneToMany(targetEntity=Veiculo.class,mappedBy="pessoa")
	private List<Veiculo> veiculos;
	
	@OneToMany(targetEntity=Aluguel.class,mappedBy="pessoa")
	private List<Aluguel> alugueis;
	
	@OneToMany(targetEntity=Carona.class,mappedBy="pessoa")
	private List<Carona> carona;
	
	public int getNivel() {
		return nivel;
	}

	public void setNivel(int nivel) {
		this.nivel = nivel;
	}

	public String getOpcao() {
		return opcao;
	}

	public void setOpcao(String opcao) {
		this.opcao = opcao;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getCelular() {
		return celular;
	}

	public void setCelular(String celular) {
		this.celular = celular;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRa() {
		return ra;
	}

	public void setRa(String ra) {
		this.ra = ra;
		System.out.println("Setei RA: " + this.ra);
	}

	public String getLogradouro() {
		return logradouro;
	}

	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}

	public int getNumero() {
		return numero;
	}

	public void setNumero(int numero) {
		this.numero = numero;
	}

	public String getComplemento() {
		return complemento;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}
	
	public boolean validaSenha(String senha){
		if(senha == getSenha())
			return true;
		else
			return false;
	}
	
	
}
