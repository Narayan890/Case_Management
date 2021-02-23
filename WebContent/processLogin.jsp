<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import ="dao.LoginDao"%>
<%@page import ="pojo.LoginInfo"%>
<% 
String username = request.getParameter("username");
String password = request.getParameter("password");
LoginInfo l = new LoginInfo(username,password);
 
if(LoginDao.isValid(l))
{
	session.setAttribute("username",username);
	session.setMaxInactiveInterval(300);
	response.sendRedirect("home.jsp");
}
else
{
	response.sendRedirect("loginFailed.jsp");
}
%>