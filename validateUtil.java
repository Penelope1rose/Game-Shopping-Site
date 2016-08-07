package Model;
import java.sql.*;
import java.util.*;

import javax.servlet.http.HttpSession;

import db.DBconnect;
public class validateUtil {
	public static String Uservalidate(String id, String pwd){
		try {
		//Connection conn = ConnectDB.getConnection();
		Connection conn = DBconnect.getConnection();
		
		PreparedStatement ps = conn.prepareStatement("Select * from users where userid=? and password=?");
		
		ps.setString(1, id);
		ps.setString(2, pwd);
		
		ResultSet rs = ps.executeQuery();

		if (rs.next()) {
			 id = rs.getString("userID");
			 int status = rs.getInt("status");
		}
		conn.close();
		
	} catch (Exception e) {
		System.out.println(e);
	}
		return id;
	}
}
