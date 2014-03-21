package dbConnectivity;

import java.sql.*;
import java.util.Stack;
 
public class DBConnection {
	
	public static Connection connection = null;
	private Stack<Object> resultData = new Stack();
	private ResultSet resultSet = null;
	
	public DBConnection(){}
	
	/**Reads from the database if a connection is found.
	*still needs to 'return' something through populating resultData Field.
	*resultData should almost certainly become a stack.
	*/
	public void read(String stmtString) throws SQLException{
		PreparedStatement statement = null;
		//ResultSet resultSet = null;
		if(connection != null){
			statement = connection.prepareStatement(stmtString);
			resultSet = statement.executeQuery();
			getResultSet();
		}
	}
	public ResultSet getResultSet(){
		return resultSet;
	}
	
	//urgent: needs exception handlers, not just catching.
	//is having the same local variable names in read() and write() a problem? i.e. will reads and writes happen concurrently? shouldn't right?
	public void write(String stmtString){
		PreparedStatement statement = null;
		try{
			connection.prepareStatement(stmtString);	
			statement.executeUpdate();
		} catch (SQLException sqlE){}		
	}
	
	//connects to default database abpn980 on lamp.soi.city.ac.uk
	public void connect() throws SQLException{
			connection = DriverManager.getConnection("jdbc:mysql:https://www.lamp.soi.city.ac.uk/abpn980?user=abpn980&password=120047064");
	}
	
	public void dropConnection(){
		if(connection != null){
			try {connection.close();} catch (SQLException sqlE){}
		}
	}
	
	
	
	/**
	
	public int getCredentials (String username, String password) throws SQLException{
        Connection con = null;
        PreparedStatement statement = null;
       // PreparedStatement roleStatement = null;
        ResultSet resultSet= null;
       // ResultSet role= null;
        
        /**Validation defines the level of access granted
         * Manager = 1
         *Mechanic = 2
         *Receptionist = 3
         *Invalid = 0
        
        int validation = 0;
        
        try {
            con = DriverManager.getConnection(
            		//HOW DO I CONNECT TO THE SERVER MANAGED BY PHPMYADMIN???
                    "https://lamp.soi.city.ac.uk/");
            statement = con.prepareStatement("SELECT Password, JobRole FROM Users WHERE Username=\""+username+"\"");
            //roleStatement = con.prepareStatement("");
            resultSet = statement.executeQuery();
            //in case of update or delete, etc. use .executeUpdate()
	
        } finally {
                if(resultSet != null) {try {resultSet.close();} catch (SQLException sqlE){}}
                if(statement != null) {try {statement.close();} catch (SQLException sqlE){}}
                if(con != null) {try {con.close();} catch (SQLException sqlE){}}
            }
        return validation;
        
	}
*/
		
}
