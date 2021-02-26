/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.libraweb.routers;

import java.sql.*;
import com.libraweb.model.User;

public class UserRouter {
    
    public User authenticateUser(Connection con, String username, String password, String role) throws SQLException,
            ClassNotFoundException {
        
        String sql = "SELECT * FROM USER_INFO WHERE username = ? AND password = ? AND role = ?";
        PreparedStatement statement = con.prepareStatement(sql);
        statement.setString(1, username);
        statement.setString(2, password);
        statement.setString(3, role);
 
        ResultSet res = statement.executeQuery();
        User user = null;
        
        if (res.next()) {
            user = new User();
            System.out.println("asdasd");
            user.setName(res.getString("username"));
            user.setRole(res.getString("role"));
        }
        
        
        res.close();
        statement.close();
        con.close();
        System.out.println("CLOSED");
 
        return user;
    }
}
