/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package exceptions;


/**
 *
 * @author jomarklopez
 */
public class SQLException extends Exception{
    public SQLException(String errorMessage) {
        super(errorMessage);
    }
}
