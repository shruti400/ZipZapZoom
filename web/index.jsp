<%-- 
    Document   : index
    Created on : Oct 11, 2019, 8:08:45 PM
    Author     : Raja
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    </head>
    <body>
        <form class="form-horizontal" action="cust_detail" enctype="multipart/form-data" >
    <div class="form-group">
      <label class="control-label col-sm-2" for="email">Email </label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="email" placeholder="email" name="email">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">name</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="pwd" placeholder="name" name="name">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">Phone number</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="pwd" placeholder="Phone number" name="ph_num">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">id proof</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="pwd" placeholder="get your id proof" name="id_proof">
      </div>
    </div>
     
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">id proof</label>
      <div class="col-sm-10">          
        <input type="password" class="form-control" id="pwd" placeholder="password" name="password">
      </div>
    </div>      
      
    
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-success btn-lg">Add</button>
      </div>
    </div>
  </form>
    </body>
</html>
