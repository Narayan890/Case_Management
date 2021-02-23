package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import dbutil.DButil;
import pojo.Cases;
import pojo.LoginInfo;

public class CaseDao {
	 public static int addCase(Cases cases)
     {
   	  int status = 0;
  	   String userName = LoginInfo.get_username();
  	   
  	   try
  	   {
  		   Connection conn = DButil.getConnection();
  		   PreparedStatement ps = conn.prepareStatement("INSERT INTO cases VALUES(?,?,?,?,?,?)");
  		   ps.setString(1, cases.getCase_type());
  		   ps.setString(2, cases.getCase_no());
  		   ps.setString(3, cases.getCourt_name());
  		   ps.setString(4, cases.getClient_name());
  		   ps.setString(5, cases.getDate());
  		   ps.setString(6, userName);
  		   status = ps.executeUpdate();
  	   }
  	   catch(Exception e)
  	   {
  		   System.out.println(e);
  	   }
  	   return status;
     }
     
     
     public static List<Cases> getCases(String username)
     {
  	   List<Cases> caseList = new ArrayList<Cases>();
  	   try
  	   {
  		   Connection conn = DButil.getConnection();
  		   PreparedStatement ps = conn.prepareStatement("SELECT * FROM cases WHERE user = ?");
  		   ps.setString(1,username);
  		   ResultSet rs = ps.executeQuery();
  		    
  		   while(rs.next())
  		   {
  			   Cases cases = new Cases(rs.getString("case_type"), rs.getString("case_no"), 
  					   rs.getString("court_name"), rs.getString("client_name"), rs.getString("date"), rs.getString("user"));
  			   caseList.add(cases);
  		   }
  		   
  	   }
  	   catch(Exception e)
  	   {
  		   System.out.println(e);
  	   }
  	   return caseList;
     }
     
     public static List<Cases> getCaseByName(String clientName, String username )
     {
  	   Cases cases = null;
  	   List<Cases> caseList = new ArrayList<Cases>();
  	   try
  	   {
  		   Connection conn = DButil.getConnection();
  		   PreparedStatement ps = conn.prepareStatement("SELECT * FROM cases WHERE client_name = ? AND user = ?");
  		   ps.setString(1, clientName);
  		   ps.setNString(2, username);
  		   ResultSet rs = ps.executeQuery();
  		   while(rs.next())
  		   {
  			cases = new Cases(rs.getString("case_type"), rs.getString("case_no"), 
			rs.getString("court_name"), rs.getString("client_name"), rs.getString("date"), rs.getString("user"));
  			caseList.add(cases);
  		   }
  	   }
  	   catch(Exception e)
  	   {
  		   System.out.println(e);
  	   }
  	   return caseList;
     }
     
     public static Cases getCaseByNo(String case_no, String username)
     {
  	   Cases cases = null;
  	   try
  	   {
  		   Connection conn = DButil.getConnection();
  		   PreparedStatement ps = conn.prepareStatement("SELECT * FROM cases WHERE case_no = ? AND user = ?");
  		   ps.setString(1, case_no);
  		   ps.setString(2, username);
  		   ResultSet rs = ps.executeQuery();
  		   while(rs.next())
  		   {
  			   cases = new Cases(rs.getString("case_type"), rs.getString("case_no"), 
  		rs.getString("court_name"), rs.getString("client_name"), rs.getString("date"), rs.getString("user"));
  		   }
  	   }
  	   catch(Exception e)
  	   {
  		   System.out.println(e);
  	   }
  	   return cases;
     }
     
     public static int updateCase(Cases cases)
     {
      	   int status = 0;
      	   try {
      	   Connection conn = DButil.getConnection();
      	    PreparedStatement ps = conn.prepareStatement("UPDATE cases SET case_type =?, court_name =?, client_name =?, date = ? WHERE case_no =?");
  		   ps.setString(1,cases.getCase_type());
  		   ps.setString(2,cases.getCourt_name());
  		   ps.setString(3,cases.getClient_name());
  		   ps.setString(4,cases.getDate());
  		   ps.setString(5,cases.getCase_no());
  		   
  		   status = ps.executeUpdate();
  		   }
  	   catch(Exception e)
  	   {
  		   System.out.println(e);
  	   }
      	   
        return status;
     }
     
     public static int deleteCase(String case_no, String username)
     {
  	   int status = 0;
  	   try
  	   {
  		   Connection conn = DButil.getConnection();
  		   PreparedStatement ps = conn.prepareStatement("DELETE FROM cases WHERE case_no = ? AND user = ?");
  		   ps.setString(1,case_no);
  		   ps.setString(2,username);
  		   status = ps.executeUpdate();
  	   }
  	   catch(Exception e)
  	   {
  		   System.out.println(e);
  	   }
  	   return status;	   
     }
     
     public static List<Cases> getCaseByDate(String date_from, String date_to, String username)
     {
    	 Cases cases = null;
    	   List<Cases> caseList = new ArrayList<Cases>();
    	   try
    	   {
    		   Connection conn = DButil.getConnection();
    		   PreparedStatement ps = conn.prepareStatement("SELECT * FROM cases WHERE date  BETWEEN ? AND ? AND user = ?");
    		   ps.setString(1, date_from);
    		   ps.setString(2, date_to);
    		   ps.setString(3,username);
    		   ResultSet rs = ps.executeQuery();
    		   while(rs.next())
    		   {
    			cases = new Cases(rs.getString("case_type"), rs.getString("case_no"), 
  			rs.getString("court_name"), rs.getString("client_name"), rs.getString("date"), rs.getString("user"));
    			caseList.add(cases);
    		   }
    	   }
    	   catch(Exception e)
    	   {
    		   System.out.println(e);
    	   }
    	   return caseList;
     }
     
     public static List<Cases> todayCases(String username){
    	 SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
  		  Date date = new Date();
  		  String date1 = formatter.format(date);
  		  
  		 Cases cases = null;
  	   List<Cases> caseList = new ArrayList<Cases>();
  	   try
  	   {
  		   Connection conn = DButil.getConnection();
  		   PreparedStatement ps = conn.prepareStatement("SELECT * FROM cases WHERE date = ? AND user = ?");
  		   ps.setString(1, date1);
  		   ps.setString(2,username);
  		   ResultSet rs = ps.executeQuery();
  		   while(rs.next())
  		   {
  			cases = new Cases(rs.getString("case_type"), rs.getString("case_no"), 
			rs.getString("court_name"), rs.getString("client_name"), rs.getString("date"), rs.getString("user"));
  			caseList.add(cases);
  		   }
  	   }
  	   catch(Exception e)
  	   {
  		   System.out.println(e);
  	   }
  	   return caseList;
  		  
    	 
     }
     
     public static int countTotalCase(String username) {
    	 int count = 0;
    	 try
    	   {
    		   Connection conn = DButil.getConnection();
    		   PreparedStatement ps = conn.prepareStatement("SELECT * FROM cases WHERE user = ?");
    		   ps.setString(1,username);
    		   ResultSet rs = ps.executeQuery();
    		    
    		   while(rs.next())
    		   {
    			   count++;
    		   }
    		   
    	   }
    	   catch(Exception e)
    	   {
    		   System.out.println(e);
    	   }
    	 return count;
     }
     
     public static int countTodayCase(String username) {
    	 SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
 		  Date date = new Date();
 		  String date1 = formatter.format(date);
 		  int count = 0;
 	   try
 	   {
 		   Connection conn = DButil.getConnection();
 		   PreparedStatement ps = conn.prepareStatement("SELECT * FROM cases WHERE date = ? AND user = ?");
 		   ps.setString(1, date1);
 		   ps.setString(2,username);
 		   ResultSet rs = ps.executeQuery();
 		   while(rs.next())
 		   {
 			count++;
 		   }
 	   }
 	   catch(Exception e)
 	   {
 		   System.out.println(e);
 	   }
 	   return count;
 		  
     }
     
     public static int countUpcomingCase(String username) {
    	 SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
		  Date date = new Date();
		  String date1 = formatter.format(date);
    	 int count = 0;
    	 try
    	 {
  		   Connection conn = DButil.getConnection();
  		   PreparedStatement ps = conn.prepareStatement("SELECT * FROM cases WHERE date > ? AND user = ?");
  		   ps.setString(1, date1);
  		   ps.setString(2,username);
  		   ResultSet rs = ps.executeQuery();
  		   while(rs.next())
  		   {
  			count++;
  		   }
  	   }
  	   catch(Exception e)
  	   {
  		   System.out.println(e);
  	   }
    	 return count;
     }
}


