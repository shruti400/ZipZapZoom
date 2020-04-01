
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    
    String email=(String)session.getAttribute("email");
%>

<html lang="en">
<head>
  <title>PlaceOrder</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  
  <!-- <link rel="stylesheet" href="inner.css"> -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="inner.css">
<!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>-->
  <!--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>-->
  <style>
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 550px}
   
    /* Set gray background color and 100% height */
    .sidenav {
      background-color: #2196F3;
      
      height: 50em;
      position:fixed;

      
    }
    .imageup{
        background-image: url('images/freight_cust.jpg');
    }
    #tag{
      color:white;
    }
       .well{
        background-color: #b19c9c2e;
       }
       .list a{
        color: #101417d6;

        background-color: #2196F3;
       }
    /* On small screens, set height to 'auto' for the grid */
    @media screen and (max-width: 767px) {
      .row.content {height: auto;}
    }
    @media screen and (min-width: 767px) {
      .col-sm-10 {margin-left:17%;}
      .nav-stacked {
        margin-top: 17%;
      }
    }
  </style>

</head>
<body>

<nav class="navbar navbar-inverse visible-xs">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar">ddd</span>
        <span class="icon-bar">trfg</span>
        <span class="icon-bar">jhf</span>                        
      </button>
      <a class="navbar-brand"  href="#">ZipZapZoom</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav left_col">
       
        <li class="active"><a href="cust_order.jsp">Placeorder</a></li>
        <li><a href="bidingongoing.jsp"> Ongoing Biding</a></li>
        <li><a href="currentordersstatus.jsp">Orders Ongoing</a></li>
        <li><a href="previousorder.jsp">All Orders</a></li>
        <li><a href="notification.jsp">Notifications</a></li>
        <li><a href="accountupdate.jsp">Manage Account</a></li>
        <li><a href="logout">Logout</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="container-fluid">
  <div class="row content">
    <div class="sidenav col-sm-2  hidden-xs left_col  ">
      <h2 id="tag">ZipZapZoom</h2>
      <ul class="nav nav-pills  nav-stacked ">
        <li class="list active"><a href="cust_order.jsp"><i class="fa fa-truck" style="font-size:170%;color:white;" aria-hidden="true"></i>Placeorder</a></li>
        <li class="list"><a href="bidingongoing.jsp"><i class="fa fa-television" style="font-size:170%;color:white;" aria-hidden="true"></i>Ongoing Biding</a></li>
        <li class="list"><a href="currentordersstatus.jsp"><i class="fa fa-clock-o" style="font-size:170%;color:white;" aria-hidden="true"></i>Orders Ongoing</a></li>
        <li class="list"><a href="previousorder.jsp"><i class="fa fa-table" style="font-size:170%;color:white;" aria-hidden="true"></i>All Orders</a></li>
        <li class="list"><a href="notification.jsp"><i class="fa fa-bell-o" style="font-size:170%;color:white;"></i>Notifications</a></li>
        <li class="list"><a href="accountupdate.jsp"><i class="fa fa-address-book-o" style="font-size:170%;color:white;"></i>Manage Account</a></li>
        <li class="list"><a href="logout"><i class="fa fa-user-o" style="font-size:170%;color:white;"></i>Logout</a></li>
      </ul><br>
    </div>
    <br>
   
    <div class="col-sm-10">
      <div class="well imageup">
        <h4>Dashboard</h4>
        <p>Some text..</p>
      </div>
      <div class="well">
          <h3>Place Order</h3><h6>Know The Max Fair</h6>
        
      </div>
      <div class="row">
        <div class="col-sm-12 ">
          <form action="placeorder" method="post" class="myform">
           
            <div class="col-sm-6"><label>Loading Date</label><br/>
                <input name="l_date" type="text" placeholder="Loading Date" />
            </div>
            <div class="col-sm-6"><label>Loading Place</label><br/>
                <input name="l_place" type="text" placeholder="Loading Place"/>
            </div>
            <div class="col-sm-6"><label>Delivery Date</label><br/>
                <input name="d_date" type="text" placeholder="Delivery Date"/>
            </div>
            <div class="col-sm-6"><label>Delivery Place</label><br/>
                <input name="d_place" type="text" placeholder="Delivery Place"/>
            </div>
            <div class="col-sm-12">
            <label>Add Order Description</label><br/>
            <textarea rows="7" cols="80" name="desc_item" placeholder="Add Order Description" ></textarea>
            </div>
            <div class="col-sm-12">    <label>Weight</label><br/>
                <input name="weight" type="text" placeholder="Weight"/>
              </div>
            <input type="submit" value="Send Query"/>
                   
        </form>
       
        </div>
      </div>
      <div class="row">
        <div class="footer">
         
        </div>
      </div>
    </div>
  </div>
</div>

</body>
</html>
