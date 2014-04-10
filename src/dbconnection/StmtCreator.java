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
        
        //1-9 to panelope pitstop
        while(i<10){
            numbers = code + "0000000" + String.valueOf(i);
            statement444 = statement444 + "(" + numbers + ", \"Assigned\", " + code + ", 250, '2013-04-01', '2013-04-01'), ";
            i = i+1;
        }
        //10-20 to penelope pitstop
        while(i<21){
            numbers = code + "000000" + String.valueOf(i);
            statement444 = statement444 + "(" + numbers + ", \"Assigned\", " + code + ", 250, '2013-04-01', '2013-04-01'), ";
            i = i+1;
        }
        //21-40 to Dennis Menace
        while(i<41){
            numbers = code + "000000" + String.valueOf(i);
            statement444 = statement444 + "(" + numbers + ", \"Assigned\", " + code + ", 211, '2013-04-01', '2013-04-05'), ";
            i = i+1;
        }
        while(i<100){
            numbers = code + "000000" + String.valueOf(i);
            statement444 = statement444 + "(" + numbers + ", NULL, " + code + ", NULL, '2013-04-01', NULL), ";
            i = i+1;
        }
        if(i == 100){
            numbers = code + "00000" + String.valueOf(i);
            statement444 = statement444 + "(" + numbers + ", NULL, " + code + ", NULL, '2013-04-01', NULL);";
            i = i+1;
        }
    }
    private void statement420(){
        int i = 1;
        String code = "420";
        
        String numbers = "";
        
        //1-9 to penelope pitstop
        while(i<10){
            numbers = code + "0000000" + String.valueOf(i);
            statement420 = statement420 + "(" + numbers + ", \"Assigned\", " + code + ", 250, '2013-05-08', '2013-05-08'), ";
            i = i+1;
        }
        //10-30 to penelope pitstop
        while(i<31){
            numbers = code + "000000" + String.valueOf(i);
            statement420 = statement420 + "(" + numbers + ", \"Assigned\", " + code + ", 250, '2013-05-08', '2013-05-08'), ";
            i = i+1;
        }
        
        //31-50 to dennis menace
        while(i<51){
            numbers = code + "000000" + String.valueOf(i);
            statement420 = statement420 + "(" + numbers + ", \"Assigned\", " + code + ", 211, '2013-05-08', '2013-05-10'), ";
            i = i+1;
        }
        
        while(i<100){
            numbers = code + "000000" + String.valueOf(i);
            statement420 = statement420 + "(" + numbers + ", NULL, " + code + ", NULL, '2013-05-08', NULL), ";
            i = i+1;
        }
        if(i == 100){
            numbers = code + "00000" + String.valueOf(i);
            statement420 = statement420 + "(" + numbers + ", NULL, " + code + ", NULL, '2013-05-08', NULL);";
            i = i+1;
        }
    }
    private void statement201(){
        int i = 1;
        String code = "201";
        
        String numbers = "";
        //1-9 to penelope pitstop
        while(i<10){
            numbers = code + "0000000" + String.valueOf(i);
            statement201 = statement201 + "(" + numbers + ", \"Assigned\", " + code + ", 250, '2013-06-03', '2013-06-03'), ";
            i = i+1;
        }
        //10 to penelope pitstop
        while(i<11){
            numbers = code + "000000" + String.valueOf(i);
            statement201 = statement201 + "(" + numbers + ", \"Assigned\", " + code + ", 250, '2013-06-03', '2013-06-03'), ";
            i = i+1;
        }
        
        //11-25 to dennis menace
        while(i<26){
            numbers = code + "000000" + String.valueOf(i);
            statement201 = statement201 + "(" + numbers + ", \"Assigned\", " + code + ", 211, '2013-06-03', '2013-06-15'), ";
            i = i+1;
        }
        
        while(i<100){
            numbers = code + "000000" + String.valueOf(i);
            statement201 = statement201 + "(" + numbers + ", NULL, " + code + ", NULL, '2013-06-03', NULL), ";
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
            statement101 = statement101 + "(" + numbers + ", \"Assigned\", " + code + ", 211, '2013-07-09', '2013-07-11'), ";
            i = i+1;
        }
        while(i<50){
            numbers = code + "000000" + String.valueOf(i);
            statement101 = statement101 + "(" + numbers + ", \"Assigned\", " + code + ", 211, '2013-07-09', '2013-07-11'), ";
            i = i+1;
        }
        if(i==50){
            numbers = code + "000000" + String.valueOf(i);
            statement101 = statement101 + "(" + numbers + ", \"Assigned\", " + code + ", 211, '2013-07-09', '2013-07-11'); ";
            i = i+1;
        }
        
    }
    
    

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        StmtCreator stmtCreator = new StmtCreator();
        
    }
}
