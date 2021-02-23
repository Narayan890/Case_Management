<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.CaseDao" %>
<%@ page import="pojo.Client" %>
<%@ page import="pojo.LoginInfo" %>
<% 
String case_no = request.getParameter("case_no");
String username = LoginInfo.get_username();
int status = CaseDao.deleteCase(case_no ,username);
if(status == 1)
{
	response.sendRedirect("viewCase.jsp");
}
else
{
	response.sendRedirect("error.jsp");
}
%>