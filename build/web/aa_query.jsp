

<%@page import="connection.MyCon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
<head>
  <title>Order Update</title>
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
    .notifications {
padding: 2.2% 2%;
  margin: 0% 8%;
}
.notifications div{
  border-top: .03px solid rgb(237, 239, 255);
  padding: 1.5% 1%;
  line-height:300%;
}
.notifications div:nth-child(odd){
  background-color: rgb(247, 250, 255);
}
.notifications div:nth-child(even){
  background-color: white;
}

.notifications  div a{
   
   display: inline;
color: rgb(43, 199, 170);
  font-style: none;
}
.notifications  a:hover{
color: rgb(0, 191, 144);
  font-style: none;
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
       
        
        <li><a href="transporter_verify.jsp"> Verify Transporter</a></li>
        <li class="active"><a href="aa_query.jsp">Order Update</a></li>
        
        <li ><a href="aa_notification.jsp">Notifications</a></li>
        
        
      </ul>
    </div>
  </div>
</nav>

<div class="container-fluid">
  <div class="row content">
    <div class="sidenav col-sm-2  hidden-xs left_col  ">
      <h2 id="tag">ZipZapZoom</h2>
      <ul class="nav nav-pills  nav-stacked ">
        <li class="list"><a href="transporter_verify.jsp"><i class="fa fa-truck" style="font-size:170%;color:white;" aria-hidden="true"></i>Verify Transporter</a></li>
        <li class="list active"><a href="aa_query.jsp"><i class="fa fa-television" style="font-size:170%;color:white;" aria-hidden="true"></i>Order Update</a></li>
        <li class="list "><a href="aa_notification.jsp"><i class="fa fa-bell-o" style="font-size:170%;color:white;"></i>Notifications</a></li>
        </ul><br>
    </div>
    <br>
   
    <div class="col-sm-10">
      <div class="well">
        <h4>Dashboard</h4>
        <p>Some text..</p>
      </div>
      <div class="well">
        <h3>Order Update</h3>
        
      </div>
      <div class="well">
          <div class="notifications">
        <%
            Connection con=MyCon.getConnection();
            PreparedStatement ps=con.prepareStatement("Select oid,cust_email from query_table where status=?");
            ps.setString(1,"a");
            ResultSet rs=ps.executeQuery();
          //  if(rs.next()){
          int i=0;
                while(rs.next()){
                    i++;
                String oid= rs.getString(1);
                String email= rs.getString(2);

        %>
        <div> <%=i%>. Order ID's <%=oid%> 
            <span>
       
         
         <a href="update_query.jsp?oid=<%=oid%>&email=<%=email%>">...Click Here</a>
    
            </span>
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

</body>
</html>

         
   
