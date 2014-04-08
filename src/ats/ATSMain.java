/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ats;

import dbconnection.DBConnection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author abpn980
 */
public class ATSMain{
    
    public ATSMain(){
        DBConnection connectionObject = new DBConnection();
        try {
            connectionObject.connect("INSERT INTO Blank(blankID) VALUES (7654321)");
        } catch (SQLException ex) {
            Logger.getLogger(ATSMain.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
        public static void main(String [ ] args) throws SQLException {
            
            }
}

