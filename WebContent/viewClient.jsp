<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import ="pojo.Client"%>
<%@page import ="dao.ClientDao"%>
<%@page import ="java.util.*"%>
<%@page import ="pojo.LoginInfo"%>

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

.container{
 overflow-y: auto;
        height: 400px;
}

.container thead th{
  position: sticky;
        top: 0;
}

table{
 border-collapse: collapse;
        width: 100%;
}
  th {
        background: black;
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
   .searchbar{
    font-size:11px;
  }
}
.searchbar{
text-align:center;
letter-spacing:4px;
margin-top:10px;
}
.actionBtn1{
padding:7px;
width:20%;
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
</style>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="container">
 <div class="searchbar">
 <form action = "AddClient.jsp">
 <button type="submit" class="actionBtn1">Add Client</button>
 </form>
 </div>
 <table class="table">
    <thead>
      <tr>
        <th>Client ID</th>
        <th>Name</th>
        <th>Address</th>
        <th>Mobile No.</th>
        <th>RegDate</th>
      </tr>
      </thead>
    <%
    String username = LoginInfo.get_username();
    List<Client> clientList = ClientDao.getClients(username);
    if(!clientList.isEmpty())
    {
    for(Client c : clientList){
    %>
      <tbody>
    	<tr>
    		<td data-title="Client ID"><%= c.getClient_Id() %></td>
    		<td data-title="Name"><%= c.getName() %></td>
    		<td data-title="Address"><%= c.getAddress() %></td>
    		<td data-title="Mobile No."><%= c.getMobile_no() %></td>
    		<td data-title="RegDate"><%= c.getDate() %></td>
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