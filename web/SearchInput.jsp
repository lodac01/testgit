<form action="search" method="post">
    <div class="search-box">
        <a href="login.jsp"> <img src="asset/images/home.png" width="50px" height= auto alt="home" style="float:left; margin-left:20px"></a>
        <b><h1 style="text-align:center;">Search</h1><hr><br></b>
        <div style="margin-left: 20px;margin-top: -25px;margin-bottom: 20px">
           
            <div style="padding-left:150px;">
                <h4>Enter Customer name/id : 
                <input type="text" required name="id" size="20" value="${param.id}">
                <input type="submit" value="Search"> 
                </h4>
            </div>
            
        </div>
    </div>
</form>
