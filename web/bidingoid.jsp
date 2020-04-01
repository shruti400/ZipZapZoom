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
            PreparedStatement ps=con.prepareStatement("Select l_place,l_date,d_place,d_date,description,weight,price,expected_date from query_table where oid=?");
            ps.setString(1,oid);
         //   ps.setString(2,"Transporter");
            
            ResultSet rs=ps.executeQuery();
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
  <script>
        var req;
        function checkID(){
        req=new XMLHttpRequest();
        req.onreadystatechange=getResult;
        var v=document.getElementById("price").value;
        var oid=document.getElementById("oid").value;
        req.open("get", "updatebid?price="+v+"&oid="+oid, true);
        req.send();            
        }
        function getResult(){
            if(req.readyState==4 && req.status==200){
                res=req.responseText;
                document.getElementById("updateprice1").innerHTML=res;
            }
            else{
               // alert("Invalid bid");
//                document.getElementById("updateprice1").innerHTML="Error...."
                
            }
        }
        </script>
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
        <h3>Bid Your Value</h3>
        
      </div>
      
      <div class="well">
           
        <h4>Order Details</h4>
        <%while(rs.next()){
             l_place=rs.getString(1);
           l_date=rs.getString(2);
           d_place=rs.getString(3);
           d_date=rs.getString(4);
           description=rs.getString(5);
           weight=rs.getString(6);
           price=rs.getString(7);
           expecteddate=rs.getString(8);
            
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
        <td>Base Biding Price</td>
        
        <td><%=price%></td>
      </tr>
      <tr>
        <td>Expected Date</td>
        
        <td><%=expecteddate%></td>
      </tr>
   
      
                 
    
      
      
    </tbody>
  </table>
      
      <%}%>
       <% if(utype.equals("Transporter")){%>
  
    <div class="form-group">
      <label for="price">Submit Your Bid:</label>
      <input type="text" class="form-control" id="price" placeholder="Submit Your Bid" name="email">
    </div>
    <input type="hidden" value="<%=oid%>" id="oid">
    <button   onclick="checkID()" class="btn btn-primary">Submit</button>
    <a href="bidingoid.jsp?oid=<%=oid%>"><button  class="btn btn-success">Refresh</button></a>
  <%}%>
  <div id="updateprice1">
      <%
                     int f=0;
                     String bidemail="";
                     int bidprice=0;
                 PreparedStatement ps1=con.prepareStatement("Select emailaddress,price from bidinglog where oid=?");
            ps1.setString(1,oid);
         //   ps.setString(2,"Transporter");
            
            ResultSet rs1=ps1.executeQuery();
            while(rs1.next()){
                f=1;bidemail=rs1.getString(1);
                bidprice=Integer.parseInt(rs1.getString(2));
            }
                 %>
                 <table class="table table-bordered table-hover">
                     <tbody>
                 <tr >
        <td class="success">Current Bid</td>
        <td class="success"><%=bidprice%></td>
         <td class="info">Transporter</td>
        <td class="info">  <%=bidemail%></td>
                 </tr>
                     </tbody>
                 </table>
      
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

</body>
</html>
