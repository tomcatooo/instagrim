<%-- 
    Document   : comment
    Created on : Sep 28, 2014, 7:01:44 PM
    Author     : Administrator
--%>


<%@page import="uk.ac.dundee.computing.tr.instagrim.models.User"%>
<%@page import="uk.ac.dundee.computing.tr.instagrim.stores.LoggedIn"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uk.ac.dundee.computing.tr.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="/Instagrim/Styles.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <header>
        <h1>Instagrim</h1>
        <h2>Comments</h2>
        </header>
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
    String picid = (String) request.getAttribute("pic");
   
    //if (lg.getloggedin()==true){
%>


<div class="profile">
<a href="/Instagrim/Image/<%=picid%>" ><img class="img-profile" src="/Instagrim/Image/<%=picid%>"></a><br/>

<%
    java.util.LinkedList<Comment> commentsList = (java.util.LinkedList<Comment>) request.getAttribute("comments");
    if (commentsList == null){
        %>
        <p> no comments for photo </p>
        <%
    }
else {
    
    Iterator<Comment> iterator;
    iterator = commentsList.iterator();
    while (iterator.hasNext())
    {

        Comment com = (Comment) iterator.next();
        String user = com.getUser();
        String comment = com.getComment();
        String picuuid = com.getSUUID();
%>
<div class="container">
<div class="profilethumb"></div><h3><%=user%> : <%=comment%></h3><br/>
<%
    }
}


    String uuid = (String) request.getAttribute("pic");
%>
</div>
</div>

<br/>
<% if(lg != null){
    
%>
<div class="container">
<form method="POST"  action="Comments">
                <input type="hidden"  name ="picid"  value ="<%=uuid%>">
                <input type="hidden"  name ="user"  value ="<%=lg.getUsername()%>">
                
                Comment: <input type="text" name="comment" value ="">
                
                <br/>
                <input type="submit" value="Comment"> 
</form>
</div>
                <%
                    }
                    %>
    
</body>
</html>
