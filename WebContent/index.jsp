<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
*{
 margin :0;
 padding :0;
 font-family: "Times New Roman", Times, serif;
}

.bgimg{
   width: 100%;
   height: 100vh;
   background:linear-gradient(120deg,#2980b9,#8e44ad);
   
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  overflow : hidden:
 }
 .centerdiv{
  width : 350px;
  height : 400px;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background-color: rgb(0,0,0,0.4); 
  background-color: rgba(0,0,0, 0.7);
  box-shadow:0px 1px 6px rgba(0,0,0,0.12), 0px 1px 4px rgba(0,0,0,0.24); 
  color: white;
  font-weight: bold;
  border: 3px solid #f1f1f1;
 }

#profilepic{
  height : 120px;
  width : 120px;
  position : relative;
  top : -60px;
  left : calc((350px - 120px) / 2);
}
.login{
  text-align : center;
  color : white;
  text-transform : uppercase;
  font-size:2em;
  word-spacing: 10px;
  margin-top:-50px;
  margin-bottom:50px;
}

.inputbox{
  width : calc(100% - 50px);
  height : 30px;
  display : block;
  margin : auto;
  padding : 0 10px;
  box-sizing : border-box;
}
::placeholder{
   letter-spacing:2px;
   color : black;
}
#btn1{
   width : calc(100% - 50px);
  height : 30px;
  display : block;
  margin : auto;
  color:white;
  background-color:#0A84c6;
  border : none;
  font-size : 15px;
}
#btn1:hover{
  background-color:white;
  color:black;
  pointer : cursor;
}

#btn2{
 width : calc(100% - 50px);
  height : 30px;
  display : block;
  margin : auto;
  color:white;
  background-color:#FF0000;
  border : none;
  font-size : 15px;
}
#btn2:hover{
  background-color:white;
  color:black;
  pointer : cursor;
}

</style>
<title>Login</title>
</head>
<body>

  <div class="bgimg"></div>
  <div class="centerdiv">
  <img src="https://cdn2.iconfinder.com/data/icons/avatars-99/62/avatar-370-456322-512.png" id="profilepic">
   <h2 class="login">Case Management System</h2>
  <form action="processLogin.jsp" method="post">
    <div>
    <input type="text" placeholder="Enter Username" name="username" class="inputbox" required>
     </div><br>
     <div>
    <input type="password" placeholder="Enter Password" name="password" class="inputbox" required><br>
     </div><br>
     <div>
    <button type="submit" class="actionBtn" id="btn1">Login</button>
    </div> 
  </form><br>
  <div>
   <button onclick="location.href = 'signUp.jsp';" class="actionBtn" id="btn2">Sign Up</button>
  </div>
  </div>
</body>
</html>