package servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.RegistrationDao;
import userbean.Userbean;

@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet{

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

		
		String name = request.getParameter("name");
		String domain=request.getParameter("domain");
		String id =request.getParameter("id");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String confirmpassword=request.getParameter("confirmpassword");
		String email = request.getParameter("email");
		String webmail=request.getParameter("webmail");
		long mobile = Long.parseLong(request.getParameter("mobile"));
		String designation=request.getParameter("designation");
		
		
		Userbean user=new Userbean();
		user.setName(name);
		user.setDomain(domain);
		user.setEmpid(id);
		user.setUsername(username);
		user.setPassword(password);
		user.setConfirmpassword(confirmpassword);
		user.setEmail(email);
		user.setWebmail(webmail);
		user.setMobile(mobile);
		user.setDesignation(designation);
		if(password.equals(confirmpassword)) {
		
		RegistrationDao.insert(user);
		boolean status = user.isValid();
		 System.out.println("adminstatus:::"+status);
		if (status) {
			boolean status1=user.isValid1();
			if(status1) {
				boolean status2=user.isValid2();
				System.out.println(status2);
				if(status2) {
					System.out.println(status2);
				HttpSession session=request.getSession(true);
					session.setAttribute("registration", user);
					response.sendRedirect("Login.jsp");
					
				}else {
					
					response.sendRedirect("Registration3.jsp");
				}
				
			}else {
				response.sendRedirect("Registration2.jsp");
			}
		} else {
			response.sendRedirect("Registration1.jsp");
		}
		
		
		}else {
			response.sendRedirect("Registration4.jsp");
		}
	}
}