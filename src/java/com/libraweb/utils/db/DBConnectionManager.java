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
    String url;
    String user;
    String pass;
    Connection c;
    
    public DBConnectionManager(String url, String user, String pass) throws SQLException{
        url = this.url;
        user = this.url;
        pass = this.url;
        c = DriverManager.getConnection(url, user, pass);
        
    }
    
    public Connection getConnection(){
        return this.c;
    }
    
    public void closeConnection() throws SQLException {
        c.close();
    }
            
}
