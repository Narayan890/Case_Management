<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import ="pojo.Client"%>
<%@page import ="dao.ClientDao"%>
<%@page import ="java.util.*"%>
<%@page import ="pojo.LoginInfo"%>
<%@page import ="dbutil.DButil" %>
<%@page import ="java.sql.*" %>
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
.searchbar{
text-align:center;
letter-spacing:4px;
}
.actionBtn1{
padding:7px;
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
padding:20px;
border-radius:25px;
margin : auto;
 color:black;
 border : none;
  font-size : 15px;
  text-align:center;
}
::placeholder{
   letter-spacing:2px;
   color : black;
}
</style>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="container">

<div class="searchbar">
 <form action = "" method="get">
 <input type="text" name="clientName" size="25" style="padding:5px; width : 250px; font-size:15px;" class="searchTextfield" placeholder="Search Client">
 <button type="submit" class="actionBtn1">Search</button>
 </form>
 </div>
 
 <table class="table" id="mytable">
    <thead>
      <tr>
        <th>Client ID</th>
        <th>Name</th>
        <th>Address</th>
        <th>Mobile No.</th>
        <th>RegDate</th>
         <th colspan="2">Actions</th>
      </tr>
      </thead>
    <%
    String username = LoginInfo.get_username();
    Connection conn = DButil.getConnection();
    PreparedStatement ps = null;
    String name = request.getParameter("clientName");
    if(name!=null){
    	ps = conn.prepareStatement("SELECT * FROM clients WHERE Name = ? ");
    	ps.setString(1,name);
    }
    else{
    	 ps = conn.prepareStatement("SELECT * FROM clients WHERE user = ?");
    	 ps.setString(1,username);
    }
    ResultSet rs = ps.executeQuery();
    
    
    while(rs.next()){
    %>
      <tbody>
    	<tr>
    		<td data-title="Client ID"><%= rs.getInt("Client_ID") %></td>
    		<td data-title="Name"><%= rs.getString("Name") %></td>
    		<td data-title="Address"><%=  rs.getString("Address") %></td>
    		<td data-title="Mobile No."><%= rs.getString("Mobile_no") %></td>
    		<td data-title="RegDate"><%= rs.getDate("RegDate") %></td>
    		<td data-title="Action"><button class="actionBtn" onclick="location.href = 'editClient1.jsp?ClientName=<%= rs.getString("Name")%>';">Edit</button></td>
    		<td data-title="Action"><button class="actionBtn" onclick="location.href = 'deleteClient.jsp?ClientName=<%= rs.getString("Name")%>';">Delete</button></td>
    	</tr>
    	</tbody>
   <%
    }
    
      %>
</table>
</div>
</body>
</html>