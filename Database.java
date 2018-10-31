/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javaapplication6;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author triad
 */
public class Database {
    String url = "jdbc:mysql://localhost:3306/techbank";
    String user = "root";
    String password = "";
    public Database(){}
    
    public Connection getConnection(){
        try {
            Connection c = DriverManager.getConnection(url, user, password);
            return c;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    public ResultSet getData(String table){
        try {
            String sql = "SELECT * FROM " + table;
            PreparedStatement pt = getConnection().prepareStatement(sql);
            ResultSet rs = pt.executeQuery();
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        
    }
    
}
