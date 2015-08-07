package br.edu.ufabc.TakeARide.dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import br.edu.ufabc.TakeARide.modelo.Carona;

@Repository
public class CaronaDAO {
	
	@PersistenceContext
	private EntityManager manager;

	// insere um carona
	public void insere(Carona carona) {
		manager.persist(carona);
	}

	// remove um Carona
	public void remove(Carona carona) {
		Carona caronaRemover = manager.find(Carona.class, carona.getId());
		manager.remove(caronaRemover);
	}

	// altera dados de um carona
	public void altera(Carona carona) {
		manager.merge(carona);
	}

	// faz a busca de carona pelo ID
	public Carona buscaPorId(Long id) {
		return manager.find(Carona.class, id);
	}

	// devolve uma lista com todos caronas
	public List<Carona> getLista() {
		@SuppressWarnings("unchecked")
		List<Carona> caronas = manager.createQuery("select a from Carona a")
				.getResultList();
		return caronas;
	}

}
