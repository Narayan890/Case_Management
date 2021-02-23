package dao;
import java.util.*;
import java.util.Date;

import pojo.Client;
import pojo.LoginInfo;

import java.sql.*;
import java.text.SimpleDateFormat;

import dbutil.DButil;

public class ClientDao {
	// returns the complete list of clients.
       public static List<Client> getClients(String username)
       {
    	   List<Client> clientList = new ArrayList<Client>();
    	   try
    	   {
    		   Connection conn = DButil.getConnection();
    		   PreparedStatement ps = conn.prepareStatement("SELECT * FROM clients WHERE user = ?");
    		   ps.setString(1,username);
    		   ResultSet rs = ps.executeQuery();
    		    
    		   while(rs.next())
    		   {
    			   Client client = new Client(rs.getInt("Client_ID"), rs.getString("Name"), 
    					   rs.getString("Address"), rs.getString("Mobile_no"), rs.getDate("RegDate"));
    			   clientList.add(client);
    		   }
    		   
    	   }
    	   catch(Exception e)
    	   {
    		   System.out.println(e);
    	   }
    	   return clientList;
       }
       
       // add the new client to the list
       public static int addClient(Client client)
       {
    	   int status = 0;
    	   String userName = LoginInfo.get_username();
    	  SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
   		  Date date = new Date();
   		  String date1 = formatter.format(date);
    	   try
    	   {
    		   Connection conn = DButil.getConnection();
    		   PreparedStatement ps = conn.prepareStatement("INSERT INTO clients VALUES(?,?,?,?,?,?)");
    		   ps.setLong(1, client.getClient_Id());
    		   ps.setString(2, client.getName());
    		   ps.setString(3, client.getAddress());
    		   ps.setString(4, client.getMobile_no());
    		   ps.setString(5, date1);
    		   ps.setString(6, userName);
    		   status = ps.executeUpdate();
    	   }
    	   catch(Exception e)
    	   {
    		   System.out.println(e);
    	   }
    	   return status;
       }
       
       // search client by name
       public static Client getClientByName(String clientName, String username )
       {
    	   Client client = null;
    	   try
    	   {
    		   Connection conn = DButil.getConnection();
    		   PreparedStatement ps = conn.prepareStatement("SELECT * FROM clients WHERE Name = ? AND user = ?");
    		   ps.setString(1, clientName);
    		   ps.setNString(2, username);
    		   ResultSet rs = ps.executeQuery();
    		   while(rs.next())
    		   {
    			   client = new Client(rs.getInt("Client_ID"), rs.getString("Name"), 
    					   rs.getString("Address"), rs.getString("Mobile_no"), rs.getDate("RegDate"));
    		   }
    	   }
    	   catch(Exception e)
    	   {
    		   System.out.println(e);
    	   }
    	   return client;
       }
       
       // update the client data
       public static int updateClient(Client client , String username)
       {
   
    	   int status1 = 0;
    	   try {
    	   Connection conn = DButil.getConnection();
    	    PreparedStatement ps = conn.prepareStatement("UPDATE clients SET Name =?, Address =?, Mobile_no =? WHERE Client_ID =? AND user =?");
		   ps.setString(1,client.getName());
		   ps.setString(2,client.getAddress());
		   ps.setString(3,client.getMobile_no());
		   ps.setLong(4,client.getClient_Id());
		   ps.setString(5,username);
		   status1 = ps.executeUpdate();
		   }
	   catch(Exception e)
	   {
		   System.out.println(e);
	   }
    	   
      return status1;
       }
       
       public static int deleteClient(String name, String username)
       {
    	   int status = 0;
    	   try
    	   {
    		   Connection conn = DButil.getConnection();
    		   PreparedStatement ps = conn.prepareStatement("DELETE FROM clients WHERE Name = ? AND user = ?");
    		   ps.setString(1,name);
    		   ps.setString(2,username);
    		   status = ps.executeUpdate();
    	   }
    	   catch(Exception e)
    	   {
    		   System.out.println(e);
    	   }
    	   return status;	   
       }
       public static int countTotalClients(String username) {
    	   int count = 0;
    	   try
    	   {
    		   Connection conn = DButil.getConnection();
    		   PreparedStatement ps = conn.prepareStatement("SELECT * FROM clients WHERE user = ?");
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
       
}