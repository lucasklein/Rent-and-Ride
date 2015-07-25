package br.edu.ufabc.TakeARide.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {

	public Connection getConnection() {
		System.out.println("Conectando ao banco de dados");
		try {
			Class.forName("org.h2.Driver");
			String url = "jdbc:h2:tcp://localhost/~/rentacar";
			return DriverManager.getConnection(url, "admin", "admin");
			
			
		} catch (SQLException | ClassNotFoundException e) {
			throw new RuntimeException(e);
		}
	}
}