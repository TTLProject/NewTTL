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

@WebServlet("/empTDServlet")

public class empTDServlet extends HttpServlet{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   
		try {
			
			String testdata=request.getParameter("testdata");

        	ConnectionSteps steps = new ConnectionSteps();
			Connection conn=steps.connection();
		PreparedStatement pstmt = conn.prepareStatement("insert into testdata (heading) values(?)");
			pstmt.setString(1, testdata);
			int i=pstmt.executeUpdate();
			response.sendRedirect("empTD.jsp");
			
		}catch(Exception e) {
			System.out.println(e);
		}
		
	}
}
