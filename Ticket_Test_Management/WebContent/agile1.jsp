<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dao.ConnectionSteps"%>
<%@page import="userbean.Userbean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%String tid=request.getParameter("value2");
//System.out.println(tid);
Userbean user=new  Userbean();
user.setTicketId(tid);

           
								ConnectionSteps steps = new ConnectionSteps();
								Connection conn = steps.connection();
								PreparedStatement pstmt = conn.prepareStatement("select * from tickettable where ticketid=? ");
								pstmt.setString(1, tid);
								ResultSet rs = pstmt.executeQuery();
								if (rs.next()) {
								user.setStatus(rs.getString("status"));
								}
							
session.setAttribute("ticket", user);



%>
</body>
</html>