<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="ac" %>
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
        <div class="regis-box">
            <jsp:include page="SearchInput.jsp" flush="true"/>    
             <ac:CustomerForm customer="${customer}"/> 
        </div>
                    
    </body>
</html>
<script>
    $(document).ready(function () {
        $("div.regis-box").fadeIn(1000);
    });
</script>