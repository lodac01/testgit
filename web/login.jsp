
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Login</title>
    <link rel="stylesheet" href="asset/css/reset.css">
    <link rel="stylesheet" href="asset/css/animate.css">
    <link rel="stylesheet" href="asset/css/styles.css">
    <script src="asset/js/jquery.js" type="text/javascript"></script>
    <link rel="stylesheet" href="asset/css/css.css">
</head>
<body>
    <div class="logo">
        SIT BANKK
    </div>
    <div id="container">
        <form action="login" method="post">
            <label for="name">Account ID</label>
            <input type="text" name="user">
            <label for="username">Password</label>
            <input type="password" name="password">
            <div id="lower">
                <input type="submit" class="submit" value="Login">
            </div>
        </form>
    </div>
    <div class="div-button">
        <div style="margin-left:48.5%;margin-top:23.5%;">
            <a href="search.jsp"><h6 style="color: #ffffff;float: left">Show Customer |</h6></a>
        </div>
        <div style="margin-left:57%;margin-top:23.5%;">
            <a href="register.jsp"><h6 style="color: #ffffff;float: left">Register</h6></a>
        </div>
    </div>
    ${message}
</body>
</html>
<script>
    $(document).ready(function() {
        $("div.div-button").fadeIn(2000);
    });
</script>



