<%-- 
    Document   : javaStudentMail
    Created on : Apr 9, 2021, 1:20:14 PM
    Author     : Avi
--%>

<%@page import="java.sql.*" %>

<%@page import="com.email.durgesh.Email" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JavaStudent</title>
    </head>
    <body>
        <%

            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            String query = null;

            try {

                Email email = new Email("Enter Your Mail", "Enter Your Password");

                email.setFrom("Enter Your Mail", "Name");

                email.setSubject("JavaQuizLink");

                Class.forName("com.mysql.jdbc.Driver");

                conn = DriverManager.getConnection("jdbc:mysql://localhost/javatest", "root", "");

                
                String javaLink = request.getParameter("javaLink");
                query = "select * from students  where course='Java' ";
                stmt = conn.createStatement();

                
                rs = stmt.executeQuery(query);

                
                while (rs.next()) {
                    System.out.println("Java:-" + rs.getString("email"));
                    email.setContent(javaLink, "text/html");

                    email.addRecipient(rs.getString("email"));

                }
                
                
                
                

                
                email.send();
                
                
                response.sendRedirect("AdminDashboard.jsp");
                rs.close();
                

            } catch (Exception ex) {
                  ex.printStackTrace();
            }


        %>
    </body>
</html>
