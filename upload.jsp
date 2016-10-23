<%-- 
    Document   : upload
    Created on : Sep 22, 2014, 6:31:50 PM
    Author     : Administrator
--%>

<%@page import="uk.ac.dundee.computing.tr.instagrim.stores.LoggedIn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="Styles.css" />
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
 
        <article>
            <h3>File Upload</h3>
            <form method="POST" enctype="multipart/form-data" action="Image">
                File to upload: <input type="file" name="upfile"><br/>

                <br/>
                <input type="submit" value="Press"> to upload the file!
            </form>

        </article>
        <footer>
            <ul>
                <li class="footer"><a href="/Instagrim">Home</a></li>
            </ul>
        </footer>
    </body>
</html>
