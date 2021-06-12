<%-- 
    Document   : loginAdmin
    Created on : Mar 19, 2021, 2:13:42 PM
    Author     : Avi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>loginAdmin</title>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/css/materialize.min.css">
        <style>
            body{
                background-color: #f1f2f3;
                display: flex;
                min-height: 100vh;
                flex-direction: column;

            }

            main {
                flex: 1 0 auto;
            }


            .input-field input[type=date]:focus + label,
            .input-field input[type=text]:focus + label,
            .input-field input[type=email]:focus + label,
            .input-field input[type=password]:focus + label {
                color:#e91e63;
            }

            .input-field input[type=date]:focus,
            .input-field input[type=text]:focus,
            .input-field input[type=email]:focus,
            .input-field input[type=password]:focus {
                border-bottom: 2px solid #e91e63;
                box-shadow: none;
            }
            h5{
                font-family: Monaco;
                font-size: 26px;
            }
            #loginBtnA{
                font-family: Monaco;
            }
            .btnForNavigation{
                font-family: Monaco;
                font-size: 20px;
                
            }
            
        </style>
    </head>
    <body>
    


        <div class="section"></div>
        <main>
            <center>

                <div class="section"></div>

                <h5 class="indigo-text">Please, login into your account</h5>
                <div class="section"></div>

                <div class="container">
                    <div class="z-depth-1 grey lighten-4 row" style="display: inline-block; padding: 32px 48px 0px 48px; border: 1px solid #EEE;">

                        <form class="col s12" method="POST" action="loginProcess.jsp">
                            <div class='row'>
                                <div class='col s12'>
                                </div>
                            </div>

                            <div class='row'>
                                <div class='input-field col s12'>
                                    <input class='validate' type='email' name="email"  />
                                    <label for='email'>Enter your email</label>
                                </div>
                            </div>

                            <div class='row'>
                                <div class='input-field col s12'>
                                    <input class='validate' type='password' name="password" />
                                    <label for='password'>Enter your password</label>
                                </div>
                                <label style='float: right;'>
                                    <a class='pink-text' href='#!'><b>Forgot Password?</b></a>
                                </label>
                            </div>

                            <br />
                            <center>
                                <div class='row'>
                                    <button type='submit' name='btn_login' class='col s12 btn btn-large waves-effect indigo' id="loginBtnA">Login</button>
                                </div>
                            </center>
                            
                        </form>
                       
                    </div>
                </div>
               <a  href="home.jsp" class="btn btn-large btnForNavigation" role="button" >Home</a>

               
            </center>
            
            <div class="section"></div>
            <div class="section"></div>
        </main>

        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.1/jquery.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.min.js"></script>


    </body>
</html>
