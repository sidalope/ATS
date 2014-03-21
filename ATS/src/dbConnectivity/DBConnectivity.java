package dbConnectivity;
 
//SERIOUSLY, IS THIS CLASS USEFUL? WHY NOT JUST DBCONNECTION?

import java.sql.*;


public abstract class DBConnectivity {

	Connection connection = null;
	
	public void read(String stmtString){
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		
		connect();
		statement = connection.prepareStatement(stmtString);
		resultSet statement.executeQuery();
	}
	
	//is having the same variable names a problem? i.e. will reads and writes happen concurrently? shouldn't right?
	public void write(){
		PreparedStatement statement = null;
	}
	//ABCD123
	public void connect(){
		
		
		try{
			//PASSWORD MISSING
			connection = DriverManager.getConnection("jdbc:mysql:https://www.lamp.soi.city.ac.uk", "abpn980", "");
		} finally {
			
		}
	}
}
