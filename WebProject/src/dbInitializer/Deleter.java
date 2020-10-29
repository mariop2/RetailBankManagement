package dbInitializer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import webproject.bank.bankDB;

public class Deleter {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		//delete all tables when completed
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "system";
		String password = "12345";
		
		//loading driver
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		//getting connection
		Connection con = DriverManager.getConnection(url, user, password);
		
		System.out.println(con);
		
		
		try {
			bankDB.deleteDBTbls(con);
			con.close();
			System.out.println("Tables Deleted");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		

	}

}
