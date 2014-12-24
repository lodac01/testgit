<%-- 
    Document   : main
    Created on : Dec 4, 2014, 6:32:26 PM
    Author     : earthzy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="info"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="l" %>

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
                        <li class="active"><a href="showTransaction">transaction<span class="sr-only">(current)</span></a></li>
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

        <div class="tran-box">
            <h2 style="margin-left:40px;">Transaction</h2>
            <hr>

            <info:tran-tag transection="${transaction}"> </info:tran-tag>

        </div>
    </body>
</html>
<script>
    $(document).ready(function() {
        $("div.tran-box").fadeIn(1000);
    });
</script>