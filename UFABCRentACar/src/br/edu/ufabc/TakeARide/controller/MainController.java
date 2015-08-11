package br.edu.ufabc.TakeARide.controller;

import java.util.List;

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
		return "redirect:/";
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
		return "redirect:listaVeiculos";
	}
	
	@Transactional
	@RequestMapping("removeVeiculo")
	public String remove(String chassi, Model model){
		if(chassi != null){
			Veiculo veiculo = veiculoDAO.buscaPorId(chassi);
			if(veiculo.getAlugueis().size() == 0)
				veiculoDAO.remove(veiculo);
			return "redirect:meusDados";
		}
		return "redirect:meusDados";
	}
	
	@Transactional
	@RequestMapping("insereCarona")
	public String insere(@Valid Carona carona, BindingResult result) {
		if (result.hasErrors()) {
			return "cadastroCarona";
		}
		carona.setPessoa(pessoaSessao);
		carona.setQtd_vagas_disponiveis(carona.getQtd_vagas());
		caronaDAO.insere(carona); 
		System.out.println("----> Nova carona cadastrado!");
		return "redirect:listaVeiculos";
	}
	
	@Transactional
	@RequestMapping("removeCarona")
	public String remove(int id, Model model){
		if(id > 0){
			Carona carona = caronaDAO.buscaPorId(id);
			caronaDAO.remove(carona);

			return "redirect:meusDados";
		}
		return "redirect:meusDados";
	}
	
	@Transactional
	@RequestMapping("pedirCarona")
	public String altera(int id, Model model){
		if(id > 0){
			Carona carona = caronaDAO.buscaPorId(id);
			carona.setQtd_vagas_disponiveis(carona.getQtd_vagas_disponiveis() - 1);
			caronaDAO.altera(carona);

			return "redirect:listaVeiculos";
		}
		return "redirect:detalhesCarona";
	}
	
	@Transactional
	@RequestMapping("insereAluguel")
	public String insere(@Valid AluguelSerializer serializer, BindingResult result) {
		if (result.hasErrors()) {
			return "detalhesAluga";
		}
		Pessoa dono = pessoaDAO.buscaPorId(serializer.getIdPessoa());
		Veiculo veiculo = veiculoDAO.buscaPorId(serializer.getIdVeiculo());
		veiculo.setStatus(1);
		
		Aluguel aluguel = new Aluguel();
		
		aluguel.serialize(serializer);
		aluguel.setPessoa(dono);
		aluguel.setVeiculo(veiculo);
		aluguel.setLocatario(pessoaSessao);

		aluguelDAO.insere(aluguel);
		veiculoDAO.altera(veiculo);

		return "redirect:listaVeiculos";
	}
	
	@Transactional
	@RequestMapping("removeAluguel")
	public String removeAluguel(int id, Model model){
		if(id > 0){
			Aluguel aluguel = aluguelDAO.buscaPorId(id);
			
			Veiculo veiculo = veiculoDAO.buscaPorId(aluguel.getVeiculo().getChassi());
			veiculo.setStatus(0);
			
			aluguelDAO.remove(aluguel);
			veiculoDAO.altera(veiculo);
			
			return "redirect:meusDados";
		}
		return "redirect:meusDados";
	}
	
	
	@RequestMapping("listaVeiculos")
	public String listaVeiculos(Model model) {
		model.addAttribute("veiculos", veiculoDAO.getListaDisponiveis());
		model.addAttribute("caronas", caronaDAO.getListaDisponiveis());
		return "firstPage";
	}
	
	
	@RequestMapping("sucesso")
	public String sucesso(Model model){
		return "sucesso";
	}
	
	@RequestMapping("meusDados")
	public String meusDados(Model model){
		
		pessoaSessao = pessoaDAO.buscaPorId(pessoaSessao.getCpf());
		
		model.addAttribute("pessoa", pessoaSessao);
		model.addAttribute("veiculos", pessoaSessao.getVeiculos());
		model.addAttribute("aluguels", pessoaSessao.getAlugueis());
		model.addAttribute("caronas", pessoaSessao.getCaronas());
		
		List<Aluguel> alugueisSolicitados = aluguelDAO.getLista();
		System.out.println("Size->" + alugueisSolicitados.size());
		for(int i=0;i < alugueisSolicitados.size();i++){
			System.out.println("l1:" + alugueisSolicitados.get(i).getLocatario().getCpf() + " l2:" + pessoaSessao.getCpf());
			System.out.println(alugueisSolicitados.get(i).getLocatario().getCpf().equals(pessoaSessao.getCpf()));
			if(!alugueisSolicitados.get(i).getLocatario().getCpf().equals(pessoaSessao.getCpf())){
				alugueisSolicitados.remove(i);	
				System.out.println("Removi" + i);
			}
		}
		
		model.addAttribute("aluguelsSolicitados", alugueisSolicitados);
		
		return "meusDados";	
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
