<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.CaseDao" %>
<%@ page import="pojo.Cases" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="pojo.LoginInfo" %>

<%
Cases cases = null;
String case_type = request.getParameter("case_type");
String case_no = request.getParameter("case_no");
String court_name = request.getParameter("court_name");
String client_name = request.getParameter("clientName");
String date = request.getParameter("date");
String user = LoginInfo.get_username();
cases = new Cases(case_type, case_no, court_name, client_name, date, user);
	 int status = CaseDao.addCase(cases);
	    if(status == 1)
	    {
	    	response.sendRedirect("viewCase.jsp");
	    }
	    else
	    {
	    	response.sendRedirect("error.jsp");
	    }
%>