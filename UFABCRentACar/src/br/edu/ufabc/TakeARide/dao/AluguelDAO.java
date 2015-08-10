package br.edu.ufabc.TakeARide.dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import br.edu.ufabc.TakeARide.modelo.Aluguel;

@Repository
public class AluguelDAO {
	
	@PersistenceContext
	private EntityManager manager;

	// insere um aluguel
	public void insere(Aluguel aluguel) {
		manager.persist(aluguel);
	}

	// remove um Aluguel
	public void remove(Aluguel aluguel) {
		Aluguel aluguelRemover = manager.find(Aluguel.class, aluguel.getId());
		manager.remove(aluguelRemover);
	}

	// altera dados de um aluguel
	public void altera(Aluguel aluguel) {
		manager.merge(aluguel);
	}

	// faz a busca de aluguel pelo ID
	public Aluguel buscaPorId(int id) {
		return manager.find(Aluguel.class, id);
	}

	// devolve uma lista com todos aluguels
	public List<Aluguel> getLista() {
		@SuppressWarnings("unchecked")
		List<Aluguel> aluguels = manager.createQuery("select a from Aluguel a")
				.getResultList();
		return aluguels;
	}

}
