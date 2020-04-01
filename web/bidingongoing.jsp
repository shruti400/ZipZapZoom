<%-- 
    Document   : bidingongoing.jsp
    Created on : Oct 20, 2019, 2:35:33 AM
    Author     : SOM
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/zipzapzoom","root","");
    PreparedStatement ps = con.prepareStatement("select * from bidinglog");
    ResultSet rs=ps.executeQuery();
   String oid="";
%>

<html lang="en">
<head>
  <title>Orders In Progress</title>
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
        <li class="active"><a href="currentordersstatus.jsp">Orders Ongoing</a></li>
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
          <%
           if(utype.equals("Customer")){%>
        <li class="list"><a href="cust_order.jsp"><i class="fa fa-truck" style="font-size:170%;color:white;" aria-hidden="true"></i>Placeorder</a></li>
        <%}%>
        <li class="list active"><a href="bidingongoing.jsp"><i class="fa fa-television" style="font-size:170%;color:white;" aria-hidden="true"></i>Ongoing Biding</a></li>
        <li class="list"><a href="currentordersstatus.jsp"><i class="fa fa-clock-o" style="font-size:170%;color:white;" aria-hidden="true"></i>Orders Ongoing</a></li>
        <li class="list"><a href="previousorder.jsp"><i class="fa fa-table" style="font-size:170%;color:white;" aria-hidden="true"></i>All Orders</a></li>
        <li class="list"><a href="notification.jsp"><i class="fa fa-bell-o" style="font-size:170%;color:white;"></i>Notifications</a></li>
        <li class="list"><a href="accountupdate.jsp"><i class="fa fa-address-book-o" style="font-size:170%;color:white;"></i>Manage Account</a></li>
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
        <h3>Orders In Progress</h3>
        
      </div>
      <div class="well">
        <div class="table-responsive">
          <table class="table table-bordered table-dark table-hover">
            <thead>
              <tr>
                <th scope="col">OID</th>
                <th scope="col">Loading Point</th>
                <th scope="col">Loading Date</th>
                <th scope="col">Delivery Point</th>
                <th scope="col">Delivery Date</th>
                <th scope="col">Bid Value</th>
              </tr>
            </thead>
            <tbody>
                <%
                    while(rs.next()){
                         oid=rs.getString(1);
//                         Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/zipzapzoom","root","");
     PreparedStatement ps1 = con.prepareStatement("select * from query_table where oid=?");
     ps1.setString(1,oid);
    ResultSet rs1=ps1.executeQuery();
    String l_place="",l_date="",d_date="",d_place="";
    while(rs1.next()){
         l_place=rs1.getString(2);
         l_date=rs1.getString(3);
                d_place=rs1.getString(4);
        d_date=rs1.getString(5);
        
                        
    }
                %>
              <tr>
                <th scope="row"><%=oid%></th>
                
                <td><%=l_place%></td>
                <td><%=l_date%></td>
                <td><%=d_place%></td>
                <td><%=d_date%></td>
                <td><a href="bidingoid.jsp?oid=<%=oid%>"><button typr="button" class="btn btn-small btn-primary">Click Here</button></a></td>
              </tr>
               <%}%>
              
            </tbody>
          </table>
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