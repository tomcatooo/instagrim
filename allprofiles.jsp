<%-- 
    Document   : allprofiles
    Created on : Sep 28, 2014, 7:01:44 PM
    Author     : Administrator
--%>


<%@page import="java.util.UUID"%>
<%@page import="uk.ac.dundee.computing.tr.instagrim.servlets.Profile"%>
<%@page import="java.util.Iterator"%>
<%@page import="uk.ac.dundee.computing.tr.instagrim.stores.LoggedIn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uk.ac.dundee.computing.tr.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="/Instagrim/Styles.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                    <%
                        java.util.LinkedList<UserProfile> proflist = (java.util.LinkedList<UserProfile>) request.getAttribute("userInfo");
    if (proflist == null){
        %>
        <p> no profiles </p>
        <%
    }
else {
    
    Iterator<UserProfile> iterator;
    iterator = proflist.iterator();
    while (iterator.hasNext())
    {
        UserProfile prof = (UserProfile) iterator.next();
        String user = prof.getLogin();
        UUID picID = prof.getpicID();



                        %>
                        <div class="profile">
                            <div class="container">
                                <h3><%=user%></h3>
                            </div>
                        <a href="/Instagrim/Profile/<%=user%>"><img class="img-circle" src="/Instagrim/Thumb/<%=picID%>" alt="thumbnail"></a><br/>
                        </div>
                        <%
                            }
}

%>
                        
        <footer>
            <ul>
                <li class="footer"><a href="/Instagrim">Home</a></li>
                <li>&COPY; Tom R</li>
            </ul>
        </footer>
    </body>
</html>

