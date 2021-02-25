/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.libraweb.utils.listener;

import java.sql.SQLException;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import com.libraweb.utils.db.DBConnectionManager;

/**
 *
 * @author Patrick
 */

public class ContextListener implements ServletContextListener {

    public void contextInitialized(ServletContextEvent event) {
    
        ServletContext sc = event.getServletContext();
        String url = sc.getInitParameter("jdbcDriverURL") + "://" + sc.getInitParameter("dbHostName") + ":" + sc.getInitParameter("dbPort") + "/" + sc.getInitParameter("dbName");
    	   System.out.println(sc.getInitParameter("jdbcDriverURL"));
        String username = sc.getInitParameter("databaseUsername");
    	String password = sc.getInitParameter("databasePassword");
    	//create database connection from init parameters and set it to context
        DBConnectionManager con = new DBConnectionManager(url, username, password);
        
        sc.setAttribute("DBConnection", con);
    }

    public void contextDestroyed(ServletContextEvent event) {
        ServletContext sc = event.getServletContext();
    	DBConnectionManager con = (DBConnectionManager) sc.getAttribute("DBConnection");
        try{
            con.closeConnection();
        } catch (SQLException e){
            
        }
    	System.out.println("Database connection closed for Application.");
    }
	
}
