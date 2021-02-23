package pojo;
import java.util.*;

public class Client {
	int client_Id;
	String name;
	String address;
	String mobile_no;
    Date Date;
	
	public Client(int client_Id, String name, String address, String mobile_no, Date date)
	{
		this.client_Id = client_Id;
		this.name = name;
		this.address = address;
		this.mobile_no = mobile_no;
		this.Date = date;
	}
	
	public int getClient_Id() {
		return client_Id;
	}

	public void setClient_Id(int client_Id) {
		this.client_Id = client_Id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMobile_no() {
		return mobile_no;
	}

	public void setMobile_no(String mobile_no) {
		this.mobile_no = mobile_no;
	}

	public Date getDate() {
		return Date;
	}

	public void setDate(Date date) {
		Date = date;
	}
	@Override
	public String toString() {
		return "Client [client_Id=" + client_Id + ", name=" + name + ", address=" + address + ", mobile_no=" + mobile_no
				+ ", Date=" + Date + "]";
	}

}
