package br.edu.ufabc.TakeARide.modelo;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;

public class Pessoa {
	
	private String opcao;
	
	@NotEmpty(message="Nome n�o pode ser vazio!")
	private String nome;
	
	@NotEmpty(message="CPF n�o pode ser vazio!") 
	private String cpf; 
	
	@NotEmpty(message="Telefone n�o pode ser vazio!") 
	private String telefone; 
	
	@NotEmpty(message="Celular n�o pode ser vazio!") 
	private String celular; 
	
	@NotEmpty(message="Email n�o pode ser vazio!") 
	@Pattern(message="Email deve ter o formato: palavra@palavra.palavra",
	regexp="^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$")
	private String email; 
	
	@NotEmpty(message="RA n�o pode ser vazio!") 
	private String ra; 
	
	@NotEmpty(message="Logradouro n�o pode ser vazio!") 
	private String logradouro; 
	
	@NotEmpty(message="N�mero n�o pode ser vazio!") 
	private String numero; 
	
	@NotEmpty(message="Complemento n�o pode ser vazio!") 
	private String complemento;

	@NotEmpty(message="Cidade n�o pode ser vazio!") 
	private String cidade; 
	
	@NotEmpty(message="Estado n�o pode ser vazio!") 
	private String estado; 
	
	@NotEmpty(message="Login n�o pode ser vazio!") 
	private String login; 
	
	@NotEmpty(message="Senha n�o pode ser vazio!") 
	private String senha;
	int nivel;
	
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
	}

	public String getLogradouro() {
		return logradouro;
	}

	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
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

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}
	
	
}
