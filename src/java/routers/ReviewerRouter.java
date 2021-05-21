/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package routers;

import exceptions.AuthException;
import model.Reviewer;
import exceptions.NullValueException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.User;

/**
 *
 * @author Patrick
 */
public class ReviewerRouter
{
    public ArrayList<Reviewer> findReviewer(Connection con, String subjectInput)throws SQLException,
            ClassNotFoundException, NullValueException, AuthException {       
        
        String sql = "SELECT * FROM REVIEWERS WHERE subject = ?";
        PreparedStatement statement = con.prepareStatement(sql);
        statement.setString(1, subjectInput);
        ResultSet res = statement.executeQuery();
        Reviewer reviewer = null;
        
        ArrayList<Reviewer> reviewers = new ArrayList<Reviewer>();
        
        if (res.next() == false) {
            throw new AuthException("Reviewer does not exist.");
        } else {
          do {
            reviewer = new Reviewer();
            reviewer.setTitle(res.getString("title"));
            reviewer.setDescription(res.getString("description"));
            reviewer.setSubject(res.getString("subject"));
            reviewer.setLanguage(res.getString("language"));
            reviewers.add(reviewer);
          } while (res.next());
        }
        return reviewers;
    }
}
