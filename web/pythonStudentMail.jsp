<%-- 
    Document   : pythonStudentMail.jsp
    Created on : Apr 9, 2021, 1:32:58 PM
    Author     : Avi
--%>

<%@page import="com.email.durgesh.Email"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PythonStudent</title>
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

                email.setSubject("PythonQuizLink");

                Class.forName("com.mysql.jdbc.Driver");

                conn = DriverManager.getConnection("jdbc:mysql://localhost/javatest", "root", "");

                
                String pythonLink = request.getParameter("pythonLink");
                query = "select * from students  where course='Python' ";
                stmt = conn.createStatement();

                
                rs = stmt.executeQuery(query);

                
                while (rs.next()) {
                    System.out.println("Python" + rs.getString("email"));
                    email.setContent(pythonLink, "text/html");

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
