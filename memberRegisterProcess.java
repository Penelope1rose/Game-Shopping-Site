package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;
/**
 * Servlet implementation class memberRegisterProcess
 */
@WebServlet("/memberRegisterProcess")
public class memberRegisterProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public memberRegisterProcess() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String firstName=request.getParameter("firstName");
		String lastName=request.getParameter("lastName");
		String email=request.getParameter("email");
		String mailaddr=request.getParameter("mailaddr");
		String contactno=request.getParameter("contactno");
		String password1=request.getParameter("password1");
		String password2=request.getParameter("password2");
		Member memberdb = new Member();
		
		if (memberdb.validate()==true){
			RequestDispatcher rd =request.getRequestDispatcher("processSearch.jsp");
			rd.forward(request,response);
		}
		else{
			RequestDispatcher rd =request.getRequestDispatcher("memberRegister.html");
			rd.forward(request,response);
			memberdb.setErrorflag(true);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
