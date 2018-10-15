package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ConnectionSteps;

/**
 * Servlet implementation class ExeTDServlet
 */
@WebServlet("/ExeTDServlet")
public class ExeTDServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   
		try {
			
			String testdata=request.getParameter("testdata");

        	ConnectionSteps steps = new ConnectionSteps();
			Connection conn=steps.connection();
			String query="ALTER TABLE testdata ADD "+testdata+" VARCHAR(4000)";
			
			 Statement stmt = conn.createStatement();
			stmt.executeQuery(query);
			//int i=pstmt.executeUpdate();
			
			PreparedStatement pstmt = conn.prepareStatement("insert into testdata1 (columnname) values(?)");
			pstmt.setString(1, testdata);
			int i=pstmt.executeUpdate();
			response.sendRedirect("ExecutiveTestData.jsp");
			
		}catch(Exception e) {
			System.out.println(e);
		}
		
	}

}
