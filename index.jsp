<%-- 
    Document   : index
    Created on : Sep 28, 2014, 7:01:44 PM
    Author     : Administrator
--%>


<%@page import="uk.ac.dundee.computing.tr.instagrim.stores.LoggedIn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uk.ac.dundee.computing.tr.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="Styles.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
        %>
        <header>
            <h1>InstaGrim ! </h1>
            <h2>Your world in Black and White</h2>
        </header>
      <nav>
            <ul>

               
                    <%
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
            
            <h1>WELCOME TO INSTAGRIM!</h1>
            
        <footer>
            <ul>
                <li class="footer"><a href="/Instagrim">Home</a></li>
                <li>&COPY; Tom R</li>
            </ul>
        </footer>
    </body>
</html>

