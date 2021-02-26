/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.libraweb.model;

/**
 *
 * @author jlopez
 */
public class User {

    private String name;
    private String pass;
    private String role;

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getPass() {
        return pass;
    }
    
    public void setRole(String role) {
        this.role = role;
    }

    public String getRole() {
        return role;
    }
    
    @Override
    public String toString() {
        return "Welcome " + name + " your role is: " + role + ", to our web application!";
    }
}