package br.edu.ufabc.TakeARide.dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import br.edu.ufabc.TakeARide.modelo.Veiculo;

@Repository
public class VeiculoDAO {
	
	@PersistenceContext
	private EntityManager manager;

	// insere um veiculo
	public void insere(Veiculo veiculo) {
		manager.persist(veiculo);
	}

	// remove um Veiculo
	public void remove(Veiculo veiculo) {
		Veiculo veiculoRemover = manager.find(Veiculo.class, veiculo.getChassi());
		manager.remove(veiculoRemover);
	}

	// altera dados de um veiculo
	public void altera(Veiculo veiculo) {
		manager.merge(veiculo);
	}

	// faz a busca de veiculo pelo ID
	public Veiculo buscaPorId(String chassi) {
		return manager.find(Veiculo.class, chassi);
	}

	// devolve uma lista com todos veiculos
	public List<Veiculo> getLista() {
		@SuppressWarnings("unchecked")
		List<Veiculo> veiculos = manager.createQuery("select a from Veiculo a")
				.getResultList();
		return veiculos;
	}
	
	public List<Veiculo> getListaDisponiveis() {
		@SuppressWarnings("unchecked")
		List<Veiculo> veiculos = manager.createQuery("select a from Veiculo a where status=1")
				.getResultList();
		return veiculos;
	}

}
