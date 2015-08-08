package br.edu.ufabc.TakeARide.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;

import br.edu.ufabc.TakeARide.dao.*;
import br.edu.ufabc.TakeARide.modelo.*;

@Controller
public class MainController {
	private PessoaDAO pessoaDAO;
	private CaronaDAO caronaDAO;
	private VeiculoDAO veiculoDAO;
	private AluguelDAO aluguelDAO;
	
	@Autowired
	public MainController(PessoaDAO pessoaDAO, CaronaDAO caronaDAO, VeiculoDAO veiculoDAO, AluguelDAO aluguelDAO) {
		this.pessoaDAO = pessoaDAO;
		this.caronaDAO = caronaDAO;
		this.aluguelDAO = aluguelDAO;
		this.veiculoDAO = veiculoDAO;
	}
	
	@RequestMapping("/")
	public String start(Model model)	{
		return "index";
	}
	
	@RequestMapping("novoCadastro")
	public String cadastrar(Model model)	{
		return "cadastro";
	}
	
	@Transactional
	@RequestMapping("inserePessoa")
	public String insere(@Valid Pessoa pessoa, BindingResult result) {
		if (result.hasErrors()) {
			return "cadastro";
		}
		pessoaDAO.insere(pessoa); 
		System.out.println("----> Nova pessoa cadastrada!");
		return "redirect:sucesso";
	}
	
//	@RequestMapping({ "listaPessoas", "/" })
//	public String lista(Model model) {
//		
//		model.addAttribute("pessoas", pessoaDAO.getLista());
//		return "lista";
//	}
	
	
	@RequestMapping("sucesso")
	public String sucesso(Model model){
		return "sucesso";
	}
}
