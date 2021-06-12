<%-- 
    Document   : AdminDashboard.jsp
    Created on : Mar 20, 2021, 11:30:05 AM
    Author     : Avi
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <style>
            .card-text{
                font-family: Monaco;
                font-size: 56px;
            }
            .card-title{
                font-family: Monaco;
                font-size: 24px;
            }

            .btn-primary{
                border-color: #6610f2;
                background-color: #6610f2;
            }

            body{
                background-color: #f3f3f3;
            }
            #head{
                display: inline-block;
                padding-right: 710px; /*710px*/
                font-family: Monaco;
                font-size: 36px;
            }
            .btnForNavigation{
                font-family: Monaco;
                font-size: 22px;
                
            }

        </style>
    </head>
    <body>
        <div class="mt-2">
            <h1 id="head">Dashboard</h1>
            
            <a  href="home.jsp" class="btn btn-danger btnForNavigation" role="button" ><i class="bi bi-house-fill"></i> Home</a>
            <a  href="logoutAdmin.jsp" class="btn btn-danger btnForNavigation" role="button"><i class="bi bi-box-arrow-right"></i> Logout</a>
            <a  href="displayRecord.jsp" class="btn btn-danger btnForNavigation" role="button"><i class="bi bi-table"></i> Records</a>
       
            <!--<i class="bi bi-table"></i>
                 <i class="bi bi-file-earmark-spreadsheet-fill"></i> -->
        </div>
        <hr>
        <div class="mt-6">
            <!--1920x1200 all images-->
            <%

                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                String query = null;
                int jcnt = 0;
                int pcnt = 0;
                int cppcnt = 0;

                try {
                    Class.forName("com.mysql.jdbc.Driver");

                    conn = DriverManager.getConnection("jdbc:mysql://localhost/javatest", "root", "");
                    stmt = conn.createStatement();

                    query = "select count(*) from students where course='Java'";
                    rs = stmt.executeQuery(query);
                    rs.next();
                    jcnt = rs.getInt(1);

                    query = "select count(*) from students where course='Python'";
                    rs = stmt.executeQuery(query);
                    rs.next();
                    pcnt = rs.getInt(1);

                    query = "select count(*) from students where course='C++'";
                    rs = stmt.executeQuery(query);
                    rs.next();
                    cppcnt = rs.getInt(1);

                } catch (Exception e) {
                    e.printStackTrace();
                }

            %>




            <div class="container mt-4">
                <div class="row">

                    <div class="col-sm-4">

                        <div class="card" style="width: 18rem;">
                            <img src="img/Java.png" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">Java Students</h5>
                                <p class="card-text"><%=jcnt%></p>
                                <div class="d-grid gap-2 col-6 mx-auto">
                                    <button type="button" class="btn btn-primary modal-button" data-bs-toggle="modal" data-bs-target="#javaModal" data-name="Java">
                                        Java
                                    </button>

                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="col-sm-4">

                        <div class="card" style="width: 18rem;">
                            <img src="img/py2.jpg" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">Python Students</h5>
                                <p class="card-text"><%=pcnt%></p>
                                <div class="d-grid gap-2 col-6 mx-auto">
                                    <button type="button" class="btn btn-primary modal-button" data-bs-toggle="modal" data-bs-target="#pythonModal" data-name="Python">
                                        Python
                                    </button>

                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="col-sm-4">

                        <div class="card" style="width: 18rem;">
                            <img src="img/cpp3.png" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">C++ Students</h5>
                                <p class="card-text"><%=cppcnt%></p>
                                <div class="d-grid gap-2 col-6 mx-auto">
                                    <button type="button" class="btn btn-primary modal-button" data-bs-toggle="modal" data-bs-target="#cppModal" data-name="C++">
                                        C++
                                    </button>

                                </div>
                            </div>
                        </div>

                    </div>

                </div>


            </div>


        </div>
        <!-- Button trigger modal -->



        <!-- javaModal -->
        <div class="modal fade" id="javaModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Java</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body" id="modal-body-confirm">
                        <form action="javaStudentMail.jsp" method="POST">
                            <div class="mb-3">
                                <label for="exampleInput" class="form-label">Quiz Link</label>
                                <!--<input type="text" class="form-control" id="inpLink" name="javaLink" >-->
                                <textarea class="form-control"  name="javaLink" rows="3"></textarea>
                                <div id="emailHelp" class="form-text">Send Quiz link to Students.</div>
                            </div>


                            <button type="submit" class="btn btn-primary">Send</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>
        </div>


        <div class="modal fade" id="pythonModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Python</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body" id="modal-body-confirm">
                        <form action="pythonStudentMail.jsp" method="POST">
                            <div class="mb-3">
                                <label for="exampleInput" class="form-label">Quiz Link</label>
                                <!--<input type="text" class="form-control" id="inpLink" name="pythonLink" >-->
                                <textarea class="form-control"  name="pythonLink" rows="3"></textarea>
                                <div id="emailHelp" class="form-text">Send Quiz link to Students.</div>
                            </div>


                            <button type="submit" class="btn btn-primary">Send</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>
        </div>


        <div class="modal fade" id="cppModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">CPP</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body" id="modal-body-confirm">
                        <form action="cppStudentMail.jsp" method="POST">
                            <div class="mb-3">
                                <label for="exampleInput" class="form-label">Quiz Link</label>
                                <!--<input type="text" class="form-control" id="inpLink" name="cppLink" >-->
                                <textarea class="form-control"  name="cppLink" rows="3"></textarea>
                                <div id="emailHelp" class="form-text">Send Quiz link to Students.</div>
                            </div>


                            <button type="submit" class="btn btn-primary">Send</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>





        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>

        <script type="text/JavaScript" defer>
            console.log("**************");





        </script>





    </body>
</html>
