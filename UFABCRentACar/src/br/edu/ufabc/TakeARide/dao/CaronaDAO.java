package br.edu.ufabc.TakeARide.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import br.edu.ufabc.TakeARide.modelo.Carona;

public class CaronaDAO {
	
	private EntityManagerFactory factory;
	private EntityManager manager;
	
	public CaronaDAO(){
		factory = Persistence.createEntityManagerFactory("TakeARide");
		manager = factory.createEntityManager();
	}
	
	public void insereCarona(Carona carona){
				
		try{
			manager.getTransaction().begin();
			manager.persist(carona);
			manager.getTransaction().commit();
		}finally{
			if(manager.getTransaction().isActive()){
				manager.getTransaction().rollback();
			}
		}
		manager.close();
		
	}
	
	public List<Carona> listCaronas(){
		
		
		@SuppressWarnings("unchecked")
		List<Carona> caronas = manager.createQuery("select a from Carona a").getResultList();
		manager.close();
		
		return caronas;
		
	}
	


}
