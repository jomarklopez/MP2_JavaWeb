/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package routers;

import java.sql.*;
import model.User;
import exceptions.AuthException;
import exceptions.NullValueException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import utils.Security;

public class UserRouter {
    
    public User authenticateUser(Connection con, String usernameInput, String passwordInput) throws SQLException,
            ClassNotFoundException, AuthException, NullValueException {

        if(usernameInput.equals("") && passwordInput.equals("")) {
            throw new NullValueException("Username and Password cannot be blank.");
        } else if (usernameInput.equals("")) {
            throw new NullValueException("Username cannot be blank.");
        } else if (passwordInput.equals("")) {
            throw new NullValueException("Password cannot be blank.");
        }
        // Encrypting the Password
        String encryptedPassword = Security.encrypt(passwordInput);
        
        String sql = "SELECT * FROM USERS WHERE USERNAME = ?";
        PreparedStatement statement = con.prepareStatement(sql);
        statement.setString(1, usernameInput);
        // Executes query
        ResultSet res = statement.executeQuery();
        User user = null;
              
        // If resultset is not empty returns a user then check the password if it matches
        // Error-3
        if (res.next() == false) {
            throw new AuthException("User does not exist.");
        } else {
          do {
            if (res.getString("password").equals(encryptedPassword)) {
                user = new User();
                user.setName(res.getString("username"));
                user.setPassword(res.getString("password"));
                user.setRole(res.getString("role"));
                user.setUserID(res.getString("user_id"));
            } else {
                // Error-2
                throw new AuthException("Check your password.");
            }
          } while (res.next());
        }
        
        // If login is successful then return user object
        return user;
    }
    
    public void createUser(Connection con, String usernameInput, String passwordInput, String roleInput) throws SQLException, NullValueException {
        
        if(usernameInput.equals("") && passwordInput.equals("")) {
            throw new NullValueException("Username and Password cannot be blank.");
        } else if (usernameInput.equals("")) {
            throw new NullValueException("Username cannot be blank.");
        } else if (passwordInput.equals("")) {
            throw new NullValueException("Password cannot be blank.");
        }
        
        String query = "INSERT INTO USERS (Username, Password, Role) VALUES (?,?,?)";
        PreparedStatement statement = con.prepareStatement(query);
  
        statement.setString(1, usernameInput);
        statement.setString(2, Security.encrypt(passwordInput));
        statement.setString(3, roleInput);
            
        int c = statement.executeUpdate();
    }
    
    public void changePassword(Connection con, String newPassword, int userID) throws SQLException, NullValueException {       
        
        String query = "UPDATE USERS SET PASSWORD = ? WHERE user_id = ?";
        PreparedStatement statement = con.prepareStatement(query);
  
        statement.setString(1, Security.encrypt(newPassword));
        statement.setInt(2, userID);
            
        int c = statement.executeUpdate();
    }
    
    public void changeUsername(Connection con, String newUsername, int userID) throws SQLException, NullValueException {       
        
        String query = "UPDATE USERS SET USERNAME=? WHERE USER_ID=?";
        PreparedStatement statement = con.prepareStatement(query);
  
        statement.setString(1, newUsername);
        statement.setInt(2, userID);
            
        int c = statement.executeUpdate();
    }
    
    public List<User> getAllUsers(Connection con) throws SQLException, NullValueException {
        List<User> users = new ArrayList<>();
        try {
            String query = "SELECT * FROM USERS";
            PreparedStatement statement = con.prepareStatement(query);
            ResultSet rs = statement.executeQuery();
            ResultSetMetaData md = rs.getMetaData();
            
            while (rs.next()) {
                User user = new User();
                user.setName(rs.getString("USERNAME"));
                user.setRole(rs.getString("ROLE"));
                users.add(user);
            }
            statement.close();
            rs.close();
        } catch(SQLException e) {
            System.out.println("Error in getting all records "+e);
        } 
        
        return users;
    }
}