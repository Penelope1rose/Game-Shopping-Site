package controller;
import java.sql.*;

import db.*;
import model.*;
public class MemberDetailsDB {
	public Member getMemberDetails(String email){
		Member uBean=null;
		try {
			Connection conn = DBconnect.getConnection();
			PreparedStatement pstmt=conn.prepareStatement("SELECT * from memberdetails where userID="+email);
			
			ResultSet rs=pstmt.executeQuery();
			
			if(rs.next()){
				uBean=new Member();
				uBean.setEmail(rs.getString("email"));
				uBean.setFirstName(rs.getString("firstname"));
				uBean.setLastName(rs.getString("lastname"));
				uBean.setMailaddr(rs.getString("mailaddress"));
				uBean.setContactno(rs.getInt("contactno"));
				uBean.setPassword1(rs.getString("password"));
				
			}
		}
		catch(Exception e) {
			
		}
		return uBean;
	} 
}
	
	


