<%-- 
    Document   : profile
    Created on : Sep 24, 2014, 2:52:48 PM
    Author     : Administrator
--%>

<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uk.ac.dundee.computing.tr.instagrim.stores.*" %>
<!DOCTYPE html>

<html>
    <head>
        <link rel="stylesheet" type="text/css" href="/Instagrim/Styles.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Profile</title>
    </head>
    <body>
    <h1>InstaGrim ! </h1>
    <h2>Your world in Black and White</h2>   
    
    <nav>
            <ul>

               
                    <%
                        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                        if (lg != null) {
                            String UserName = lg.getUsername();
                            if (lg.getloggedin()) {
                    %>
                <li><a href="/Instagrim/Upload">Upload</a></li>
                <li><a href="/Instagrim/Profile/<%=lg.getUsername()%>"> Your Profile </a></li>
                <li><a href="/Instagrim/Profiles"> Explore Profiles </a> </li>

                <li><a href="/Instagrim/Images/<%=lg.getUsername()%>"><%=UserName%>'s Images</a></li>
                <li><a href="/Instagrim/Logout">Logout</a></li>
                <li><%=UserName%></li>
                    <%}
                            }else{
                                %>
                <li><a href="/Instagrim/Profiles"> Explore Profiles </a> </li>
                 <li><a href="/Instagrim/Register">Register</a></li>
                <li><a href="/Instagrim/Login">Login</a></li>
                <%
                                        
                            
                    }%>
            </ul>
        </nav>
            <br/>
            <br/>
            <br/>
            <br/>
        
                    
                    
  <% 
      
      java.util.LinkedList<UserProfile> userInfo = (java.util.LinkedList<UserProfile>) request.getAttribute("userInfo"); 
      
            UserProfile user;
      user = new UserProfile();
       user =(UserProfile) userInfo.get(0);
       String userLog = user.getLogin();
       String userFname = user.getfName();
       String userSname = user.getsName();
       String userEmail = user.getEmail();
      
      if (userInfo == null){
      
  %>
   <p> No Profile Found </P>
   <a href="/Instagrim">Home</a>
   
   <% }
      else 
      {

    %>
    <div class="profile">
        <div class="container">
            <h2> <%=userLog%> </h2>
       <p> Name: <%=userFname%> <%=userSname%> </p>
       <p> Email: <%=userEmail%> </p>
       <a href="/Instagrim/Images/<%=userLog%>"><%=userLog%>'s images</a><br/>
       
       <%
           if (lg != null){
           if(userLog.equals(lg.getUsername())){
           %>
       <a href="/Instagrim/changeProfilePic.jsp">Change profile picture</a><br/>
      
       
 <%
     }
      }
}

 %>
 
        </div>
     
 <% 
     if (user.getpicID() != null){
         
     }
     
     
 %>
 <a href="/Instagrim/Images/<%=userLog%>" ><img class="img-circle" src="/Instagrim/Thumb/<%=user.getpicID()%>"></a><br/>
 <% 
%>
    </div>
<a href="/Instagrim">Home</a>
 

    </body>
</html>
