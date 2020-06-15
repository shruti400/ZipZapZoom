<%--
    Document   : accountupdate.jsp
    Created on : Oct 18, 2019, 1:52:59 PM
    Author     : SOM
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="connection.MyCon"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Manage Account</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  
  <!-- <link rel="stylesheet" href="inner.css"> -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <style>
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 550px}
   
    /* Set gray background color and 100% height */
    .sidenav {
      background-color: #2196F3;
      
      height: 50em;
      position:fixed;

      
    }
    #tag{
      color:white;
    }
       .well{
        background-color: white;
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
        margin-top: 30%;
      }
    }

  </style>
</head>
<body>
<%
            
               String email=(String)session.getAttribute("email");
               Connection con=MyCon.getConnection();
               PreparedStatement ps=con.prepareStatement("select company_name, address, password from transportertemp where emailaddress=? ");
               ps.setString(1,email);
               ResultSet rs=ps.executeQuery();
               String company_name="",address="", password="";
               if(rs.next()){
                   company_name=rs.getString("company_name");
                   address=rs.getString("address");
                   password=rs.getString("password");
               }
        %>
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
       <%String utype=(String)session.getAttribute("utype");
           if(utype.equals("Customer")){%>
        <li ><a href="cust_order.jsp">Placeorder</a></li><%}%>
        <li><a href="bidingongoing.jsp"> Ongoing Biding</a></li>
        <li ><a href="currentordersstatus.jsp">Orders Ongoing</a></li>
        <li ><a href="previousorder.jsp">All Orders</a></li>
        <li><a href="notification.jsp">Notifications</a></li>
        <li class="active"><a href="accountupdate.jsp">Manage Account</a></li>
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
          <%
           if(utype.equals("Customer")){%>
        <li class="list"><a href="cust_order.jsp"><i class="fa fa-truck" style="font-size:170%;color:white;" aria-hidden="true"></i>Placeorder</a></li>
        <%}%>
        <li class="list "><a href="bidingongoing.jsp"><i class="fa fa-television" style="font-size:170%;color:white;" aria-hidden="true"></i>Ongoing Biding</a></li>
        <li class="list "><a href="currentordersstatus.jsp"><i class="fa fa-clock-o" style="font-size:170%;color:white;" aria-hidden="true"></i>Orders Ongoing</a></li>
        <li class="list "><a href="previousorder.jsp"><i class="fa fa-table" style="font-size:170%;color:white;" aria-hidden="true"></i>All Orders</a></li>
        <li class="list"><a href="notification.jsp"><i class="fa fa-bell-o" style="font-size:170%;color:white;"></i>Notifications</a></li>
        <li class="list active"><a href="accountupdate.jsp"><i class="fa fa-address-book-o" style="font-size:170%;color:white;"></i>Manage Account</a></li>
        <li class="list"><a href="logout"><i class="fa fa-user-o" style="font-size:170%;color:white;"></i>Logout</a></li>
      </ul><br>
    </div>
    <br>
   
   
    <div class="col-sm-10">
      <div class="well">
        <h4>Dashboard</h4>
        <p>Some text..</p>
      </div>
      <div class="well">
        <h3>Manage Acoount</h3>
        
      </div>
      <div class="well">
          <div class="container">
              <form class="form-group row" action="acc_up">
                  <p>
  <a class="btn btn-primary" data-toggle="collapse" href="#multiCollapseExample1" role="button" aria-expanded="false" aria-controls="multiCollapseExample1">Update Company Name</a>
  <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#multiCollapseExample2" aria-expanded="false" aria-controls="multiCollapseExample2">Update Address</button>
  <a class="btn btn-primary" data-toggle="collapse" href="#multiCollapseExample3" role="button" aria-expanded="false" aria-controls="multiCollapseExample3">Update Password</a>
  
</p>
<div class="row">
  <div class="col">
    <div class="collapse multi-collapse" id="multiCollapseExample1">
      <div class="card card-body col-sm-4">
        <input type="text" class="form-control" name="company_name" value="<%=company_name%>" /></p>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="collapse multi-collapse" id="multiCollapseExample2">
      <div class="card card-body col-sm-4">
       <input type="text" class="form-control" name="address" value="<%=address%>" />
      </div>
    </div>
  </div>
  <div class="col">
    <div class="collapse multi-collapse" id="multiCollapseExample3">
      <div class="card card-body col-sm-4">
        <input type="password" class="form-control" name="password" value="<%=password%>" />
      </div>
    </div>
  </div>
</div>
            <input class="btn btn-success" type="submit" value="Save changes"/>
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