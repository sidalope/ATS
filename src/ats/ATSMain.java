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
public class ATSMain {
    
        public static void main(String [ ] args) {
            DBConnection connectionObject = new DBConnection();
            connectionObject.test();
        }
}

