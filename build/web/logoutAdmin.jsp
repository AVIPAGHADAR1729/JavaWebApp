<%-- 
    Document   : logoutAdmin
    Created on : Mar 19, 2021, 3:28:45 PM
    Author     : Avi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            session.removeAttribute("email");
            session.removeAttribute("password");

            session.invalidate();
            request.getRequestDispatcher("home.jsp").include(request, response);
            
        %>
    </body>
</html>
