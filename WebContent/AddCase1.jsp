<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import ="pojo.Client"%>
<%@page import ="dao.ClientDao"%>
<%@page import ="pojo.LoginInfo" %>
<%@page import ="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Case</title>
<style>
*{
 margin :0;
 padding :0;
 font-family: "Poppins", sans-serif;
 outline:none;
 box-sizing:border-box;
}
body{
display:flex;
align-items:center;
justify-content:center;
padding:40px;
min-height:100vh;
background:linear-gradient(120deg,#2980b9,#8e44ad);
overflow:hidden;
}
.container{
margin-top:50px;
align-items:center;
justify-content:center;
background:#fff;
width:800px;
max-width:800px;
padding:25px 40px 10px 40px;
box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
} 
.container .text{
  font-weight:600;
  font-size:35px;
  text-align : center;
  background : -webkit-linear-gradient(right,#2980b9,#8e44ad);
  -webkit-background-clip:text;
  -webkit-text-fill-color:transparent;
}
.container form{
padding : 30px 0px 0px 0px;
}
.container form .form-row{
display : flex;
margin : 32px 0;
}
form .form-row .input-data{
width:100%;
height:40px;
margin : 0 20px;
position : relative;
}
.input-data input{
display:block;
height : 100%;
width :100%;
border : none;
font-size:17px;
border-bottom : 2px solid rgba(0,0,0,0.12);
}
.input-data select{
display:block;
height : 100%;
width :100%;
border : none;
font-size:17px;
border-bottom : 2px solid rgba(0,0,0,0.12);
}
.input-data label{
position : absolute;
font-size : 16px;
bottom : 25px;
pointer-events : none;
transition : all 0.3s ease;
}

.input-data input:focus ~label,
.input-data input:valid ~label{
transform : translateY(-10px);
font-size:14px;
color:green;
}
.input-data select:focus ~label,
.input-data select:valid ~label{
transform : translateY(-10px);
font-size:14px;
color:green;
}
.input-data .underline{
  position:absolute;
  bottom : 0;
  height : 2px;
  width : 100%;
}
.input-data .underline:before,
.input-data .underline:after{
position:absolute;
height:100%;
width:100%;
background:green;
transfrom: scaleX(0);
transfrom-origin:center;
transition : transfrom 0.3s ease;

}
.input-data input:focus ~ .underline:before, .underline:after,
.input-data input:valid ~ .underline:before, .underline:after{
  transfrom: scaleX(1);
}
.input-data select:focus ~ .underline:before, .underline:after,
.input-data select:valid ~ .underline:before, .underline:after{
  transfrom: scaleX(1);
}
.submit-btn .input-data{
height : 45px !importnt; 
width : 20;
overflow:hidden;
text-align:center;
}
.submit-btn .input-data .inner{
height:100%;
width:300%;
position:absolute;
left : -100%;
background:-webkit-linear-gradient(right,#2980b9,#8e44ad);
}
.submit-btn .input-data .btn{
position : relative;
background:none;
z-index : 2;
border:none;
color:#fff;
font-size:17px;
font-weight:700;
text-transform: uppercase;
letter-spacing:1px;
width:100%;
}

</style>
</head>
<body>
<%@ include file="header.jsp" %>
<%
String user = LoginInfo.get_username();
session.setAttribute("user",user);
%>
<div class="container">
  <div class="text">Fill Case Details</div>
  <form action="processAddCase.jsp" method="post">
    <div class="form-row">
    <!-- Client name-->
      <div class="input-data">
        <input type="text" name="clientName" required>
        <div class="underline"></div>
        <label>Client Name</label>
      </div>
      
    <!-- Case Type -->
     <div class="input-data">
        <select id="case_type" name="case_type" required>
        <option value=""></option>
        <option value="Civil M.A">Civil M.A</option>
        <option value="R.C.C">R.C.C</option>
        <option value="R.T.S">R.T.S</option>
        <option value="S.T.C">S.T.C</option>
        </select>
        <div class="underline"></div>
        <label>Case Type</label>
      </div>  
   </div>
      
      
     <div class="form-row">  
    <!-- Case No -->
     <div class="input-data">
        <input type="text" name="case_no" required>
        <div class="underline"></div>
        <label>Case No</label>
      </div>
      
    <!-- Court Name -->  
     <div class="input-data">
       <input type="text" name="court_name" required>
        <div class="underline"></div>
        <label>Court Name</label>
      </div>
  </div>
    
    
   <div class="form-row">  
    <!-- Date-->
     <div class="input-data">
        <input type="date" name="date" required>
        <div class="underline"></div>
        <label>Date</label>
      </div>
      
    <!-- Extra Space -->  
     <div class="input-data">
        <div class="underline"></div>
      </div>
  </div>
    
    
  <div class="form-row submit-btn">
    <div class="input-data">
    <div class="inner"></div>
    <!-- button -->
   <button type="submit" value="submit" class="btn">Add</button>
    </div>
  </div>
    
    
  </form>
</div>
</body>
</html>