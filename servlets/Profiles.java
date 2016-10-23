/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uk.ac.dundee.computing.tr.instagrim.servlets;

import com.datastax.driver.core.Cluster;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import uk.ac.dundee.computing.tr.instagrim.lib.CassandraHosts;
import uk.ac.dundee.computing.tr.instagrim.lib.Convertors;
import uk.ac.dundee.computing.tr.instagrim.models.User;
import uk.ac.dundee.computing.tr.instagrim.stores.UserProfile;

/**
 *
 * @author tr-ch
 */
@WebServlet(urlPatterns = {
    "/Profiles"
})
public class Profiles extends HttpServlet{
    
    private Cluster cluster;
    
    public void init(ServletConfig config) throws ServletException 
    {
        // TODO Auto-generated method stub
        cluster = CassandraHosts.getCluster();
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        profileList(request, response);
     }
    
    private void profileList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User us = new User();
        us.setCluster(cluster);
        java.util.LinkedList<UserProfile> userList = us.getUserList();
        RequestDispatcher rd = request.getRequestDispatcher("/allprofiles.jsp");
        request.setAttribute("userInfo", userList);
        rd.forward(request, response);
 }
}
