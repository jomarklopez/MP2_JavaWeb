/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import nl.captcha.Captcha;
import nl.captcha.backgrounds.GradiatedBackgroundProducer;
import nl.captcha.gimpy.FishEyeGimpyRenderer;
import nl.captcha.noise.CurvedLineNoiseProducer;
import nl.captcha.servlet.CaptchaServletUtil;
import nl.captcha.text.producer.DefaultTextProducer;
import static nl.captcha.Captcha.NAME;

/**
 *
 * @author Patrick
 */
public class CaptchaServlet extends HttpServlet
{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Captcha captcha = new Captcha.Builder(200, 50)
        .addText(new DefaultTextProducer()) 
        .addBackground(new GradiatedBackgroundProducer())
        .addNoise(new CurvedLineNoiseProducer())
        .addNoise(new CurvedLineNoiseProducer())        
        .gimp(new FishEyeGimpyRenderer())
        .gimp(new FishEyeGimpyRenderer())       
        .addBorder()
        .build();
        
        CaptchaServletUtil.writeImage(response, captcha.getImage());
        request.getSession().setAttribute(NAME, captcha);
    }

}
