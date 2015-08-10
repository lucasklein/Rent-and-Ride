package br.edu.ufabc.TakeARide.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;

import br.edu.ufabc.TakeARide.dao.*;
import br.edu.ufabc.TakeARide.modelo.*;

@Controller
public class MainController {
	private PessoaDAO pessoaDAO;
	private CaronaDAO caronaDAO;
	private VeiculoDAO veiculoDAO;
	private AluguelDAO aluguelDAO;
	
	private Pessoa pessoaSessao;
	
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
	
	@RequestMapping("login")
	public String login(@RequestParam("login") String cpf, @RequestParam("senha") String senha, Model model){
		pessoaSessao = pessoaDAO.buscaPorId(cpf);
		if((pessoaSessao != null) && (Criptografia.encripta(senha).equals(pessoaSessao.getSenha()))){
			return "redirect:listaVeiculos";
		} else {
			model.addAttribute("error", "Por favor verifique seus dados");
			return "redirect:/";
		}
	}
	
	@RequestMapping("novoCadastro")
	public String cadastrar(Model model)	{
		return "cadastro";
	}
	
	@RequestMapping("cadastroVeiculo")
	public String cadastrarVeiculo(Model model)	{
		model.addAttribute("pessoa", pessoaSessao);
		return "cadastroVeiculo";
	}
	
	@RequestMapping("cadastroCarona")
	public String cadastrarCarona(Model model)	{
		model.addAttribute("pessoa", pessoaSessao);
		return "cadastroCarona";
	}
	
	@Transactional
	@RequestMapping("inserePessoa")
	public String insere(@Valid Pessoa pessoa, BindingResult result) {
		if (result.hasErrors()) {
			return "cadastro";
		}
		
		pessoa.setSenha(Criptografia.encripta(pessoa.getSenha()));
		pessoaDAO.insere(pessoa); 
		System.out.println("----> Nova pessoa cadastrada!");
		return "redirect:sucesso";
	}
	
	@RequestMapping("listaPessoas")
	public String listaPessoas(Model model) {
		
		model.addAttribute("pessoas", pessoaDAO.getLista());
		return "lista";
	}
	
	@Transactional
	@RequestMapping("insereVeiculo")
	public String insere(@Valid Veiculo veiculo, BindingResult result) {
		if (result.hasErrors()) {
			return "cadastroVeiculo";
		}
		veiculo.setPessoa(pessoaSessao);
		veiculoDAO.insere(veiculo); 
		System.out.println("----> Novo veiculo cadastrado!");
		return "redirect:sucesso";
	}
	
	@Transactional
	@RequestMapping("insereCarona")
	public String insere(@Valid Carona carona, BindingResult result) {
		if (result.hasErrors()) {
			return "cadastroCarona";
		}
		carona.setPessoa(pessoaSessao);
		caronaDAO.insere(carona); 
		System.out.println("----> Nova carona cadastrado!");
		return "redirect:sucesso";
	}
	
	
	@RequestMapping("listaVeiculos")
	public String listaVeiculos(Model model) {
		model.addAttribute("veiculos", veiculoDAO.getListaDisponiveis());
		model.addAttribute("caronas", caronaDAO.getLista());
		return "firstPage";
	}
	
	
	@RequestMapping("sucesso")
	public String sucesso(Model model){
		return "sucesso";
	}
	
	@RequestMapping("detalhesCarona")
	public String detalhes(int id, Model model){
		if(id > 0){
			model.addAttribute("carona", caronaDAO.buscaPorId(id));
			model.addAttribute("pessoa", caronaDAO.buscaPorId(id).getPessoa());
			return "detalhesCarona";
		}
		return "redirect:listaVeiculos";
	}
	
	@RequestMapping("detalhesAluga")
	public String detalhes(String chassi, Model model){
		if(chassi != null){
			model.addAttribute("veiculo", veiculoDAO.buscaPorId(chassi));
			model.addAttribute("pessoa", veiculoDAO.buscaPorId(chassi).getPessoa());
			return "detalhesAluga";
		}
		return "redirect:listaVeiculos";
	}
}
