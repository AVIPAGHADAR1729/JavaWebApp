<%-- 
    Document   : home
    Created on : Mar 29, 2017, 11:21:55 PM
    Author     : N
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <link href="css/main.css" rel="stylesheet">
    </head>

    <!--style="background: url('img/img.jpg');background-size: cover;background-attachment: fixed;"-->
    <body style="background: url('img/B_large.jpg');background-size: cover;background-attachment: fixed;">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="home.jsp">Home</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">

                        <li class="nav-item">
                            <a class="nav-link" href="registration.jsp">Registration</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Courses
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#">Python</a></li>
                                <li><a class="dropdown-item" href="#">Java</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="#">C++</a></li>
                            </ul>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link"  href="feedback.jsp"  >Feedback</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link"  href="aboutus.jsp"  >About us</a>
                        </li>


                    </ul>

                    <!--<form class="d-flex">-->

                    <%

                        if (session.getAttribute("uname") != null) {
                    %>

                    <div>
                        <big id="nameOfAdmin" >Hello,Admin</big>
                        <a  href='logoutAdmin.jsp' id="logoutBtn" class="btn btn-danger"  role="button"><i class="bi bi-box-arrow-right"></i>Logout</a>
                        <a  href='AdminDashboard.jsp' class='btn btn-danger'id="dashBtn" role='button'><i class="bi bi-award-fill"></i>Dashboard</a>
                    </div>

                    <%
                    } else {

                    %>

                    <a  href='loginAdmin.jsp' id="loginBtn" class='btn btn-danger' role='button'>Login</a>
                    <%    }


                    %>
                    <!--</form>-->


                </div>
            </div>
        </nav>

        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>

      


    </body>
</html>
