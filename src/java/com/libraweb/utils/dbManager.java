/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.libraweb.utils;
import java.sql.Connection;
/**
 *
 * @author Patrick
 */
public void dbManager(ServletConfig config) throws servletException
{
    Connection c;
    super.init(config);
    try {	
        Class.forName(config.getInitParameter("jdbcClassName"));
        String username = config.getInitParameter("databaseUsername");
        String password = config.getInitParameter("databasePassword");
        StringBuffer url = new StringBuffer(config.getInitParameter("jdbcDriverURL"))
            .append("://")
            .append(config.getInitParameter("databaseHostName"))
            .append(":")
            .append(config.getInitParameter("databasePort"))
            .append("/")
            .append(config.getInitParameter("databaseName"));
            c = DriverManager.getConnection(url.toString(),username,password);
            } catch (SQLException sqle){
                    System.out.println("SQLException error occured - " 
                            + sqle.getMessage());
            } catch (ClassNotFoundException nfe){
                    System.out.println("ClassNotFoundException error occured - " 
                    + nfe.getMessage());
            }
}
public Connection getConnection()
{
    return this.c;
}
public void closeConnection()
{
    c.close();
}
