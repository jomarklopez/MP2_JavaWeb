/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.libraweb.routers;

import java.sql.*;
import com.libraweb.model.User;

public class UserRouter {
    
    public User authenticateUser(Connection con, String email, String password) throws SQLException,
            ClassNotFoundException {
        
        // Connection connection = DB manager 
        
        String sql = "SELECT * FROM userDB WHERE email = ? and password = ?";
        PreparedStatement statement = con.prepareStatement(sql);
 
        ResultSet result = statement.executeQuery();
 
        User user = null;
 
        if (result.next()) {
            user = new User();
            user.setName(result.getString("name"));
            user.setEmail(email);
        }
        
        return user;
    }
}
