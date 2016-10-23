/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package uk.ac.dundee.computing.tr.instagrim.models;

import com.datastax.driver.core.BoundStatement;
import com.datastax.driver.core.Cluster;
import com.datastax.driver.core.PreparedStatement;
import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Row;
import com.datastax.driver.core.Session;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;
import uk.ac.dundee.computing.tr.instagrim.lib.AeSimpleSHA1;
import uk.ac.dundee.computing.tr.instagrim.stores.Pic;
import uk.ac.dundee.computing.tr.instagrim.stores.UserProfile;

/**
 *
 * @author Administrator
 */
public class User {
    Cluster cluster;
    public User(){
        
    }
    
    public java.util.LinkedList<UserProfile> getUserinfo(String User){
        
        java.util.LinkedList<UserProfile> Userinfo = new java.util.LinkedList<>();
        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("select login, first_name, last_name, email, picID from userprofiles where login =?");
        ResultSet rs = null;
          BoundStatement boundStatement = new BoundStatement(ps);
          rs = session.execute( // this is where the query is executed
                  boundStatement.bind( // here you are binding the 'boundStatement'
                          User));
          if (rs.isExhausted()) {
              System.out.println("No user found");
              return null;
              } else {
             for (Row row : rs) {
                 UserProfile prof1 = new UserProfile();
                  String login = row.getString("login");
                  String firstName = row.getString ("first_name");
                  String lastName = row.getString ("last_name");
                  String email = row.getString ("email");
                  java.util.UUID picid = row.getUUID ("picid");
                  prof1.setLogin(login);
                  prof1.setfName(firstName);
                  prof1.setsName(lastName);
                  prof1.setEmail(email);
                  prof1.setpicID (picid);
                  Userinfo.push(prof1);
              }
                 
          return Userinfo;
    }
    }
    
    public java.util.LinkedList<UserProfile> getUserList() {
        java.util.LinkedList<UserProfile> Userinfo = new java.util.LinkedList<>();
        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("select login, picid from userprofiles");
        ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        ));
        if (rs.isExhausted()) {
            System.out.println("No users found");
            return null;
        } else {
            for (Row row : rs) {
                UserProfile userprof = new UserProfile();
                String login = row.getString("login");
                UUID picid = row.getUUID("picid");
                userprof.setLogin(login);
                userprof.setpicID(picid);
                Userinfo.push(userprof);
               }
        }
        return Userinfo;
    }
    
    public boolean RegisterUser(String username, String Password, String email, String first_name, String last_name){
        AeSimpleSHA1 sha1handler=  new AeSimpleSHA1();
        String EncodedPassword=null;
        try {
            EncodedPassword= sha1handler.SHA1(Password);
        }catch (UnsupportedEncodingException | NoSuchAlgorithmException et){
            System.out.println("Can't check your password");
            return false;
        }
        String defaultPhoto = "8d691690-96cf-11e6-a948-c85b761a3807";
        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("insert into userprofiles (login,password,email,first_name,last_name,picid) Values(?,?,?,?,?,8d691690-96cf-11e6-a948-c85b761a3807)");
       
        BoundStatement boundStatement = new BoundStatement(ps);
        session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        username,EncodedPassword,email,first_name,last_name));
        //We are assuming this always works.  Also a transaction would be good here !
        
        return true;
    }
    
    public boolean IsValidUser(String username, String Password){
        AeSimpleSHA1 sha1handler=  new AeSimpleSHA1();
        String EncodedPassword=null;
        try {
            EncodedPassword= sha1handler.SHA1(Password);
        }catch (UnsupportedEncodingException | NoSuchAlgorithmException et){
            System.out.println("Can't check your password");
            return false;
        }
        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("select password from userprofiles where login =?");
        ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        username));
        if (rs.isExhausted()) {
            System.out.println("No Images returned");
            return false;
        } else {
            for (Row row : rs) {
               
                String StoredPass = row.getString("password");
                if (StoredPass.compareTo(EncodedPassword) == 0)
                    return true;
            }
        }
   
    
    return false;  
    }
       public void setCluster(Cluster cluster) {
        this.cluster = cluster;
    }

    
}
