package br.edu.ufabc.TakeARide.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;

@Controller
public class MainController {
	@RequestMapping("novoCadastro")
	public String cadastrar(Model model)	{
		return "cadastro";
	}
	
	@RequestMapping("/")
	public String start(Model model)	{
		return "index";
	}
}
