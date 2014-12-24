<%-- 
    Document   : main
    Created on : Dec 4, 2014, 6:32:26 PM
    Author     : earthzy
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Model.connectDb"%>
<%@page import="java.sql.Connection"%>
<%@page import="Model.BankAccount"%>
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
        <%
            long random = (long)((Math.random() * 1999999999) + 1000000000);
            
        %>
        
        
        <form action="register" >
            <div class="regis-box">
                <a href="login.jsp"> <img src="asset/images/home.png" width="50px" height= auto alt="home" style="float:left; margin-left:20px"></a>
                <b><h1 style="text-align:center;">Register</h1><hr><br></b>
                <div style="margin-left: 130px">
                    <table>
                        <tr>
                        <input required name="id" style="background-color: gainsboro" type="text" class="input-lg" value="<%=random %>" hidden>
                            <td> <h3 style="text-align: right" >ACCOUNT ID :&nbsp;&nbsp;</h3></td>
                            <td><input required style="background-color: gainsboro" type="text" class="input-lg" value="<%=random %>" disabled></td>
                        </tr>
                        <tr>
                            <td> <h3 style="text-align: right" >ACCOUNT Name :&nbsp;&nbsp;</h3></td>
                            <td><input required name="name" type="text" class="input-lg" ></td>
                        </tr>
                        <tr>
                            <td> <h3 style="text-align: right" >Password :&nbsp;&nbsp;</h3></td>
                            <td><input required name="pass" type="password" class="input-lg" ></td>
                        </tr>
                        <tr>
                            <td> <h3 style="text-align: right" >Confirm Password :&nbsp;&nbsp;</h3></td>
                            <td><input required name="cpass" type="password" class="input-lg" ></td>
                        </tr>
                        <tr>
                            <td> <h3 style="text-align: right">Amount :&nbsp;&nbsp;</h3></td>
                            <td><input required name="amount" type="number" class="input-lg" min="0"> Baht</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td style="padding-top: 20px">
                                <div>
                                    <input type="submit" value="Register" class="btn btn-success">&nbsp;&nbsp;&nbsp;
                                    <input type="reset" value="Reset" class="btn btn-danger">
                                </div>
                            </td>
                        </tr>
                        
                    </table>
                    
                </div>
          <div style="color: red;margin-left: 35%;" ><h3>${message}</h3></div>
            </div>
        </form>
    </body>
</html>
<script>
    $(document).ready(function() {
        $("div.regis-box").fadeIn(1000);
    });
</script>