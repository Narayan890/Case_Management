package dao;
import java.sql.*;


import dbutil.DButil;
import pojo.LoginInfo;


public class LoginDao {
	
	public static boolean isValid(LoginInfo userDetails)
	{
		boolean valid = false;
		try
		{
		Connection conn = DButil.getConnection();
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery("SELECT * FROM login_info WHERE username= '"+ userDetails.getUsername() +"' AND password= '"+ userDetails.getPassword() +"'");
		while(rs.next())
		{
			valid = true;
		}
		st.close();
		}
		
		catch(Exception e)
		{
			System.out.println(e);
		}
		return valid;
		
	}
	
	public static int addUser(LoginInfo user)
	{
		int status = 0;
 	   try
 	   {
 		   Connection conn = DButil.getConnection();
 		   PreparedStatement ps = conn.prepareStatement("INSERT INTO login_info VALUES(?,?)");
 		   ps.setString(1, user.getPassword());
 		   ps.setString(2, user.getUsername());
 		   status = ps.executeUpdate();
 	   }
 	   catch(Exception e)
 	   {
 		   System.out.println(e);
 	   }
 	   return status;
	}

}
