<%-- 
    Document   : login.jsp
    Created on : Oct 17, 2019, 5:57:59 PM
    Author     : SOM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html class="no-js" lang="en">
<!--<![endif]-->

<head>
    <!--====== USEFULL META ======-->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Transportation & Agency Template is a simple Smooth transportation and Agency Based Template" />
    <meta name="keywords" content="Portfolio, Agency, Onepage, Html, Business, Blog, Parallax" />

    <!--====== TITLE TAG ======-->
    <title>ZipZapZoom</title>

    <link href="index1.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
   <style type="text/css">
      
.container {
    width: 100%;
    padding: 0%;
}
.logo{
  color:white;
} 
.navbar-inverse .navbar-nav>li>a {
    color: rgb(224, 255, 222);
}

   </style>
</head>
<body>
 
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <div class="logo"><h2>ZipZapZoom</h2></div>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav left_col "  style="float: right; margin-top: 1%; color: rgb(224, 255, 222);margin-right: 8%;">
        <li><a href="Login.jsp">Login</a></li>
        <li><a href="#">Customers & Transporters</a></li>
        <!-- <li><a href="accountupdate.jsp">Manage Account</a></li>
        <li><a href="logout">Logout</a></li> -->
      </ul>
    </div>
  </div>
</nav>
    <div class="container " style="width: 100%;padding: 0%;">
        <div class="container-fluid" style="width: 100%;padding: 0%;">

        <div class=" row one"  style="width: 100%;padding: 0%;margin: 0%">
            <div class="x" style="margin: 10% 5% 0% 5%;">
            <div class="col-sm-6  "  >
                <div class="one1">
            <h1>WE HAVE 25 YEARS EXPERIENCE IN THIS PASSION</h1>
There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum,
           
           </div>
        </div>
<div class="col-sm-1"></div>
           
            <div class="col-sm-5 " >
                <div class="text-block">
                <h3>Register Yourself</h3><br/>
                 <form class="form-horizontal" action="resgisterUser" enctype="multipart/form-data" style="margin-right: -15px;margin-left: 15px;" >
    <div class="form-group">
        <input type="text" class="form-control" id="email" placeholder="Email" name="email">
    </div>
    <div class="form-group">
           <input type="text" class="form-control" id="pwd" placeholder="Company Name" name="name">
    </div>
    <div class="form-group">
     
        <input type="text" class="form-control" id="pwd" placeholder="Phone Number" name="phoneno">
    </div>
    <div class="form-group">
     
        <textarea type="text" rows="5" class="form-control" id="pwd" placeholder="Address" name="address"></textarea>
    </div>
     <div class="form-group">
      <select class="form-control" id="sel1" name="type" >
        <option class="option">Customer</option>
        <option class="option">Transporter</option>
    </select>
  </div>
    <div class="form-group">
        <input type="password" class="form-control" id="pwd" placeholder="Password" name="password">
    </div>      
     
   
    <div class="form-group">        
      <div class="col-sm-offset-2 ">
        <button type="submit" class="btn btn-success btn-lg">Register</button>
      </div>
    </div>
  </form>
                </div>
</div>
            </div>

           
    </div>
</div>
    
    </div>

</body>
</html>
