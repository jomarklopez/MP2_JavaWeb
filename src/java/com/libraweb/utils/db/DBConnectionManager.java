/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.libraweb.utils.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Patrick
 */
public class DBConnectionManager{
    private Connection con;
    
    public DBConnectionManager(String url, String user, String pass) {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            //System.out.println("WAWAWAW");
            this.con = DriverManager.getConnection(url, user, pass);
            //System.out.println(this.con);
        } catch (SQLException e) {
            System.out.println(e);
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();        
        }
    }
    
    public Connection getConnection(){
        return con;
    }
    
    public void closeConnection() throws SQLException {
        con.close();
    }
            
}
