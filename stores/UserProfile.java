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
public class UserProfile {
     String login = null;
     String fName = null;
     String sName = null;
     String email = null;
     UUID picID;
     
     public UserProfile(){

         picID = null;
     }
 
     public String getLogin() {
         return login;
     }
 
     public void setLogin(String login) {
         this.login = login;
    }
 
     public String getfName() {
         return fName;
     }
 
     public void setfName(String fName) {
         this.fName = fName;
     }
 
     public String getsName() {
         return sName;
     }
 
     public void setsName(String sName) {
         this.sName = sName;
     }
     
     public String getEmail() {
         return email;
     }
 
     public void setEmail(String email) {
         this.email = email;
     }
     
     public UUID getpicID(){
         return picID;
     }
     
     public void setpicID(UUID picID){
         this.picID = picID;
     }
     
 }
    
