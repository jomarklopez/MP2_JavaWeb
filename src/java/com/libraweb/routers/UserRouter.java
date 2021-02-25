/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.libraweb.routers;

import java.sql.*;
import com.libraweb.model.User;
import com.libraweb.utils.db.DBConnectionManager;

public class UserRouter {
    
    public User authenticateUser(String email, String password) throws SQLException,
            ClassNotFoundException {
        
        // Connection connection = DB manager 
        String sql = "SELECT * FROM users WHERE email = ? and password = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, email);
        statement.setString(2, password);
 
        ResultSet result = statement.executeQuery();
 
        User user = null;
 
        if (result.next()) {
            user = new User();
            user.setName(result.getString("fullname"));
            user.setEmail(email);
        }
 
        connection.close();
        return user;
    }
}
