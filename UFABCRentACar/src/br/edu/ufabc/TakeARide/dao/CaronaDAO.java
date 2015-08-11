package br.edu.ufabc.TakeARide.dao;

import java.util.Date;
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
	public Carona buscaPorId(int id) {
		return manager.find(Carona.class, id);
	}

	// devolve uma lista com todos caronas
	public List<Carona> getLista() {
		@SuppressWarnings("unchecked")
		List<Carona> caronas = manager.createQuery("select a from Carona a")
				.getResultList();
		return caronas;
	}
	
	public List<Carona> getListaDisponiveis() {
		Date date = new Date();
		
		@SuppressWarnings("unchecked")
		List<Carona> caronas = manager.createQuery("select a from Carona a where a.qtd_vagas_disponiveis > :qtd AND a.data_saida > :data").setParameter("qtd", 0).setParameter("data", date)
				.getResultList();
		return caronas;
	}

}
