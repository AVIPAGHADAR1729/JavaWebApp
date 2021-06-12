<%--     Document   : displayRecord
    Created on : Mar 29, 2017, 11:45:25 PM
    Author     : N
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show All Records</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <style type="text/css">
            @import url(http://fonts.googleapis.com/css?family=Calibri:400,300,700);

            body {
                background-color: #6a1b9a;  /*#4a148c*/; /*#ba68c8*/;     /*#9c27b0;*/     /*#673AB7;*/
                font-family: 'Calibri', sans-serif !important
            }

            .container {
                margin-top: 60px;
            }

            .card {
                position: relative;
                display: -webkit-box;
                display: -ms-flexbox;
                display: flex;
                -webkit-box-orient: vertical;
                -webkit-box-direction: normal;
                -ms-flex-direction: column;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-color: #fff;
                background-clip: border-box;
                border: 0px solid transparent;
                border-radius: 0px
            }


            .card-body {
                -webkit-box-flex: 1;
                -ms-flex: 1 1 auto;
                flex: 1 1 auto;
                padding: 1.25rem
            }

            .card .card-title {
                position: relative;
                font-weight: 600;
                margin-bottom: 10px
            }

            .table {
                width: 100%;
                max-width: 100%;
                margin-bottom: 1rem;
                background-color: transparent
            }

            * {
                outline: none
            }

            .table th,
            .table thead th {
                font-weight: 500
            }

            .table thead th {
                vertical-align: bottom;
                border-bottom: 2px solid #dee2e6
            }

            .table th {
                padding: 1rem;
                vertical-align: top;
                border-top: 1px solid #dee2e6
            }

            .table th,
            .table thead th {
                font-weight: 500
            }

            th {
                text-align: inherit
            }

            .m-b-20 {
                margin-bottom: 20px
            }

            .customcheckbox {
                display: block;
                position: relative;
                padding-left: 24px;
                font-weight: 100;
                margin-bottom: 12px;
                cursor: pointer;
                font-size: 22px;
                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                user-select: none
            }

            .customcheckbox input {
                position: absolute;
                opacity: 0;
                cursor: pointer
            }

            .checkmark {
                position: absolute;
                top: -3px;
                left: 0;
                height: 20px;
                width: 20px;
                background-color: #CDCDCD;
                border-radius: 6px
            }

            .customcheckbox input:checked~.checkmark {
                background-color: #2196BB
            }

            .customcheckbox .checkmark:after {
                left: 8px;
                top: 4px;
                width: 5px;
                height: 10px;
                border: solid white;
                border-width: 0 3px 3px 0;
                -webkit-transform: rotate(45deg);
                -ms-transform: rotate(45deg);
                transform: rotate(45deg)
            }
            h5{
                font-family: Monaco;
                font-size: 28px;
                display: inline-block;

            }
            th{
                font-family: Monaco;
                font-size: 20px;
            }
            td{
                font-family: Monaco;
                font-size: 18px;
            }


            .btnForNavigation{
                float: right;
                font-family: Monaco;
                font-size: 24px;

            }
        </style>
    </head>
    <body>

    </table>

    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body text-center">
                        <h5 class="card-title m-b-0">Applied Student Records..</h5>
                        <a  href="AdminDashboard.jsp" class="btn btn-danger btnForNavigation" role="button"><i class="bi bi-award-fill"></i> AdminDashboard</a>
                    </div>
                    <div class="table-responsive">
                        <table class="table">
                            <thead class="thead-light">
                                <tr>

                                    <th scope="col">Username</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Course</th>
                                    <th scope="col">Contact_No</th>
                                    <th scope="col">gender</th>
                                </tr>
                            </thead>
                            <tbody class="customtable">
                                <tr>

                                    <%

                                        Connection conn = null;
                                        Statement stmt = null;
                                        ResultSet rs = null;

                                        String query = null;

                                        try {
                                            Class.forName("com.mysql.jdbc.Driver");

                                            conn = DriverManager.getConnection("jdbc:mysql://localhost/javatest", "root", "");

                                            query = "select * from students";
                                            stmt = conn.createStatement();
                                            rs = stmt.executeQuery(query);

                                            while (rs.next()) {
                                    %>

                                    <td>
                                        <%= rs.getString(1)%>
                                    </td>
                                    <td>
                                        <%= rs.getString(3)%>
                                    </td>
                                    <td>
                                        <%= rs.getString(5)%>
                                    </td>
                                    <td>
                                        <%= rs.getString(4)%>
                                    </td>
                                    <td>
                                        <%= rs.getString(6)%>
                                    </td>

                                </tr>
                                <%

                                        }

                                    } catch (Exception e) {
                                        e.printStackTrace();

                                    }
                                %>

                                </td>

                                </tr>


                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>



<!--         <table width="100%">
            <tr height="100px">
                <td colspan="4" align="center"><h1><b>Student Admission</b></h1></td></tr>
            <tr height="50px" align="center"><td><h3><a href="home.jsp">Home</a></h3></td>
                <td><h3><a href="registration.jsp">Student Admission</a></h3></td>
                <td><h3><a href="feedback.jsp">Feedback</a></h3></td>
                <td><h3><a href="aboutus.jsp">About Us</a></h3></td></tr>
            <tr height="500px" align="center"><td colspan="4">  
                  /////////////////////////////////////////
                </td></tr>
        </table>-->
