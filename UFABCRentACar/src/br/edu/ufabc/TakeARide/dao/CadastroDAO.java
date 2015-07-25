package br.edu.ufabc.TakeARide.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import br.edu.ufabc.TakeARide.connection.ConnectionFactory;
import br.edu.ufabc.TakeARide.modelo.Pessoa;

public class CadastroDAO {
	private Connection connection;
	private ConnectionFactory conn;
	
	public CadastroDAO() {
		this.connection = conn.getConnection();
	}

	public CadastroDAO(Connection connection) {
		this.connection = new ConnectionFactory().getConnection();
	}

	public void fechaConexao() {
		try {
			connection.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void cadastraCliente(Pessoa pessoa){
		String sql = "insert into RENTACAR.PESSOA (cpf_cliente,nome_cliente,tel_cliente,cel_cliente,logradouro_cliente,"
				+ "numero_cliente,complemento_cliente,email_cliente) values (?,?,?,?,?,?,?,?)";
		String sqlUsuario = "insert into RENTACAR.USUARIO (login_usuario,senha_usuario,nivel_usuario,pessoa_cpf_cliente) values (?,?,?,?)";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			System.out.println(pessoa.getNome()+"\n"+ pessoa.getCpf()+"\n"+ pessoa.getTelefone()+"\n"+pessoa.getCelular()+"\n"+pessoa.getEmail()
					+"\n"+pessoa.getRa()+"\n"+pessoa.getLogradouro()+"\n"+pessoa.getNumero()+"\n"+pessoa.getComplemento()+"\n"+pessoa.getCidade()+"\n"+
					pessoa.getEstado()+"\n"+pessoa.getLogin()+"\n"+pessoa.getSenha());
			System.out.println(sql);
			//valores no stmt para tabela pessoa
			stmt.setString(1, pessoa.getCpf());//cpf
			stmt.setString(2, pessoa.getNome());//nome
			stmt.setString(3, pessoa.getTelefone());//tel
			stmt.setString(4, pessoa.getCelular());//cel
			stmt.setString(5, pessoa.getLogradouro());//logradouro
			stmt.setInt(6, Integer.parseInt(pessoa.getNumero()));//num
			stmt.setString(7, pessoa.getComplemento());//complemento
			stmt.setString(8, pessoa.getEmail());//email
			//executa stmt na tabela pessoa
			stmt.execute();

			stmt = connection.prepareStatement(sqlUsuario);
			
			//valores no stmt para tabela usuario
			stmt.setString(1, pessoa.getLogin());//login
			stmt.setString(2, pessoa.getSenha());//senha
			stmt.setInt(3, pessoa.getNivel());//nivel
			stmt.setString(4, pessoa.getCpf());//cpf
			//executa stmt na tabela pessoa
			stmt.execute();
			
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
