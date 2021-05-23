/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Patrick
 */
public class Reviewer
{
    private String title;
    private String description;
    private String subject;
    private String language;
    private String author;
    private String base64Image;
 
 
   
    public void setTitle(String title) {
        this.title = title;
    }

    public String getTitle() {
        return title;
    }

    public void setDescription(String description) {

        this.description = description;
    }

    public String getDescription() {
        return description;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getSubject() {
        return author;
    }
    
    public void setAuthor(String author) {
        this.author = author;
    }

    public String getAuthor() {
        return author;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getLanguage() {
        return language;
    }
     
    public void setBase64Image(String base64Image) {
        this.base64Image = base64Image;
    }
    
    public String getBase64Image() {
        return base64Image;
    }

}