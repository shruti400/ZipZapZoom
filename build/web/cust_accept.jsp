<%--
    Document   : cust_accept
    Created on : Oct 25, 2019, 5:33:52 PM
    Author     : Raja
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="connection.MyCon"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%     String email=(String)session.getAttribute("email");
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
    #tag{
      color:white;
    }
    
       .well{
        background-color: #b19c9c2e;
       }
       .c1{
      background-color:white;
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
      <a class="navbar-brand"  href="#">Customer</a>
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
      <div class="well">
        <h4>Dashboard</h4>
        <p>Some text..</p>
      </div>
      <div class="well">
          <h3>Place Order</h3><h6>Know The Max Fair</h6>
        
      </div>
      
      <div class="well c1">
          <h4>Order Details</h4>
        <%  
            String oid=request.getParameter("oid");
            Connection con=MyCon.getConnection();
            PreparedStatement ps=con.prepareStatement("Select * from query_table where oid=?");
            ps.setString(1,oid);
            ResultSet rs=ps.executeQuery();
            int price1=0;
            if(rs.next()){
                String l_place=rs.getString(2);
                String l_date=rs.getString(3);
                String d_place=rs.getString(4);
                String d_date=rs.getString(5);
                String desc_item=rs.getString(6);
                String weight=rs.getString(7);
                String expected_date=rs.getString(9);
                String price=rs.getString(8);
                price1=(Integer.parseInt(price)*4)/100;
                %>
                <table class="table table-bordered table-hover">
    <thead>
      <tr>
        <th>Details</th>
        
        <th>Value</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>Loading Place</td>
        
        <td><%=l_place%></td>
      </tr>
      <tr>
        <td>Loading Date</td>
        
        <td><%=l_date%></td>
      </tr>
      <tr>
        <td>Delivery Place</td>
        
        <td><%=d_place%></td>
      </tr>
      <tr>
        <td>Delivery Date</td>
        
        <td><%=d_date%></td>
      </tr>
      <tr>
        <td>Description</td>
        
        <td><%=desc_item%></td>
      </tr>
      <tr>
        <td>Weight</td>
        
        <td><%=weight%></td>
      </tr>
      <tr>
        <td>Base Biding Price</td>
        
        <td><%=price%></td>
      </tr>
      <tr>
        <td>Amount to be Paid for Live Biding</td>
        
        <td><%=price1%></td>
      </tr>
      <tr>
        <td>Expected Date</td>
        
        <td><%=expected_date%></td>
      </tr>
   
      
                 
    
      
      
    </tbody>
  </table>
                <div id="b">
                    <a href="TxnTest1.jsp?amount=<%=price%>&oid=<%=oid%>"><input class="btn btn-primary"  type="button" value="Accept&Pay" /></a>
                    <input type="button" value="Reject" class="btn btn-danger" onclick="checkID()"/>
                    <input type="hidden" value="<%=oid%>" id="oid"/>
                </div>
            <%
                }
            
        %>
   
        </div>
        </div>
      </div>
      <div class="row">
        <div class="footer">
         
        </div>
      </div>
    </div>
  </div>
</div>
    <script>
        var req;
        function checkID(){
        req=new XMLHttpRequest();
        req.onreadystatechange=getResult;
//        var v=document.getElementById("price").value;
        var oid=document.getElementById("oid").value;
        req.open("get", "rejectbid?oid="+oid, true);
        req.send();            
        }
        function getResult(){
            if(req.readyState==4 && req.status==200){
                res=req.responseText;
                document.getElementById("b").innerHTML=res;
            }
            else{
               // alert("Invalid bid");
//                document.getElementById("updateprice1").innerHTML="Error...."
                
            }
        }
        </script>
           
        
</body>
</html>
    
