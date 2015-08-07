package br.edu.ufabc.TakeARide.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import br.edu.ufabc.TakeARide.modelo.Pessoa;

public class PessoaDAO {
	private EntityManagerFactory factory;
	private EntityManager manager;
	
	public PessoaDAO(){
		factory = Persistence.createEntityManagerFactory("pessoas");
		manager = factory.createEntityManager();
	}
	
	public void cadastraPessoa(Pessoa pessoa){
				
		try{
			manager.getTransaction().begin();
			manager.persist(pessoa);
			manager.getTransaction().commit();
		}finally{
			if(manager.getTransaction().isActive()){
				manager.getTransaction().rollback();
			}
		}
		manager.close();
		
	}

}
