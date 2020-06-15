
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,com.paytm.pg.merchant.CheckSumServiceHelper"%>
<%
    int flag=0;
//    String oid=request.getParameter("oid");
//     String price=request.getParameter("price");
Enumeration<String> paramNames = request.getParameterNames();

Map<String, String[]> mapData = request.getParameterMap();
TreeMap<String,String> parameters = new TreeMap<String,String>();
String paytmChecksum =  "";
String price="",oid="";
while(paramNames.hasMoreElements()) {
	String paramName = (String)paramNames.nextElement();
        if(paramName.equals("TXNAMOUNT")){
            price=mapData.get(paramName)[0];
        }
        if(paramName.equals("ORDERID")){
            oid=mapData.get(paramName)[0];
            //oid=oid.substring(5);
        }
	if(paramName.equals("CHECKSUMHASH")){
		paytmChecksum = mapData.get(paramName)[0];
	}else{
		parameters.put(paramName,mapData.get(paramName)[0]);
	}
}
boolean isValideChecksum = false;
String outputHTML="";
 flag=0;
try{
	isValideChecksum = CheckSumServiceHelper.getCheckSumServiceHelper().verifycheckSum("t!1NTmb!7Ck3XtGf",parameters,paytmChecksum);
	if(isValideChecksum && parameters.containsKey("RESPCODE")){
		if(parameters.get("RESPCODE").equals("01")){
			outputHTML = parameters.toString();
                        flag=1;
		}else{
			outputHTML="<b>Payment Failed.</b>";
		}
	}else{
		outputHTML="<b>Checksum mismatched.</b>";
	}
}catch(Exception e){
	outputHTML=e.toString();
        
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
    <%if(flag==1){ response.sendRedirect("custpayment?oid="+oid+"&price="+price);
}else{%>
<p>Payment Failed</p>
<a href="notification.jsp">Retry</a>
    <%}%>
</body>
</html>