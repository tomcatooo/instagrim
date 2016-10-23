<%-- 
    Document   : UsersPics
    Created on : Sep 24, 2014, 2:52:48 PM
    Author     : Administrator
--%>

<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uk.ac.dundee.computing.tr.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="/Instagrim/Styles.css" />
    </head>
    <body>
        <header>
        
        <h1>InstaGrim ! </h1>
        <h2>Your world in Black and White</h2>
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
 
        <article>

       <%
       
       
            java.util.LinkedList<Pic> lsPics = (java.util.LinkedList<Pic>) request.getAttribute("Pics");
            if (lsPics == null) {
        %>
        <p>No Pictures found</p>
        <%
        } else {
            Iterator<Pic> iterator;
            iterator = lsPics.iterator();
            while (iterator.hasNext()) {
                Pic p = (Pic) iterator.next();

        %>
        <div class="profile">
                            <div class="container">
        <a href="/Instagrim/Comments/<%=p.getSUUID()%>" ><img class="img-profile" src="/Instagrim/Thumb/<%=p.getSUUID()%>"></a><br/>
                            </div>
        </div><%

            }
            }
        %>
        </article>
        <footer>
            <ul>
                <li class="footer"><a href="/Instagrim">Home</a></li>
            </ul>
        </footer>
    </body>
</html>
