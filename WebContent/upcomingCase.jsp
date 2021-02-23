<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import ="pojo.Client"%>
<%@page import ="dao.CaseDao"%>
<%@page import ="java.util.*"%>
<%@page import ="pojo.LoginInfo" %>
<%@page import ="pojo.Cases" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<title>Edit Client</title>
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
  margin-top:180px;
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
.actionBtn{
padding:4px;
width: 100%;
prevent:default;
border-radius:2px;
 display : block;
  margin : auto;
  color:white;
  background-color:#0A84c6;
  border : none;
  font-size : 15px;
  border-radius:25px;
}
.actionBtn:hover{
background-color:black;
color:white;
 pointer : cursor;
}
.search{
text-align:center;
letter-spacing:2px;
}
.actionBtn1{
padding:9px;
width:15%;
border-radius:25px;
margin : auto;
  color:white;
  background-color: green;
  border : none;
}
.actionBtn1:hover{
background-color:white;
color:black;
 pointer : cursor;
}
.searchTextfield{
padding:10px;
border-radius:25px;
margin : auto;
 color:black;
 border : none;
  font-size : 13px;
  text-align:center;
}
::placeholder{
   letter-spacing:2px;
}
label{
  margin-left:20px;
}
@media (width:768px){
  .container{
  margin-top:180px;
  }
}
@media screen and (max-width:400px){
.container{
  margin-top:180px;
  }
form{
 display:block;
}
.actionBtn1{
width:46%;
margin-top:6px;
margin-left:90px;
}
.searchTextfield{
 margin-top:6px;
}
.test{
margin-right:19px;
}
}



</style>
</head>
<body>
<%@ include file="header.jsp" %>\

 <div class="container">
  <div class="search">
  <form action = "upcomingCase.jsp">
  
 <label>From Date</label>
 <input type="date" name="date_from"  class="searchTextfield test">
 <label>To Date</label>
 <input type="date" name="date_to" class="searchTextfield">
 <button type="submit" class="actionBtn1">Search</button>
 </form>
 </div>
 <table class="table">
    <thead>
      <tr>
        <th>Case Type</th>
        <th>Case No</th>
        <th>Court Name</th>
        <th>Client Name</th>
        <th>Date</th>
        <th colspan="2">Actions</th>
      </tr>
      </thead>
     <% 
     String date_from = request.getParameter("date_from");
     String date_to = request.getParameter("date_to");
     if(date_from != null && date_to !=null)
     {
      String username = LoginInfo.get_username();
      List<Cases> caseList = CaseDao.getCaseByDate(date_from, date_to, username);
      if(!caseList.isEmpty())
      {
    for(Cases c : caseList)
    {
     %>
      <tbody>
     <tr>
    		<tr>
    	   <td data-title="Case Type"><%= c.getCase_type()%></td>
    	   <td data-title="Case No"><%= c.getCase_no() %></td>
    	   <td data-title="Court Name"><%= c.getCourt_name()%></td>
    	   <td data-title="Cliient Name"><%= c.getClient_name() %></td>
    	   <td data-title="Date"><%= c.getDate()%></td>
    	   <td data-title="Action"><button class="actionBtn" onclick="location.href = 'editCase.jsp?case_no=<%= c.getCase_no()%>';">Edit</button></td>
    	   <td data-title="Action"><button class="actionBtn" onclick="location.href = 'deleteCase.jsp?case_no=<%= c.getCase_no()%>';">Delete</button></td>
    	</tr>
    	</tbody>
    	
    <%
       }
       }
      else
      {
    %>
      <tr>
      <td colspan ="6">No record found</td>
      </tr>
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