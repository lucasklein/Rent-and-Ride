package br.edu.ufabc.TakeARide.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.ufabc.TakeARide.dao.CadastroDAO;
import br.edu.ufabc.TakeARide.modelo.Pessoa;
import br.edu.ufabc.TakeARide.dao.PessoaDAO;


@WebServlet("/cadastrar")
public class CadastraServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		PrintWriter out = resp.getWriter();

		// obtem parametros do request
		String opcao = req.getParameter("opcao"); //Num segundo momento, dependendo da opção um DAO diferente será utilizado.
		String nome = req.getParameter("nome");
		String cpf = req.getParameter("cpf");
		String telefone = req.getParameter("telefone");
		String celular = req.getParameter("celular");
		String email = req.getParameter("email");
		String ra = req.getParameter("ra");
		String logradouro = req.getParameter("logradouro");
		String numero = req.getParameter("numero");
		String complemento = req.getParameter("complemento");
		String cidade = req.getParameter("cidade");
		String estado = req.getParameter("estado");
		String login = req.getParameter("login");
		String senha = req.getParameter("senha");
		
		// instancia objeto Pessoa
		Pessoa pessoa = new Pessoa();
		pessoa.setNome(nome);
		pessoa.setCpf(cpf);
		if(!(telefone == null))
			pessoa.setTelefone(telefone);
		if(!(celular == null))
			pessoa.setCelular(celular);
		pessoa.setEmail(email);
		pessoa.setRa(ra);
		
		pessoa.setLogradouro(logradouro);
		pessoa.setNumero(numero);
		if(!(complemento == null))
			pessoa.setComplemento(complemento);
		pessoa.setCidade(cidade);
		pessoa.setEstado(estado);
		
		pessoa.setLogin(login);
		pessoa.setSenha(senha); //TODO: Apply some security here;
		pessoa.setNivel(1);
		
		System.out.println("RA: " + pessoa.getRa() + " - " + ra);
		

		
		/*Connection conn = (Connection) req.getAttribute("conexao");
		CadastroDAO dao = new CadastroDAO(conn);
		dao.cadastraCliente(pessoa); // salva no BD*/
		
		PessoaDAO dao = new PessoaDAO();
		dao.cadastraPessoa(pessoa);

		// escreve a pagina que sera enviada como resposta
		req.setAttribute("msg", "Cadastro Realizado com sucesso!");
		RequestDispatcher rd = req.getRequestDispatcher("/sucesso.jsp");
		rd.forward(req, resp);
	}
}
