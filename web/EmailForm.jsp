<%@page import="java.sql.*" %>

<%@page import="com.email.durgesh.Email" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Send an e-mail</title>

        <link rel = "stylesheet"  
              href = "https://fonts.googleapis.com/icon?family=Material+Icons">  
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <style>
            /* label color */
            .input-field label {
                color: #444;
            }
            /* label focus color */
            .input-field input:focus + label
            {
                color: #444;
            }
            /* label underline focus color */
            .input-field input[type=text]:focus {
                border-bottom: 1px solid #444;
                box-shadow: 0 1px 0 0 #444;
            }
            /* valid color */
            .input-field input[type=text].valid {
                border-bottom: 1px solid #444;
                box-shadow: 0 1px 0 0 #444;
            }
            /* invalid color */
            .input-field input[type=text].invalid {
                border-bottom: 1px solid #444;
                box-shadow: 0 1px 0 0 #444;
            }
            /* icon prefix focus color */
            .input-field .prefix.active {
                color: #444;
            }
        </style>

    </head>
    <body>

        <!--===============================-->



        <div class="container">
            <div class="row">
                <div class="col m10 offset-m1 s12">
                    <h3 class="center-align">Send Quiz link to Student</h3>
                    <div class="row">
                        <form class="col m8 offset-m2 s12" action="/StudentAdmission/EmailForm.jsp" method="POST">
                            <div class="row">
                                <div class="input-field col s12">
                                    <input  type="text" name="cppQuiz">
                                    <label for="name">C++</label>
                                </div>
                                <div class="input-field col s12">
                                    <input name="javaQuiz" type="text" class="form-input" required>
                                    <label for="email">Java</label>
                                </div>
                                <div class="input-field col s12">
                                    <textarea name="pyQuiz" class="materialize-textarea" required></textarea>
                                    <label for="message">Python</label>
                                </div>

                                <div class="col m12">
                                    <p class="center-align"><button class="btn btn-large waves-effect waves-light" type="submit" name="action">Submits</button></p>
                                </div>
                            </div>


                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!--====-->
        <!--        <form action="/StudentAdmission/EmailForm.jsp" method="post">
            <table border="0" width="35%" align="center">
                <caption><h2>Send New E-mail</h2></caption>
                <tr>
                    <td width="50%">Recipient address </td>
                    <td><input type="text" name="recipient" size="50"/></td>
                </tr>
                <tr>
                    <td>Subject </td>
                    <td><input type="text" name="subject" size="50"/></td>
                </tr>
                <tr>
                    <td>Content </td>
                    <td><textarea rows="10" cols="39" name="content"></textarea> </td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" value="Send"/></td>
                </tr>
            </table>

        </form>-->




        <%

//            try {
//
//                Email email = new Email("paghadaravi1729fx@gmail.com", "Avifx1729fx#$");
//
//                email.setFrom("paghadaravi1729fx@gmail.com", "Avifx");
//
//                email.setSubject(request.getParameter("subject"));
//                email.setContent("<h1>" + request.getParameter("content") + "</h1>", "text/html");
//
//                email.addRecipient(request.getParameter("recipient"));
//
//                email.send();
//
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            String query = null;

            try {

                Email email = new Email("paghadaravi1729fx@gmail.com", "Avifx1729fx#$");

                email.setFrom("paghadaravi1729fx@gmail.com", "Avifx");

                email.setSubject("test");

                Class.forName("com.mysql.jdbc.Driver");

                conn = DriverManager.getConnection("jdbc:mysql://localhost/javatest", "root", "");

                String cpplink = request.getParameter("cppQuiz");
                String javalink = request.getParameter("javaQuiz");
                String pylink = request.getParameter("pyQuiz");

                System.out.println(cpplink);
                System.out.println(javalink);
                System.out.println(pylink);

                stmt = conn.createStatement();
                
                if(!cpplink.equals("") && !javalink.equals("") && !pylink.equals("")){
                    
                
//                ##################### C++ #######################
                query = "select * from students  where course='C++' ";

                rs = stmt.executeQuery(query);

                while (rs.next()) {
                    System.out.println("C++ " + rs.getString("email"));
                    email.setContent("C++", "text/html");

                    email.addRecipient(rs.getString("email"));

                }
           
                
                
                

//                ##################### Python #######################
                query = "select * from students  where course='Python' ";

                rs = stmt.executeQuery(query);

                while (rs.next()) {
                    System.out.println("Python " + rs.getString("email"));
                    email.setContent("Python", "text/html");

                    email.addRecipient(rs.getString("email"));

                }
               
//                ##################### JAVA #######################

                query = "select * from students  where course='Java' ";

                rs = stmt.executeQuery(query);

                while (rs.next()) {
                    System.out.println("Java " + rs.getString("email"));
                    email.setContent("Java", "text/html");

                    email.addRecipient(rs.getString("email"));

                }

                email.send();

                rs.close();
                }
                
                else{
                    out.println("<script>alert('Error')</script>");
                }

            } catch (Exception e) {
            }

        %>

        <!--https://forms.gle/RXaFZp2XcqRucGZx5-->


        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

    </body>
</html>