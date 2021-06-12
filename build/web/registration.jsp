<%-- 
    Document   : registration
    Created on : Mar 29, 2017, 11:20:51 PM
    Author     : N
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        <!-- Compiled and minified CSS -->
        <link rel = "stylesheet"  
              href = "https://fonts.googleapis.com/icon?family=Material+Icons">  
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <style type="text/css">
            body{
                background-color:#f1f2f3;
            }
            h1{
                 font-family: Monaco;
                font-size: 48px;
            }
            .btnForNavigation{
                font-family: Monaco;
                font-size: 24px;
                
            }
            label{
                 font-family: Monaco;
                font-size: 16px;
            }
        </style>
    </head>
    <body class = "container"  >   

        <h1>Registration</h1>

        <div class = "row">  
            <form class = "col s12" action="/StudentAdmission/registration.jsp"  method="POST">  
                <div class = "row">  
                    <div class = "input-field col s6">  
                        <i class = "material-icons prefix">account_circle</i>  
                        <input placeholder = "Username"  name="username"  
                               type = "text" class = "active validate" required />  
                        <label for = "name">Username</label>  
                    </div>  

                    <div class = "input-field col s6">        
                        <label for = "password">FullName</label>  
                        <input name = "fullname" type = "text" placeholder = "Type FullName"  
                               class = "validate" required />            
                    </div>  
                </div>  

                <div class = "row">  
                    <div class = "input-field col s6">  
                        <input placeholder = "Email"  type = "email"  name="email"
                               class = "validate">  
                        <label for = "email">Email</label>  
                    </div> 
                    <div class = "input-field col s6">  
                        <input placeholder = "Phone No"  type = "text"  name="phone"
                               class = "validate">  
                        <label for = "Phone">Phone No</label>  
                    </div> 
                </div>  

                <div class = "row">  
                    <div class = "input-field col s12">  
                        <i class = "material-icons prefix">mode_edit</i>  
                        <textarea id = "address" class = "materialize-textarea" name="address"></textarea>  
                        <label for = "address">Address</label>  
                    </div>  
                </div>  

                <div class = "row">
                    <div class="input-field col s6">
                        <select name="course">
                            <option value="" disabled selected>Choose your option</option>
                            <option value="Java">Java</option>
                            <option value="C++">C++</option>
                            <option value="Python">Python</option>
                        </select>
                        <label>Select Programming Language Courses</label>
                    </div>
                    <div class="input-field col s6">
                        <select name="gender">
                            <option value="" disabled selected>Choose your option</option>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>

                        </select>
                        <label>Gender</label>
                    </div>

                </div>

                <div class = "row">

                    <button class="btn waves-effect waves-light btn-large btnForNavigation" type="submit" name="action">Submit
                        <i class="material-icons right">send</i>
                    </button>
                    
                    <a role="button" class="waves-effect waves-light btn-large btnForNavigation" href="home.jsp">
                        Home
                    </a>
                    
                </div>


            </form>       



            <%
                Connection conn = null;

                String query = "";

                try {

                    String uname = request.getParameter("username");
                    String fullname = request.getParameter("fullname");
                    String email = request.getParameter("email");
                    String phone = request.getParameter("phone");
                    String gender = request.getParameter("gender");
                    String course = request.getParameter("course");
                    String address = request.getParameter("address");

                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost/javatest", "root", "");

                    query = "insert into students(username,fullname,email,phone,course,gender,address) values(?,?,?,?,?,?,?)";
                    PreparedStatement pst = conn.prepareStatement(query);

                    pst.setString(1, uname);
                    pst.setString(2, fullname);
                    pst.setString(3, email);
                    pst.setString(4, phone);
                    pst.setString(5, course);
                    pst.setString(6, gender);
                    pst.setString(7, address);
                    pst.executeUpdate();

                    out.println("<script>alert('Done')</script>");

                } catch (Exception e) {
                    e.printStackTrace();
                }


            %>













            <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
            <!-- Compiled and minified JavaScript -->
            <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

            <script>
                document.addEventListener('DOMContentLoaded', function () {
                    var elems = document.querySelectorAll('select');
                    var instances = M.FormSelect.init(elems, options);
                });

                // Or with jQuery

                $(document).ready(function () {
                    $('select').formSelect();
                });
            </script>


    </body>
</html>
