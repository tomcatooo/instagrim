/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uk.ac.dundee.computing.tr.instagrim.stores;

import java.util.UUID;

/**
 *
 * @author tr-ch
 */
public class Comment {
    private java.util.UUID UUID=null;
    private String comment;
    private String user;
    
    public Comment(){
        
    }
    
     public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }
    
    
    public String getSUUID(){
        return UUID.toString();
    }
    
    public UUID getUUID() {
        return UUID;
    }

    public void setUUID(UUID UUID) {
        this.UUID = UUID;
    }
}
