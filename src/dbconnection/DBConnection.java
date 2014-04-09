package dbconnection;

import java.sql.*;
import java.util.Stack;
import java.util.logging.Level;
import java.util.logging.Logger;
 
public  class DBConnection {
	
	public static Connection connection     =   null;
	private Stack<Object> resultData        =   new Stack();
	private ResultSet resultSet             =   null;
        private String url;
	
	public DBConnection(String url){
            this.url = url;
            try {
                connect(url);
                //TEST
                if(connection != null){
                    System.out.println("connection OK");
                }
                //this.write("INSERT INTO Blank(blankID) VALUES (765432)");
            } catch (SQLException ex) {
                Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        public DBConnection(String db, String user, String password){
            url = "jdbc:mysql://lamp2010.soi.city.ac.uk/"+db+"?user="+user+"&password="+password;
            try {
                connect(url);
                //TEST
                if(connection != null){
                    System.out.println("connection OK");
                }
                //this.write("INSERT INTO Blank(blankID) VALUES (765432)");
            } catch (SQLException ex) {
                Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        public DBConnection(){
            
        }
        
	
        
	/**Reads from the database if a connection is found.
	*still needs to 'return' something through populating resultData Field.
	*resultData should almost certainly become a stack.
	*/
	public void read(String stmtString){
		PreparedStatement statement = null;
		//ResultSet resultSet = null;
		if(connection != null){
                    try {
                        statement = connection.prepareStatement(stmtString);
                        resultSet = statement.executeQuery();
                    } catch (SQLException ex) {
                        Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
                    }
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
                    statement = connection.prepareStatement(stmtString);	
                    statement.executeUpdate();
		} catch (SQLException sqlE){}		
	}
	
	//(should) connect to default database in1010grp4 on lamp.soi.city.ac.uk
	public final void connect(String aUrl) throws SQLException{
          //  try {
                connection = DriverManager.getConnection(aUrl);
          //  } catch (SQLException ex) {
          //      Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
          //  }
            
            if (connection == null){
                System.out.println("Connection Null");
            } else {
                if(connection != null){
                    System.out.println("Aw yeah.");
                }
            }
        }
        //?user=abpn980&password=120047064
	
	public void dropConnection(){
		if(connection != null){
			try {connection.close();} catch (SQLException sqlE){}
		}
	}
}
        /*
        public void test(){
            connect();
            write("INSERT INTO Blank(blankID) VALUES (7654321)");
        }
	*/
	
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
		
