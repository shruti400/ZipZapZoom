<%-- 
    Document   : intial
    Created on : Nov 1, 2019, 8:06:11 PM
    Author     : SOM
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type = "text/JavaScript">
         
            function AutoRefresh( t ) {
               setTimeout("location.reload(true);", t);
            }
      
      </script>
    </head>
    <body onload = "JavaScript:AutoRefresh(10000);">
        <%
         Class.forName("com.mysql.jdbc.Driver");
    //String email=(String)session.getAttribute("email");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/zipzapzoom","root","");
    PreparedStatement ps = con.prepareStatement("select * from bidinglog");
    ResultSet rs=ps.executeQuery();
    SimpleDateFormat fm=new SimpleDateFormat("E MMM dd HH:mm:ss yyyy"); 
    while(rs.next()){
        String oid=rs.getString(1);
        String email=rs.getString(2);
        int price = rs.getInt(3);
        String s1=rs.getString(4);
         String s2=s1.substring(0,20)+s1.substring(24,28);
        Date d1=fm.parse(s2);
        Date d2=new Date();
        float difference=d2.getTime()-d1.getTime();
	  //  float days_difference=difference/(1000*60*60*24);
	    
	    float time_difference=difference/(1000*60*60)%24;
            int time_difference1=(int)time_difference;
        if(time_difference1>=3){//3hours deadline is finished
         PreparedStatement ps1 = con.prepareStatement("update query_table set price=?,status=?,trans_email=? where oid=? ");
            ps1.setInt(1,price);
            ps1.setString(2,"e");
            ps1.setString(3,email);
            ps1.setString(4,oid);
            int n=ps1.executeUpdate();
            PreparedStatement ps2 = con.prepareStatement("delete from bidinglog where oid=? ");
            ps2.setString(1,oid);
            int k=ps2.executeUpdate();
            PreparedStatement ps3 = con.prepareStatement("insert into notification values(?,?,?)");
            String data="your oid"+oid+"booking in biding has been selected pick up the order";
            ps3.setString(1,email);
            ps3.setString(2,oid);
            ps3.setString(3,data);
            int l=ps3.executeUpdate();
            PreparedStatement ps4 = con.prepareStatement("select cust_email from query_table where oid=?");
            //String data1="your oid"+oid+"booking in biding has been selected keep up the order ready";
            ps4.setString(1,oid);
            //ps5.setString(2,data1);
            ResultSet rs2=ps4.executeQuery();
            String email1="";
            while(rs2.next()){
                email1=rs2.getString(1);
            }
            PreparedStatement ps5 = con.prepareStatement("insert into notification values(?,?,?)");
            String data1="your oid"+oid+"booking in biding has been selected keep up the order ready";
            ps5.setString(1,email1);
            ps5.setString(2,oid);
            ps5.setString(3,data1);
            int e=ps5.executeUpdate();
            PreparedStatement ps6 = con.prepareStatement("insert into otp values(?,?,?)");
            int otp=(int)(Math.random()*9000)+1000;
            ps6.setString(1,email1);
            ps6.setString(2,oid);
            ps6.setInt(3,otp);
            int f=ps6.executeUpdate();
        }
    }
    
    
        %>
    </body>
</html>
