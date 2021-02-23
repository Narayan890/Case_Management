<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="pojo.LoginInfo" %>
<%@ page import="dao.LoginDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
*{
margin : 0;
padding : 0;
box-sizing:border-box;
}
.h1{
  text-align:center;
  padding : 20px;
  margin:0px;
  color:white;
  background-color:black;
  height: 15vh;
}
.container{
  margin-top:50px;
  width:75%;
  
}
.well{
  background-color:black;
  color:white;
}
.control-label{
  font-size:15px;
}
body{
background:linear-gradient(120deg,#2980b9,#8e44ad);
height : 100vh;
width:100vw;
background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  overflow:hidden;
}
.h2{
  color:white;
}
label{
  margin-left: 50px;
}
</style>
<title>Sign Up</title>
</head>
<body>

<h1 class="h1">Case Management System</h1>
<div class="container">
  <form action="signUp.jsp" method="post" id="signup-form" class="well form-horizontal">
  <fieldset>
   <legend><center><h2 class="h2">Create Account</h2></center></legend>
   
   <!--******Username**********-->
    <div class="form-group">
    <label for="username" class="col-md-4 control-label">Enter Username</label>
    <div class="col-md-4 inputGroupContainer">
      <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      <input type="text" placeholder="Enter Username" name="username" class="form-control" required>
      </div>
    </div>
     </div>
     
     
     <!-- ******Password******* -->
     <div class="form-group">
    <label for="password" class="col-md-4 control-label"><b>Enter Password</b></label>
    <div class="col-md-4 inputGroupContainer">
      <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      <input type="password" placeholder="Enter Password" name="password" class="form-control" required>
      </div>
    </div>
     </div>
     
     <!-- ********Confirm Password*********-->
     <div class="form-group">
    <label for="password" class="col-md-4 control-label"><b>Confirm Password</b></label>
    <div class="col-md-4 inputGroupContainer">
      <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      <input type="password" placeholder="Confirm Password" name="confirmpassword" class="form-control" required>
      </div>
    </div>
     </div>
     
    <!-- *****submit button******* -->
     <div class="form-group text-center">
     <label class="col-md-4 control-label"></label>
     <div class="col-md-4">
      <button type="submit" onclick="matchPassword()" class="btn btn-success btn-block actionBtn">Sign Up</button>
     </div>
     </div>
    
   </fieldset>
</form>
</div>

<%
String username = request.getParameter("username");
String password = request.getParameter("password");
String confirmPassword = request.getParameter("confirmpassword");
if(username != null && password != null)
{
if(password != null && confirmPassword!=null && password.equals(confirmPassword))
{
LoginInfo user = new LoginInfo(username, password);
int status = LoginDao.addUser(user);
if(status == 1)
{
%>
<!-- *****success message****** -->
<div class="alert alert-success text-center" role="alert" id="successs-message">
<i class="glyphicon glyphicon-thumbs-up"></i>Account Created Successfully!<br> 
Please Login To Continue<br>
<a href="index.jsp" style="align:center; font-size:15px;">Login</a>
</div>
<%	
}
else
{
%>	
<h3>Try Again!</h3>	
<%
}
}
else
{
%>
<h3 style="color:red; text-align:center;">Password didn't Match!</h3>
<%	
}
}
else
{
%>
<h3 style="text-align:center; color:white;">Please Enter Valid Credentials</h3>
<%
}
%>


</body>
</html>