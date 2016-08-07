package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.mysql.fabric.Response;

import Model.*;
import db.*;

public class Cart {

	public void addCart (HttpServletRequest request){
		int id = Integer.parseInt(request.getParameter("hiddenID"));
		int qty = Integer.parseInt(request.getParameter("hiddenQty"));
		HttpSession session = request.getSession();
		
		ArrayList <cartSet> cartList = (ArrayList <cartSet>) session.getAttribute("cart");
		
		if(cartList == null){
		cartList = new ArrayList <cartSet> ();
		}

		cartSet inv = new cartSet();
		inv.setId(id);
		inv.setQuantity(qty);
		cartList.add(inv);
		
		session.setAttribute("cart", cartList);
	}
	
	public void deleteCart (HttpServletRequest request){
		int index = Integer.parseInt(request.getParameter("index"));
		HttpSession session = request.getSession();

		ArrayList <cartSet> cartList = (ArrayList <cartSet>) session.getAttribute("cart");
		
		if(cartList == null){
			  cartList = new ArrayList<cartSet>();
			 }
		
		cartList.remove(index);
	}
	
	public void updateCart (HttpServletRequest request){
		int index = Integer.parseInt(request.getParameter("index"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		HttpSession session = request.getSession();

		ArrayList <cartSet> cartList = (ArrayList <cartSet>) session.getAttribute("cart");
		
		if(cartList == null){
			  cartList = new ArrayList<cartSet>();
			 }
		
		cartSet inv = new cartSet();
		
		inv = (cartSet) cartList.get(index);
	    inv.setQuantity(quantity);
		
	}
	
	public void checkout (HttpServletRequest request){
		HttpSession session = request.getSession();
		ArrayList <cartSet> cartList = (ArrayList <cartSet>) session.getAttribute("cart");
		String userid = request.getParameter("user");
		
		int cartSize = cartList.size();
		
		  if (cartList != null && cartSize > 0 ) {
		   		for (cartSet scart:cartList) {
		   			int index = scart.getId();
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		   		}
		  }
	}

	public void purchase (HttpServletRequest request){
		HttpSession session = request.getSession();
		ArrayList <cartSet> cartList = (ArrayList <cartSet>) session.getAttribute("cart");
		int memberid = Integer.parseInt(request.getParameter("memberid"));
		cartSet inv = new cartSet();
		System.out.println(inv.getId());
		
		try{
			int cartSize = cartList.size();
			   if (cartSize > 0) {
			   		for (cartSet scart:cartList) {
						Connection conn = DBconnect.getConnection();
					
						String sql = "INSERT INTO purchases(transaction_id, member_id, game_id, qty) values(null,?,?,?)";
					
						ArrayList<cartSet> invList = new ArrayList<cartSet>();
						PreparedStatement pt = conn.prepareStatement(sql);
						pt.setInt(1, memberid);
						pt.setInt(2, inv.getId());
						pt.setInt(3, inv.getQuantity());
						
						int recsAffected = pt.executeUpdate();
						
						conn.close();
			   		}
			   }
		
		}catch (Exception err){
			System.out.println(err);
		}
	}
}
