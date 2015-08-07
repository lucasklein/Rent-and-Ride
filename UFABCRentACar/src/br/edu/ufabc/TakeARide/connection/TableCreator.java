package br.edu.ufabc.TakeARide.connection;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class TableCreator {
	
	public static void main(String[] args){
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("pessoas");
		
		System.out.println("Tabela Gerada!\n");
		factory.close();
	}

}
