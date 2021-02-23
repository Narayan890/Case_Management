<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Header</title>
<style>
.navbar-inverse{
  background : black;
}
.navbar-inverse .navbar-brand{
  color:#FF8000;
  font-family:monospace;
  font-size:23px;
 text-transform : uppercase;
 margin-top:10px;
 margin-right:50px;
  padding:17px;
  
}
#menu .navbar-nav li a{
color:#fff;
margin-top:10px;
font-family:monospace;
  font-size:18px;
  text-transform : uppercase;
  margin-left:30px;
  padding:17px;
  
}
.dropdown{
position:relative;
}
#menu .dropdown-menu li a{
 color:#000;
 font-size:16px;
  margin-left:4px;
 
}
#menu .dropdown-menu{
position:absolute;
background : white;
width:100%;
}
#menu .navbar-nav li a:hover{
  border-bottom:2px solid #FF8000;
  background : white;
  color:black;
}
#menu .dropdown-menu li a:hover{
border-bottom:2px solid #FF8000;
  background : black;
  color:white;
 
}
</style>
</head>
<body>
<%
  if(session.getAttribute("username") == null)
  {
	  response.sendRedirect("index.jsp");
  }
%>
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
  <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#menu">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">C M S</a>
     </div>
    <div class="collapse navbar-collapse" id="menu">
    <ul class="nav navbar-nav ">
    <!-- Home-->
      <li class="active"><a href="home.jsp" >Home</a></li>
     
     <!-- Clients -->
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Client <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="viewClient.jsp" >View Clients</a></li>
          <li><a href="AddClient.jsp">Add Client</a></li>
          <li><a href="editClient.jsp">Edit Client</a></li>
        </ul>
      </li>
      
      <!-- Cases -->
      
       <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Cases <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="AddCase1.jsp">Add Case</a></li>
          <li><a href="viewCase.jsp">View Cases</a></li>
          <li><a href="searchCase.jsp">Search Case</a></li>
        </ul>
      </li>
      
      <li><a href="upcomingCase.jsp">Upcoming Cases</a></li>
      <li><a href="todayCase.jsp">Today's Cases</a></li>
      <li><a href="logOut.jsp">LogOut</a></li>
    </ul>
    </div>
    </div>
</nav>
</body>
</html>