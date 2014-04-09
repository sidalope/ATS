/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dbconnection;

/**
 *
 * @author abpn980
 */
public class StmtCreator {
    
    private String statement444 = "INSERT INTO Blank(blankID, blankStatus, blankCode, userID, dateAdded, dateAssigned) VALUES ";
    private String statement420 = "INSERT INTO Blank(blankID, blankStatus, blankCode, userID, dateAdded, dateAssigned) VALUES ";
    private String statement201 = "INSERT INTO Blank(blankID, blankStatus, blankCode, userID, dateAdded, dateAssigned) VALUES ";
    private String statement101 = "INSERT INTO Blank(blankID, blankStatus, blankCode, userID, dateAdded, dateAssigned) VALUES ";
    
    /*
     * INSERT INTO Blank(blankID, blankStatus, blankCode, userID, dateAdded, dateAssigned) VALUES
     * 444 1-100
     * 420 1-100
     * 201 1-100
     * 101 1-50
     */
    
    
    
    private StmtCreator(){
        
        statement444();
        statement420();
        statement201();
        statement101();
        
        System.out.println(statement444);
        System.out.println("");
        System.out.println("");
        System.out.println("");
        System.out.println("");
        System.out.println(statement420);
        System.out.println("");
        System.out.println("");
        System.out.println("");
        System.out.println("");
        System.out.println(statement201);
        System.out.println("");
        System.out.println("");
        System.out.println("");
        System.out.println("");
        System.out.println(statement101);
        System.out.println("");
        System.out.println("");
        System.out.println("");
        System.out.println("");
    }
    
    
    private void statement444(){
        int i = 1;
        String code = "444";
        
        String numbers = "";
        
        while(i<10){
            numbers = code + "0000000" + String.valueOf(i);
            statement444 = statement444 + "(" + numbers + ", NULL, " + code + ", NULL, 2013-04-01, NULL), ";
            i = i+1;
        }
        while(i<100){
            numbers = code + "000000" + String.valueOf(i);
            statement444 = statement444 + "(" + numbers + ", NULL, " + code + ", NULL, 2013-04-01, NULL), ";
            i = i+1;
        }
        if(i == 100){
            numbers = code + "00000" + String.valueOf(i);
            statement444 = statement444 + "(" + numbers + ", NULL, " + code + ", NULL, 2013-04-01, NULL);";
            i = i+1;
        }
    }
    private void statement420(){
        int i = 1;
        String code = "420";
        
        String numbers = "";
        
        while(i<10){
            numbers = code + "0000000" + String.valueOf(i);
            statement420 = statement420 + "(" + numbers + ", NULL, " + code + ", NULL, 2013-05-08, NULL), ";
            i = i+1;
        }
        while(i<100){
            numbers = code + "000000" + String.valueOf(i);
            statement420 = statement420 + "(" + numbers + ", NULL, " + code + ", NULL, 2013-05-08, NULL), ";
            i = i+1;
        }
        if(i == 100){
            numbers = code + "00000" + String.valueOf(i);
            statement420 = statement420 + "(" + numbers + ", NULL, " + code + ", NULL, 2013-05-08, NULL);";
            i = i+1;
        }
    }
    private void statement201(){
        int i = 1;
        String code = "201";
        
        String numbers = "";
        
        while(i<10){
            numbers = code + "0000000" + String.valueOf(i);
            statement201 = statement201 + "(" + numbers + ", NULL, " + code + ", NULL, 2013-06-03, NULL), ";
            i = i+1;
        }
        while(i<100){
            numbers = code + "000000" + String.valueOf(i);
            statement201 = statement201 + "(" + numbers + ", NULL, " + code + ", NULL, 2013-06-03, NULL), ";
            i = i+1;
        }
        if(i == 100){
            numbers = code + "00000" + String.valueOf(i);
            statement201 = statement201 + "(" + numbers + ", NULL, " + code + ", NULL, 2013-06-03, NULL);";
            i = i+1;
        }
    }
    
    private void statement101(){
        int i = 1;
        String code = "101";
        
        String numbers = "";
        
        while(i<10){
            numbers = code + "0000000" + String.valueOf(i);
            statement101 = statement101 + "(" + numbers + ", NULL, " + code + ", NULL, 2013-07-09, NULL), ";
        
        }
        while(i<50){
            numbers = code + "000000" + String.valueOf(i);
            statement101 = statement101 + "(" + numbers + ", NULL, " + code + ", NULL, 2013-07-09, NULL), ";
            i = i+1;
        }
        if(i==50){
            numbers = code + "000000" + String.valueOf(i);
            statement101 = statement101 + "(" + numbers + ", NULL, " + code + ", NULL, 2013-07-09, NULL); ";
            i = i+1;
        }
        
    }
    
    

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        StmtCreator stmtCreator = new StmtCreator();
        String var = args[0];
    }
}
