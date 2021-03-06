/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import utils.Security;
/**
 *
 * @author jlopez
 */
public class User {

    private String name;
    private String password;
    private String role;
    private String id;

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
    
    public void setPassword(String password) {
        // Encrypt password
        this.password = Security.encrypt(password);
    }

    public String getPassword() {
        return password;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getRole() {
        return role;
    }
    
    public void setUserID(String id) {
        this.id = id;
    }

    public String getUserID() {
        return id;
    }
    
}