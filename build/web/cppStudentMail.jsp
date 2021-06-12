<%-- 
    Document   : cppStudentMail
    Created on : Apr 9, 2021, 1:33:53 PM
    Author     : Avi
--%>

<%@page import="java.sql.*"%>
<%@page import="com.email.durgesh.Email"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CppStudent</title>
    </head>
    <body>
        <%

            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            String query = null;

            try {

                Email email = new Email("Enter Your Mail", "Enter Your password");

                email.setFrom("Enter Your Mail", "Name");

                email.setSubject("CppQuizLink");

                Class.forName("com.mysql.jdbc.Driver");

                conn = DriverManager.getConnection("jdbc:mysql://localhost/javatest", "root", "");

                
                String cppLink = request.getParameter("cppLink");
                query = "select * from students  where course='C++' ";
                stmt = conn.createStatement();

                
                rs = stmt.executeQuery(query);

                
                while (rs.next()) {
                    System.out.println("C++" + rs.getString("email"));
                    email.setContent(cppLink, "text/html");

                    email.addRecipient(rs.getString("email"));

                }
                
                
                
                

                
                email.send();
                
                response.sendRedirect("AdminDashboard.jsp");
                rs.close();

            } catch (Exception ex) {

            }


        %>
    </body>
</html>
