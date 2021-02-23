package pojo;

public class Cases {
 String case_type;
 String case_no;
 String court_name;
 String client_name;
 String date;
 String user;
 public Cases(String case_type, String case_no, String court_name, String client_name, String date, String user)
 {
	 this.case_type = case_type;
	 this.case_no = case_no;
	 this.court_name = court_name;
	 this.client_name = client_name;
	 this.date = date;
	 this.user = user;
 }
public String getCase_type() {
	return case_type;
}
public void setCase_type(String case_type) {
	this.case_type = case_type;
}
public String getCase_no() {
	return case_no;
}
public void setCase_no(String case_no) {
	this.case_no = case_no;
}
public String getCourt_name() {
	return court_name;
}
public void setCourt_name(String court_name) {
	this.court_name = court_name;
}
public String getClient_name() {
	return client_name;
}
public void setClient_name(String client_name) {
	this.client_name = client_name;
}
public String getDate() {
	return date;
}
public void setDate(String date) {
	this.date = date;
}
public String getUser() {
	return user;
}
public void setUser(String user) {
	this.user = user;
}

}
