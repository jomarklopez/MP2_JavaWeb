/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.libraweb.routers;

import java.sql.*;
import com.libraweb.model.User;
import com.libraweb.utils.exceptions.AuthException;
import com.libraweb.utils.exceptions.NullValueException;

public class UserRouter {
    
    public User authenticateUser(Connection con, String usernameInput, String passwordInput) throws SQLException,
            ClassNotFoundException, AuthException, NullValueException {

        if(usernameInput.equals("") && passwordInput.equals("")) {
            throw new NullValueException("Username and Password cannot be blank");
        } else if (usernameInput.equals("")) {
            throw new NullValueException("Username cannot be blank");
        } else if (passwordInput.equals("")) {
            throw new NullValueException("Password cannot be blank");
        }
        
        String sql = "SELECT * FROM USER_INFO WHERE username = ?";
        PreparedStatement statement = con.prepareStatement(sql);
        statement.setString(1, usernameInput);
        // Executes query
        ResultSet res = statement.executeQuery();
        User user = null;
        
        // If resultset is not empty returns a user then check the password if it matches
        // Error-3
        if (res.next() == false) {
            throw new AuthException("User does not exist");
        } else {
          do {
            if (res.getString("password").equals(passwordInput)) {
                user = new User();
                user.setName(res.getString("username"));
                user.setPassword(res.getString("password"));
                user.setRole(res.getString("role"));
            } else {
                // Error-2
                throw new AuthException("Check your password");
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
