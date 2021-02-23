<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.ClientDao" %>
<%@ page import="pojo.Client" %>
<%@ page import="pojo.LoginInfo" %>
<% 
String name = request.getParameter("ClientName");
String username = LoginInfo.get_username();
int status = ClientDao.deleteClient(name, username);
if(status == 1)
{
	response.sendRedirect("editClient.jsp");
}
else
{
	response.sendRedirect("error.jsp");
}
%>