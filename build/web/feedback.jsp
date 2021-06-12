<%-- 
    Document   : feedback
    Created on : Mar 29, 2017, 11:31:04 PM
    Author     : N
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Feedback</title>
        <link rel = "stylesheet"  
              href = "https://fonts.googleapis.com/icon?family=Material+Icons">  
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <style>
            /* label color */
            body{
                background-color: #f1f2f3;
            }
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
            h2{
                font-family: Monaco;
                font-size: 56px;
            }
            .btnForNavigation{
                font-family: Monaco;
                font-size: 24px;
                
            }
            label{
                font-family: Monaco;
                font-size: 20px;
            }

        </style>
    </head>
    <body>


        <div>
            <a  href="home.jsp" class="btn btn-large waves-effect waves-light btnForNavigation" role="button" >Home</a>
        </div>

        <div class="container">
            <div class="row">
                <div class="col m10 offset-m1 s12">
                    <h2 class="center-align">Feedback </h2>
                    <div class="row">
                        <form class="col m8 offset-m2 s12" action="/StudentAdmission/feedback.jsp" method="POST">
                            <div class="row">
                                <div class="input-field col s12">
                                    <input  type="text" name="uname">
                                    <label for="name" >Name</label>
                                </div>
                                <div class="input-field col s12">
                                    <input name="email" type="email" class="form-input " required>
                                    <label for="email">Email</label>
                                </div>
                                <div class="input-field col s12">
                                    <textarea name="msg" class="materialize-textarea" required></textarea>
                                    <label for="message">Feedback</label>
                                </div>

                                <div class="col m12">
                                    <p class="center-align"><button class="btn btn-large waves-effect waves-light btnForNavigation" type="submit" name="action">Submit</button></p>
                                </div>
                            </div>


                        </form>
                    </div>
                </div>
            </div>
        </div>



        <%
            Connection conn = null;

            String query = "";

            try {

                Class.forName("com.mysql.cj.jdbc.Driver");

                conn = DriverManager.getConnection("jdbc:mysql://localhost/javatest", "root", "");

                String name = request.getParameter("uname");
                String email = request.getParameter("email");
                String msg = request.getParameter("msg");

                query = "insert into feedback() values(?,?,?)";
                PreparedStatement pst = conn.prepareStatement(query);
                
                pst.setString(1, name);
                pst.setString(2, email);
                pst.setString(3, msg);
                pst.executeUpdate();
                
                
                out.println("<script>alert('Thanks for your feedback')</script>");

            } catch (Exception ex) {
                ex.printStackTrace();
            }


        %>



        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

    </body>
</html>
