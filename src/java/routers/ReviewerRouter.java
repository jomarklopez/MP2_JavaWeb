/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package routers;

import exceptions.AuthException;
import model.Reviewer;
import exceptions.NullValueException;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import model.User;

/**
 *
 * @author Patrick
 */
public class ReviewerRouter
{
    public ArrayList<Reviewer> findReviewers(Connection con, String subjectInput, String language)throws SQLException,
            IOException {   
        String sql;
        PreparedStatement statement;
        
        if(language == null) {
            sql = "SELECT * FROM REVIEWERS WHERE title LIKE ?";
            String wildquery = '%' + subjectInput + '%';
            statement = con.prepareStatement(sql);
            statement.setString(1, wildquery);
        } else {
            sql = "SELECT * FROM REVIEWERS WHERE title LIKE ? and language = ?";
            String wildquery = '%' + subjectInput + '%';
            statement = con.prepareStatement(sql);
            statement.setString(1, wildquery);
            statement.setString(2, language);
        }
        
        ResultSet rs = statement.executeQuery();
        Reviewer reviewer = null;
        
        ArrayList<Reviewer> reviewers = new ArrayList<Reviewer>();
        if (rs.next() == false) {
            System.out.println("ResultSet in empty in Java");
        } else {
            do {
            reviewer = new Reviewer();
            
            Blob blob = rs.getBlob("file_image");
            InputStream inputStream = blob.getBinaryStream();
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            int bytesRead = -1;

            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);                  
            }

            byte[] imageBytes = outputStream.toByteArray();
            String base64Image = Base64.getEncoder().encodeToString(imageBytes);


            inputStream.close();
            outputStream.close();
            
            reviewer.setTitle(rs.getString("title"));
            reviewer.setDescription(rs.getString("description"));
            reviewer.setSubject(rs.getString("subject"));
            reviewer.setAuthor(rs.getString("author"));
            reviewer.setLanguage(rs.getString("language"));
            reviewer.setBase64Image(base64Image);
            reviewers.add(reviewer);
            } while (rs.next());
        }
        return reviewers;
    }
    
    public int uploadReviewer(Connection con, String title, String subject, String language, String description, String author, InputStream file_data, InputStream file_image, int userID) throws SQLException,
            ClassNotFoundException, AuthException, NullValueException {
        String sql = "INSERT INTO REVIEWERS (user_id, title, description, subject, language, author, file_data, file_image) values (?, ?, ?, ?, ?, ?, ?, ?)";
        int row = 0;

        PreparedStatement preparedStatement = con.prepareStatement(sql);

        preparedStatement.setInt(1, userID);
        preparedStatement.setString(2, title);
        preparedStatement.setString(3, description);
        preparedStatement.setString(4, subject);
        preparedStatement.setString(5, language);
        preparedStatement.setString(6, author);
        if (file_data != null && file_image != null) {
            // fetches input stream of the upload file for the blob column
            preparedStatement.setBlob(7, file_data);
            preparedStatement.setBlob(8, file_image);
        }

        // sends the statement to the database server
        row = preparedStatement.executeUpdate();
        return row;
    }
    
    public ArrayList<Reviewer> getAllUserReviewer(Connection con, String userID)throws SQLException,
            IOException {       
        
        String sql = "SELECT * FROM REVIEWERS WHERE USER_ID = ?";
        PreparedStatement statement = con.prepareStatement(sql);
        statement.setString(1, userID);
        ResultSet rs = statement.executeQuery();
        Reviewer reviewer = null;
        
        ArrayList<Reviewer> reviewers = new ArrayList<Reviewer>();
        if (rs.next() == false) {
            System.out.println("ResultSet in empty in Java");
        } else {
            do {
            reviewer = new Reviewer();
            
            Blob blob = rs.getBlob("file_image");
            InputStream inputStream = blob.getBinaryStream();
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            int bytesRead = -1;

            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);                  
            }

            byte[] imageBytes = outputStream.toByteArray();
            String base64Image = Base64.getEncoder().encodeToString(imageBytes);


            inputStream.close();
            outputStream.close();
            
            reviewer.setTitle(rs.getString("title"));
            reviewer.setDescription(rs.getString("description"));
            reviewer.setSubject(rs.getString("subject"));
            reviewer.setLanguage(rs.getString("language"));
            reviewer.setBase64Image(base64Image);
            reviewers.add(reviewer);
            } while (rs.next());
        }
        
        statement.close();
        rs.close();
        
        return reviewers;
    }
    
    public ResultSet getReviewer(Connection con, String title, String author) throws SQLException {
            // queries the database
        String sql = "SELECT * FROM REVIEWERS WHERE title = ? and author = ?";
        PreparedStatement statement = con.prepareStatement(sql);
        statement.setString(1, title);
        statement.setString(2, author);

        ResultSet rs = statement.executeQuery();
        
        if (rs.next() == false) {
            System.out.println("ResultSet in empty in Java");
        } 
        
        return rs;
    }
    
    public int deleteReviewer(Connection con, int user_id, String title) throws SQLException,
            ClassNotFoundException, AuthException, NullValueException {
        String sql = "DELETE FROM REVIEWERS WHERE user_id = ? AND title = ?";
        int row = 0;

        PreparedStatement preparedStatement = con.prepareStatement(sql);

        preparedStatement.setInt(1, user_id);
        preparedStatement.setString(2, title);

        // sends the statement to the database server
        row = preparedStatement.executeUpdate();
        return row;
    }
    
}
