<%-- 
    Document   : main
    Created on : Dec 4, 2014, 6:32:26 PM
    Author     : earthzy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="header.html" %>
        <script src="asset/js/jquery.js" type="text/javascript"></script>
    </head>
    <body>
        <style>
            body{
                background-image:url("asset/images/bg-image.jpg");
                background-repeat: no-repeat;
                background-size:cover;
            }
        </style>

        <nav class="navbar navbar-default" role="navigation">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="main.jsp" style="background-color: black;color: white; ">SIT BANKK</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li><a href="withdraw.jsp">withdraw</a></li>
                        <li><a href="deposit.jsp">deposit</a></li>
                        <li><a href="showTransaction">transaction</a></li>
                    </ul> 
                    <table class="navbar-right">
                        <tr>
                            <td> ${account.accountName}</td>
                            <td> &nbsp;&nbsp; (<a href="logout">Logout</a>)</td>
                            <td> &nbsp;&nbsp; <a href="edit.jsp">Edit account</a></td>
                        </tr>
                    </table>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>

        <form action="edit" >
            <div class="regis-box">
                <a href="/netbank"> <img src="asset/images/home.png" width="50px" height= auto alt="home" style="float:left; margin-left:20px"></a>
                <b><h1 style="text-align:center;">Edit Account</h1><hr><br></b>
                <div style="margin-left: 130px">
                    <table>
                        <tr>
                            <td> <h3 style="text-align: right" >ACCOUNT ID :&nbsp;&nbsp;</h3></td>
                            <td><input required name="id" style="background-color: gainsboro" type="rext" class="input-lg" value="${account.accountId}" disabled></td>
                        </tr>
                        <tr>
                            <td> <h3 style="text-align: right" >ACCOUNT Name :&nbsp;&nbsp;</h3></td>
                            <td><input required name="name" type="text" class="input-lg" max="15" value="${account.accountName}" disabled></td>
                        </tr>
                        <tr>
                            <td> <h3 style="text-align: right" >Old Password :&nbsp;&nbsp;</h3></td>
                            <td><input required name="oldpass" type="password" class="input-lg" max="13"></td>
                        </tr>
                        <tr>
                            <td> <h3 style="text-align: right" >Password :&nbsp;&nbsp;</h3></td>
                            <td><input required name="pass" type="password" class="input-lg" max="13"></td>
                        </tr>
                        <tr>
                            <td> <h3 style="text-align: right" >Confirm Password :&nbsp;&nbsp;</h3></td>
                            <td><input required name="cpass" type="password" class="input-lg" max="13"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td style="padding-top: 20px">
                                <div>
                                    <input type="submit" value="Confirm" class="btn btn-success">&nbsp;&nbsp;&nbsp;
                                    <input type="reset" value="Reset" class="btn btn-danger">
                                </div>
                            </td>
                        </tr>
                    </table>
                    <div style="color: red;margin-left: 20%;margin-top: 5%;" ><h3>${passmess}</h3></div>

                </div>

            </div>
        </form>
    </body>
</html>
<script>
    $(document).ready(function() {
        $("div.regis-box").fadeIn(1000);
    });
</script>