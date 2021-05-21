/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package routers;

import java.io.InputStream;
import exceptions.AuthException;
import exceptions.NullValueException;
import java.sql.*;

/**
 *
 * @author jomarklopez
 */
public class UploadRouter {
     public int uploadFile(Connection con, String title, String description, String subject, String language, InputStream file_data, InputStream file_image) throws SQLException,
            ClassNotFoundException, AuthException, NullValueException {
        String sql = "INSERT INTO REVIEWERS (user_id, title, description, subject, language, file_data, file_image) values (?, ?, ?, ?, ?, ?, ?)";
        int row = 0;

        PreparedStatement preparedStatement = con.prepareStatement(sql);

        preparedStatement.setInt(1, 1);
        preparedStatement.setString(2, title);
        preparedStatement.setString(3, description);
        preparedStatement.setString(4, subject);
        preparedStatement.setString(5, language);
        if (file_data != null && file_image != null) {
            // fetches input stream of the upload file for the blob column
            preparedStatement.setBlob(6, file_data);
            preparedStatement.setBlob(7, file_image);
        }

        // sends the statement to the database server
        row = preparedStatement.executeUpdate();
        return row;
    }
}
