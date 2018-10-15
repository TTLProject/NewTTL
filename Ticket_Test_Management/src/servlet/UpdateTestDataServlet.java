package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ConnectionSteps;
import dao.EditTicketDao;
import dao.FunctionalityNotification;
import dao.TestDataDao;
import userbean.Userbean;

/**
 * Servlet implementation class UpdateTestDataServlet
 */
@WebServlet("/UpdateTestDataServlet")
public class UpdateTestDataServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int id=Integer.parseInt(request.getParameter("id"));
		String column_name=request.getParameter("column_name");
		String value=request.getParameter("value");
		System.out.println(id+"  "+column_name+"  "+value);
		
		Userbean user= new Userbean();
		user.setId(id);
		user.setColumn_name(column_name);
		user.setValue(value);
		
		
		TestDataDao.update(user);
		
		
		boolean status = user.isValid();
		if(status) {
			String greetings = "Submitted successfully";
			
			response.setContentType("text/plain");
			response.getWriter().write(greetings);
			
		}
	}
	


}
