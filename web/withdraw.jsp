<%-- 
    Document   : main
    Created on : Dec 4, 2014, 6:32:26 PM
    Author     : earthzy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
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
                        <li class="active"><a href="withdraw.jsp">withdraw<span class="sr-only">(current)</span></a></li>
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

        <div class="withdraw-box">
            <h1 style="text-align:center">Withdraw</h1>
            <hr>
            <div style="text-align:center;margin-top: 40px;">
                <form action="withdraw"  method="post">
                    <table style="margin: 0 auto;">
                        <tr style="text-align: right">
                            <td><h1> Amount :&nbsp;</h1></td>
                            <td> <input type="number" class="input-lg"  name="amount" min="0" maxlength="11"></td>
                        </tr>
                        <tr style="text-align: right">
                            <td><h1> Password :&nbsp;</h1></td>
                            <td> <input type="password" class="input-lg" name="password"></td>
                        <input type="hidden" value="${account.accountId}" name="hid">
                        </tr>
                        <tr style="text-align: right">
                            <td><h1> Balance :&nbsp;</h1></td>
                            <td> <h2><f:formatNumber> ${account.balance}</f:formatNumber></h2> </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td style="text-align: left;padding-top: 20px;">
                                <div>
                                    <input type="submit" value="Withdraw" class="btn btn-success">&nbsp;&nbsp;&nbsp;
                                    <input type="reset" value="Reset" class="btn btn-danger">
                                </div>
                            </td>
                        </tr>
                    </table>
                </form>
                          <div style="color: red;margin-left: 5%;margin-top: 5%;" ><h3>${mss}</h3></div>
            </div>
        </div>
    </body>
</html>

<script>
    $(document).ready(function() {
        $("div.withdraw-box").fadeIn(1000);
    });
</script>
