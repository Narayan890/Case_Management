package pojo;

public class LoginInfo {
	String username ;
	String password;
	static String username1;
	public LoginInfo(String username , String password)
	{
		super();
		this.username = username;
		this.password = password;
		LoginInfo.username1= username;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public static String get_username()
	{
		return username1;
	}
	@Override
	public String toString() {
		return "LoginInfo [username=" + username + ", password=" + password + "]";
	}
	

}
