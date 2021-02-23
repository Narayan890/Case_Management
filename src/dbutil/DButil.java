package dbutil;
import java.sql.*;

public class DButil {
      public static Connection getConnection()
      {
    	Connection conn = null;
    	try
    	{
    		Class.forName("com.mysql.jdbc.Driver");
    		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","Nsingla@1234");
    	}
    	catch(Exception e)
    	{
    		System.out.println(e);
    	}
    	return conn;
      }
      

}
