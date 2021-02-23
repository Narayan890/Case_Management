<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import ="pojo.Client"%>
<%@page import ="dao.CaseDao"%>
<%@page import ="java.util.*"%>
<%@page import ="pojo.LoginInfo"%>
<%@page import ="pojo.Cases" %>

<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>View Client</title>
<style>
body{
background:linear-gradient(120deg,#2980b9,#8e44ad);
height : 100vh;
width:100%;
 background-repeat: no-repeat;
 overflow:hidden;
}
.container{
margin-top:140px;
}
table{

width:100%;
max-width:720px;
margin : 40px auto;
box-shadow : 0px 4px 20px rgba(5,57,94,.5);
-moz-box-shadow : 0px 4px 20px rgba(5,57,94,.5);
-webkit-box-shadow : 0px 4px 20px rgba(5,57,94,.5);
color:white;
font-weight:600;
}
table thead{
background-color:black;
color:white;
}
table tbody{
background-color:white;
color:black;
text-align:center;
}

table thead th{
text-align:center;
}

@media screen and (max-width:767px){
  body{
   height:100vh;
   overflow: scroll;
  }
  .container{
  margin-top:140px;
  }
  table thead{display:none;}
  table tbody, table tbody tr{display:block; width:100%;}
  table tbody tr td::before{
  content: attr(data-title); 
  display:block;
  font-weigth:600;
  font-size:12px;
  background-color:#1C1C1C;
  color:#ffff;
  padding:2px;
  
  }
  table tbody tr td{
  display:block; 
  width:50%; 
  float:left;
   font-weigth:700;
  font-size:16px;
  color:rgba(5,57,94,1);
  }
  table tbody tr{
    margin-bottom:16px;
    box-shadow : 0px 4px 20px rgba(5,57,94,.5);
   -moz-box-shadow : 0px 4px 20px rgba(5,57,94,.5);
   -webkit-box-shadow : 0px 4px 20px rgba(5,57,94,.5);
   font-weight:600;
   clear:both;
   float:left;
   background-color:white;
   color:black;
  }
}
</style>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="container">
 <table class="table">
    <thead>
      <tr>
        <th>Case Type</th>
        <th>Case No</th>
        <th>Court Name</th>
        <th>Client Name</th>
        <th>Date</th>
      </tr>
      </thead>
    <%
    String username = LoginInfo.get_username();
    List<Cases> caseList = CaseDao.todayCases(username);
    if(!caseList.isEmpty())
    {
    for(Cases c : caseList){
    %>
    	 <tbody>
    	<tr>
    	   <td data-title="Case Type"><%= c.getCase_type()%></td>
    	   <td data-title="Case No"><%= c.getCase_no() %></td>
    	   <td data-title="Court Name"><%= c.getCourt_name()%></td>
    	   <td data-title="Client Name"><%= c.getClient_name() %></td>
    	   <td data-title="Date"><%= c.getDate()%></td>
    	</tr>
    	</tbody>
   <%
    }
    }
    else
    {
   %>
   <tr>
      <td colspan="6">No record found</td>
      </tr>
      <%
      }
      %>
</table>
</div>
</body>
</html>