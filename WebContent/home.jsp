<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="dao.ClientDao" %>
<%@page import="dao.CaseDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Home</title>
<style>
body{
margin:0;
padding:0px;
min-height:100vh;
background:linear-gradient(120deg,#2980b9,#8e44ad);
}
.team_container{
width:100%;
height:auto;
padding-top:40px;
}

.text{
 color:black;
 margin-top:40px;
 text-align:center;
 text-transform : uppercase;
 font-weight:600;
}

.row{
width:60%;
margin:auto;
display: flex;
  flex-direction: row;
flex-wrap:wrap;
justify-items:center;
justify-content:center;
}
.profile-card{
width:270px;
height:140px;
margin:20px 10px 10px 10px;
background-color: white;
}
.profile-content{
padding:20px;
display:flex;
justify-content: space-between;
}
.profile-text{
text-align:center;
font-size:18px;
font-weight:600;
letter-spacing: 1px;
}
.desc{
text-align:center;
}
.btn-div{
  text-align:center;
  display:block;
}
.btn{
    background-color:#0B610B;
    color:#ffffff;
    width:150px;
    cursor:pointer;
    height:38px;
    font-size:13px;
    font-weight:600;
    box-shadow: 1px 0px 0px 1px #e6e6e6;
    border-radius:5px;
    outline:none;
    border:none;
    text-transform : uppercase;
}
.w3-badge{
  background-color:#0B610B;
}
.demo{
display: flex;
justify-items:center;
justify-content:center;
margin-top:20px;
}
img{
  height:310px;
  width:300px;
  margin-top:20px;
}
@media(max-width:1024px){
    .row{
       width : 100%;
    }
    .img{
       display:none;
    }
    .text{
       margin-top: 100px;
    }
}
@media(max-width:468px){
   .profile-card{
      width : 290px;
      height :160px;
   }
}
@media(width:768px){
  .text{
     margin-top:160px;
  }
}
</style>
</head>
<body>
<%@ include file="header.jsp" %>
<% 
String username = (String)session.getAttribute("username");
int totalClients = ClientDao.countTotalClients(username);
int totalCases = CaseDao.countTotalCase(username);
int todayCase = CaseDao.countTodayCase(username);
int upcomingCase = CaseDao.countUpcomingCase(username);
%>
<div class="container">


<div class="team_container">
<div class="text"><h3>Case Management System</h3><h4>Welcome <%= username %></h4></div>
</div>
<div class="demo">
<div class="row">

<!-- Total Clients -->
<div class="profile-card" style="background-color: #FA5882;">
<div class="profile-content">
<div class="profile-text">Total Clients</div>
<div class="desc"><p><span class="w3-badge w3-red"><%= totalClients %></span></p></div>
</div>
<div class="btn-div"><button class="btn" onclick="location.href = 'viewClient.jsp';" style="background-color: red;">Visit</button></div>
</div>



<!-- Total Cases -->

<div class="profile-card" style="background-color: #CEF6CE;">
<div class="profile-content">
<div class="profile-text">Total Cases</div>
<div class="desc"><p><span class="w3-badge w3-green"><%= totalCases %></span></p></div>
</div>
<div class="btn-div"><button class="btn" onclick="location.href = 'viewCase.jsp';" style="background-color: green;">Visit</button></div>
</div>


<!-- Todays cases -->
<div class="profile-card" style="background-color: #F3E2A9">
<div class="profile-content">
<div class="profile-text">Today Cases</div>
<div class="desc"><p><span class="w3-badge w3-orange"><%= todayCase %></span></p></div>
</div>
<div class="btn-div"><button class="btn" onclick="location.href = 'todayCase.jsp';" style="background-color: orange;">Visit</button></div>
</div>

<!-- upcoming cases -->
<div class="profile-card" style="background-color: #819FF7;">
<div class="profile-content">
<div class="profile-text">Upcoming Cases</div>
<div class="desc"><p><span class="w3-badge w3-blue"><%= upcomingCase %></span></p></div>
</div>
<div class="btn-div"><button class="btn" onclick="location.href = 'upcomingCase.jsp';" style="background-color: blue;">Visit</button></div>
</div>


</div>

<div class="img">
<img src=https://cdn.pixabay.com/photo/2018/08/01/14/04/gavel-3577255_1280.jpg alt="Girl in a jacket">
</div>

</div>

</div>
</body>
</html>