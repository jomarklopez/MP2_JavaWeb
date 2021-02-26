/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.libraweb.routers;

import java.sql.*;
import com.libraweb.model.User;

public class UserRouter {
    
    public User authenticateUser(Connection con, String usernameInput, String passwordInput) throws SQLException,
            ClassNotFoundException,
            Exception {

        String sql = "SELECT * FROM USER_INFO WHERE username = ?";
        PreparedStatement statement = con.prepareStatement(sql);
        statement.setString(1, usernameInput);
        // Executes query
        ResultSet res = statement.executeQuery();
        User user = null;

        // If resultset is not empty returns a user then check the password if it matches
        if (res.next() == false) {
            throw new Exception("User does not exist");
        } else {
          do {
            if (res.getString("password").equals(passwordInput)) {
                user = new User();
                user.setName(res.getString("username"));
                user.setRole(res.getString("role"));
            } else {
                throw new Exception("Check your password");
            }
          } while (res.next());
        }
        
        res.close();
        statement.close();
        con.close();
 
        // If login is successful then return user object
        return user;
    }
}
