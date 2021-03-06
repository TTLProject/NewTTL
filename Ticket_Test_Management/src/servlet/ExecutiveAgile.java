package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ConnectionSteps;

/**
 * Servlet implementation class Agile
 */
@WebServlet("/ExecutiveAgile")
public class ExecutiveAgile extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
try {

	int id=Integer.parseInt(request.getParameter("id"));
		String status=request.getParameter("status");
		
		System.out.println(status);
		ConnectionSteps steps = new ConnectionSteps();
		Connection conn = steps.connection();
		if(status.equals("--select--")||id==0) {
			HttpSession session=request.getSession();
			session.setAttribute("ticket1", null);
			response.sendRedirect("ExecutiveAgile.jsp");
		}else {
		PreparedStatement pstmt = conn.prepareStatement("update tickettable set status=? where id=?");
		pstmt.setString(1,status);
		pstmt.setInt(2,id);
		int i=pstmt.executeUpdate();
		HttpSession session=request.getSession();
		session.setAttribute("ticket1", null);
		response.sendRedirect("ExecutiveAgile.jsp");
	}}
catch(Exception e) {
	System.out.println(e);
}
}}
