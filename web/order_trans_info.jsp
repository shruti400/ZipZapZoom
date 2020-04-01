<%-- 
    Document   : bidingoid.jsp
    Created on : Oct 24, 2019, 2:07:53 PM
    Author     : SOM
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="connection.MyCon"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
            String utype=(String)session.getAttribute("utype");
            Connection con=MyCon.getConnection();
            String oid=(String)request.getParameter("oid");
            PreparedStatement ps=con.prepareStatement("Select l_place,l_date,d_place,d_date,description,weight,price,expected_date,trans_email,cust_email from query_table where oid=?");
            ps.setString(1,oid);
         //   ps.setString(2,"Transporter");
            
            ResultSet rs=ps.executeQuery();
          String email="";
          String l_place="";
          String l_date="";
          String d_place="";
          String d_date="";
          String description="";
          String weight="";
          String price="";
          String expecteddate="";
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
<script>
        var req;
        function checkID(){
        req=new XMLHttpRequest();
        req.onreadystatechange=getResult;
        var v=document.getElementById("email").value;
        var oid=document.getElementById("oid").value;
        var p=document.getElementById("price").value;
//        var e=document.getElementById("email1").value;
        console.log("verifyotp?email="+v+"&oid="+oid+"&otp="+p);
        req.open("get", "verifyotp1?email="+v+"&oid="+oid+"&otp="+p, true);
        req.send();            
        }
        function getResult(){
            if(req.readyState==4 && req.status==200){
                res=req.responseText;
                document.getElementById("u1").innerHTML=res;
            }
            else{
                                document.getElementById("u1").innerHTML=req;
                
            }
        }
        </script>
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
       <% utype=(String)session.getAttribute("utype");
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
      <div class="well pic">
        
      </div>
      <div class="well">
        <h3>Order Delivered  OID : <%=oid%></h3>
        
      </div>
      
      <div class="well">
           <div class="container">
              
                  <p>
                    <a class="btn btn-primary" data-toggle="collapse" href="#multiCollapseExample1" role="button" aria-expanded="false" aria-controls="multiCollapseExample1">Order Details</a>
                    <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#multiCollapseExample2" aria-expanded="false" aria-controls="multiCollapseExample2">Customer Details</button>

                    </p>
                    <div class="collapse multi-collapse" id="multiCollapseExample1">
        <h4>Order Details</h4>
        <%String cemail="";
            while(rs.next()){
             l_place=rs.getString(1);
           l_date=rs.getString(2);
           d_place=rs.getString(3);
           d_date=rs.getString(4);
           description=rs.getString(5);
           weight=rs.getString(6);
           price=rs.getString(7);
           expecteddate=rs.getString(8);
            email=rs.getString(10);
            cemail=rs.getString(9);
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
        
        <td><%=description%></td>
      </tr>
      <tr>
        <td>Weight</td>
        
        <td><%=weight%></td>
      </tr>
      <tr>
        <td>Price</td>
        
        <td><%=price%></td>
      </tr>
      <tr>
        <td>Expected Date</td>
        
        <td><%=expecteddate%></td>
      </tr>
      
   
      
                 
    
      
      
    </tbody>
  </table>
      
      <%}
      
      PreparedStatement ps1=con.prepareStatement("select * from transportertemp where emailaddress=?");
       ps1.setString(1,email);
       ResultSet rs1=ps1.executeQuery();
String company_name="";
String phone_no="";
String address="";
%>
                    </div>
                    <div class="collapse multi-collapse" id="multiCollapseExample2">
      <h4>Customer Details</h4>
        <%
            while(rs1.next()){
             email=rs1.getString(1);
           company_name=rs1.getString(2);
           phone_no=rs1.getString(3);
           address=rs1.getString(4);
           
            
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
        <td>Email Address</td>
        
        <td><%=email%></td>
      </tr>
      <tr>
        <td>Company Name</td>
        
        <td><%=company_name%></td>
      </tr>
      <tr>
        <td>Phone Number</td>
        
        <td><%=phone_no%></td>
      </tr>
      <tr>
        <td>Address</td>
        
        <td><%=address%></td>
      </tr>
      <tr>
        
   
      
                 
    
      
      
    </tbody>
  </table>
      
      <%}%>
                    </div>
  
      </div>
      <!--<form class="form-inline" action="verifyotp">-->
                        <input type="hidden"  id="email" value="<%=cemail%>"/>
                    <input type="hidden"  id="oid" value="<%=oid%>"/>
                    <!--<input type="hidden"  id="email1" value="<%=email%>"/>-->
                        <div >
                          <label for="price">Order Delivered(Enter OTP)</label>
                          <input type="text"  id="price" placeholder="Enter OTP" name="otp">
                        </div>
                        

                        <button   onclick="checkID()" class="btn btn-primary">Verify</button>
                      <!--</form>-->
                        <p id="u1"></p>

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
