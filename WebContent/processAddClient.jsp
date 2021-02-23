<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.ClientDao" %>
<%@ page import="pojo.Client" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="pojo.LoginInfo" %>

<%
Client client = null;
String clientId = request.getParameter("client_id");
String name = request.getParameter("name");
String address = request.getParameter("address");
String mobile_no = request.getParameter("mobile_no.");
 SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
	  Date date = new Date();
	  String date1 = formatter.format(date);
	  Date date2 = formatter.parse(date1);
    client = new Client(Integer.parseInt(clientId),name,address,mobile_no,date2);
    
    int status = ClientDao.addClient(client);
    if(status == 1)
    {
    	response.sendRedirect("viewClient.jsp");
    }
    else
    {
    	response.sendRedirect("error.jsp");
    }



%>

