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
import userbean.Userbean;

/**
 * Servlet implementation class UpdateTestDataServlet1
 */
@WebServlet("/UpdateTestDataServlet1")
public class UpdateTestDataServlet1 extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Userbean user =new Userbean();
		String id[]=(request.getParameterValues("id[]"));
		String column_name[]=request.getParameterValues("column_name[]");
		String value[]=request.getParameterValues("value[]");
		
		
		
		  try {
		       
	        	ConnectionSteps steps = new ConnectionSteps();
				Connection conn=steps.connection();
				for(int i=0;i<=id.length-1;i++)
				{
				
				int id1=Integer.parseInt(id[i]);
				if(value[i]==null) {
			
				}else {
			PreparedStatement pstmt = conn.prepareStatement("update testdata set "+column_name[i]+"=?"+"where id=?");
			pstmt.setString(1, value[i]);
			pstmt.setInt(2,id1);
			
			
			int n=pstmt.executeUpdate();
			if(n>0) {
				 
				System.out.println("update success");
				user.setValid(true);
			}else {
				System.out.println("update failed");
				user.setValid(false);
				
			}}
		 	
	        }}catch(Exception e) {
	        	
	        	System.out.println(e);
	        }
		  boolean state = user.isValid();
			if(state) {
String greetings = "Submission failed";
				
				response.setContentType("text/plain");
				response.getWriter().write(greetings);
			}else {
String greetings = "Submited Successfully";
				
				response.setContentType("text/plain");
				response.getWriter().write(greetings);
			}
		
	}

}
