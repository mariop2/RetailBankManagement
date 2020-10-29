package webproject.bank;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class dbController {
	
	
	
	//insert customer to table using prepared statement
	public static boolean createCustomer(int id, String name, int age, String adr1, String adr2, String city, String state, String status, String msg, String lastUpdate, Connection con) throws SQLException{
		
		String q = "INSERT INTO tbl_Customer(id , name, age, adr1, adr2, city, state, status, msg, lastUpdated) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		PreparedStatement pst = con.prepareStatement(q);
		pst.setInt(1,id);
		pst.setString(2, name);
		pst.setInt(3, age);
		pst.setString(4, adr1);
		pst.setString(5, adr2);
		pst.setString(6, city);
		pst.setString(7, state);
		pst.setString(8, status);
		pst.setString(9, msg);
		pst.setString(10, lastUpdate);
		
		
		//ResultSet rs = pst.executeQuery();
		//or
		int cnt = pst.executeUpdate();
		if(cnt == 1){
			return true;
		}else {
			return false;
		}
		
		
		
	}
	

	public static boolean createAccount(int id, String type, int balance, String status, String msg, String lastUpdated, int customerId, Connection con) throws SQLException{
		
		String q = "INSERT INTO tbl_Account(id , type, balance, status, msg, lastUpdated) VALUES (?, ?, ?, ?, ?, ?)";
		
		PreparedStatement pst = con.prepareStatement(q);
		pst.setInt(1,id);
		pst.setString(2, type);
		pst.setInt(3, balance);
		pst.setString(4, status);
		pst.setString(5, msg);
		pst.setString(6, lastUpdated);
		
		//ResultSet rs = pst.executeQuery();
		//or
		int cnt = pst.executeUpdate();
		if(cnt == 1){
			return addToLinkTbl(customerId, id, con);
		}else {
			return false;
		}
		
		
		
		
	}
	
	static boolean addToLinkTbl(int customerId, int accountId, Connection con) throws SQLException{
		
		String q = "INSERT INTO tbl_Intermediate(customerId , accountId) VALUES (?, ?)";
		
		PreparedStatement pst = con.prepareStatement(q);
		pst.setInt(1,customerId);
		pst.setInt(2, accountId);
		
		//ResultSet rs = pst.executeQuery();
		//or
		int cnt = pst.executeUpdate();
		if(cnt == 1){
			return true;
		}else{
			return false;
		}
		
		
	}
	

	public static boolean createExecutiveLogin(int username, String pwd, Connection con) throws SQLException{
		
		String q = "INSERT INTO tbl_LoginCredentials(username , password) VALUES (?, ?)";
		
		PreparedStatement pst = con.prepareStatement(q);
		pst.setInt(1,username);
		pst.setString(2, pwd);
		
		//ResultSet rs = pst.executeQuery();
		//or
		int cnt = pst.executeUpdate();
		if(cnt == 1){
			return true;
		}else {
			return false;
		}
		
		
		
		
	}
	
	static boolean deleteCustomer(int accountId, Connection con) throws SQLException{
		
		String q = "DELETE FROM tbl_Customer WHERE id = ?";
		
		PreparedStatement pst = con.prepareStatement(q);
		pst.setInt(1,accountId);
		
		int cnt = pst.executeUpdate();
		if(cnt == 1){
			return true;
		}else{
			return false;
		}
		
		
		
	}
	
	static boolean isValidCredentials(int userName, String userPwd, Connection con) throws SQLException{
		
		
		String q = "SELECT * from tbl_LoginCredentials WHERE username = ? AND password = ?";
		
		PreparedStatement pst = con.prepareStatement(q);
		pst.setInt(1,userName);
		pst.setString(2,userPwd);
		
		//int cnt = pst.executeUpdate();
		ResultSet results = pst.executeQuery();
		
		if (!results.isBeforeFirst() ) {    
		    System.out.println("No data"); 
		    return false;
		} else{
			return true;
		}
	
		
	}

	

}
