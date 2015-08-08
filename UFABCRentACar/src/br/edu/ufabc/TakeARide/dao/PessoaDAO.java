package br.edu.ufabc.TakeARide.dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import br.edu.ufabc.TakeARide.modelo.Pessoa;

@Repository
public class PessoaDAO {
	
	@PersistenceContext
	private EntityManager manager;

	// insere um pessoa
	public void insere(Pessoa pessoa) {
		manager.persist(pessoa);
	}

	// remove um Pessoa
	public void remove(Pessoa pessoa) {
		Pessoa pessoaRemover = manager.find(Pessoa.class, pessoa.getCpf());
		manager.remove(pessoaRemover);
	}

	// altera dados de um pessoa
	public void altera(Pessoa pessoa) {
		manager.merge(pessoa);
	}

	// faz a busca de pessoa pelo ID
	public Pessoa buscaPorId(String cpf) {
		return manager.find(Pessoa.class, cpf);
	}

	// devolve uma lista com todos pessoas
	public List<Pessoa> getLista() {
		@SuppressWarnings("unchecked")
		List<Pessoa> pessoas = manager.createQuery("select a from Pessoa a")
				.getResultList();
		return pessoas;
	}

}
