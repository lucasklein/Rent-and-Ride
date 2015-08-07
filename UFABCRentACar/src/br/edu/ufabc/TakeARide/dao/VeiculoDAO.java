package br.edu.ufabc.TakeARide.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import br.edu.ufabc.TakeARide.modelo.Veiculo;

public class VeiculoDAO {
	
	private EntityManagerFactory factory;
	private EntityManager manager;
	
	public VeiculoDAO(){
		factory = Persistence.createEntityManagerFactory("TakeARide");
		manager = factory.createEntityManager();
	}
	
	public void insereCarona(Veiculo veiculo){
				
		try{
			manager.getTransaction().begin();
			manager.persist(veiculo);
			manager.getTransaction().commit();
		}finally{
			if(manager.getTransaction().isActive()){
				manager.getTransaction().rollback();
			}
		}
		manager.close();
		
	}
	
public List<Veiculo> listVeiculos(){
		
		
		@SuppressWarnings("unchecked")
		List<Veiculo> veiculos = manager.createQuery("select a from Veiculo a").getResultList();
		manager.close();
		
		return veiculos;
		
	}

}
