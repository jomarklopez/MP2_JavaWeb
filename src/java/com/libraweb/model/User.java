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
    private String email;
    private String password;
    
  public String getName() {
    return name;
  }

  public void setName(String newName) {
    this.name = newName;
  }
  public String getEmail() {
    return email;
  }

  public void setEmail(String newEmail) {
    this.email = newEmail;
  }
  
  public String getPassword() {
    return password;
  }

  public void setPassword(String newPassword) {
    this.password = newPassword;
  }
}
