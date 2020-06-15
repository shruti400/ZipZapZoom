<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.time.LocalTime"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.util.*" %>  
 <%
      //LocalTime d=LocalTime.now();
      Random randomGenerator = new Random();
	int randomInt = randomGenerator.nextInt(1000000);
      int amt=(4*Integer.parseInt(request.getParameter("amount")))/100;
      int oid=Integer.parseInt(request.getParameter("oid"));
    

 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Merchant Check Out Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Evrsoft First Page">
<meta charset="utf-8">
  <!--<meta name="viewport" content="width=device-width, initial-scale=1">-->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  
  <!-- <link rel="stylesheet" href="inner.css"> -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  </head>
<body>
	<h1>Merchant Check Out Page</h1>
	<pre>
	</pre>
	<form method="post" action="pgRedirect1.jsp">
           
		<table class="table table-bordered table-dark table-hover table-responsive">
			<tbody>
				<tr scope="row">
					<th scope="col">S.No</th>
					<th scope="col">Label</th>
					<th scope="col">Value</th>
				</tr>
				<tr scope="row">
					<td scope="col">1</td>
					<td scope="col"><label>ORDER_ID::*</label></td>
					<td scope="col"><input id="ORDER_ID" 
						name="ORDER_ID" autocomplete="off"
						value="<%=oid%>">
					</td>
				</tr>
				<tr scope="row">
					<td scope="col">2</td>
					<td scope="col"><label>CUSTID ::*</label></td>
					<td scope="col"><input id="CUST_ID" name="CUST_ID" autocomplete="off" value="CUST001"></td>
				</tr>
				<tr scope="row">
					<td scope="col">3</td>
					<td scope="col"><label>INDUSTRY_TYPE_ID ::*</label></td>
					<td scope="col"><input id="INDUSTRY_TYPE_ID"  name="INDUSTRY_TYPE_ID" autocomplete="off" value="Retail"></td>
				</tr>
				<tr scope="row">
					<td scope="col">4</td>
					<td scope="col"><label>Channel ::*</label></td>
					<td scope="col"><input id="CHANNEL_ID"  name="CHANNEL_ID" autocomplete="off" value="WEB">
					</td>
				</tr>
				<tr scope="row">
					<td scope="col">5</td>
					<td scope="col"><label>txnAmount*</label></td>
					<td scope="col"><input title="TXN_AMOUNT" 
						type="text" name="TXN_AMOUNT"
						value="<%=amt%>">
					</td>
				</tr>
                                
				<tr scope="row">
					<td></td>
					<td></td>
					<td scope="col"><input value="CheckOut" type="submit"	onclick=""></td>
				</tr>
			</tbody>
		</table>
		* - Mandatory Fields
	</form>
</body>
</html>