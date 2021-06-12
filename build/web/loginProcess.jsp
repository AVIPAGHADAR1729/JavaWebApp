<%-- 
    Document   : loginop
    Created on : Mar 29, 2017, 11:36:17 PM
    Author     : N
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%

            Connection conn = null;
            Statement st = null;
            ResultSet rs1;
            String q = "";

            try {

                String email = request.getParameter("email");
                String password = request.getParameter("password");

//                Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
//                conn = DriverManager.getConnection("jdbc:mysql://localhost/javatest", "root", "");
//
//                st = conn.createStatement();
//                q = "select * from admin where email='" + email + "' and password='" + password + "'";
//                rs1 = st.executeQuery(q);
                if (email.equals("Enter Your Mail") && password.equals("Enter Your Password")) {

                    session.setAttribute("uname", email);
                    response.sendRedirect("home.jsp");

                } else {
                    out.println("<script>alert('Error')</script>");
                    request.getRequestDispatcher("loginAdmin.jsp").include(request, response);
                }
            } catch (Exception e) {
                out.println(e);
            }

        %>




    </body>
</html>
