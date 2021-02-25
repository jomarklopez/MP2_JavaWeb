/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.libraweb.utils;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 *
 * @author Patrick
 */
public class ContextListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext sc = sce.getServletContext();
    	
    	String url = sc.getInitParameter("");
    	String u = sc.getInitParameter("databaseUsername");
    	String p = sc.getInitParameter("databasePassword");
    	
    	//create database connection from init parameters and set it to context
        try {
            DbManager dbManager = new DbManager(url, u, p);
            sc.setAttribute("DbManager", dbManager);
            System.out.println("Database connection initialized for Application.");
        } catch (SQLException e) {
        
        }
            
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        ServletContext sc = sce.getServletContext();
    	DbManager dbManager = (DbManager) sc.getAttribute("DbManager");
        try{
            dbManager.closeConnection();
        } catch (SQLException e){
            
        }
    	System.out.println("Database connection closed for Application.");
    }
	
}
