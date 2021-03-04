package com.libraweb.utils.listeners;

import javax.servlet.*;
import com.libraweb.model.User;

public class UserContextListener implements ServletContextListener {
    
    @Override
    public void contextInitialized(ServletContextEvent event) {
        ServletContext sc = event.getServletContext();
        User user = new User();
    }
    
    @Override
    public void contextDestroyed(ServletContextEvent event) {
    }
}