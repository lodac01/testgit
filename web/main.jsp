<%-- 
    Document   : main
    Created on : Dec 4, 2014, 6:32:26 PM
    Author     : earthzy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
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

        <div class="main-box">
            <table style="margin-left:10%;" >
                <h1 style="text-align:center">Hello!! ${account.accountName}</h1>
                <hr>
                <tr>
                    <td><h1 style="text-align:right">Account ID :  </h1></td>
                    <td><h1> ${account.accountId}</h1></td>
                </tr>
                <tr>
                    <td><h1 style="text-align:right">Your Balance :  </h1></td>
                    <td><h1><f:formatNumber> ${account.balance}</f:formatNumber></h1></td>
                </tr>
            </table>

        </div>
    </body>
</html>
<script>
    $(document).ready(function() {
        $("div.main-box").fadeIn(1000);
    });
</script>