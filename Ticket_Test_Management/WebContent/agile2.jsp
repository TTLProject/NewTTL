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
   Userbean user1 = (Userbean) session.getAttribute("session2");

           
								ConnectionSteps steps = new ConnectionSteps();
								Connection conn = steps.connection();
								PreparedStatement pstmt = conn.prepareStatement("select * from tickettable1 where ticketid=? and username=? ");
								pstmt.setString(1, tid);
								pstmt.setString(2, user1.getUsername());
								ResultSet rs = pstmt.executeQuery();
								if (rs.next()) {
								PreparedStatement pstmt1 = conn.prepareStatement("select * from tickettable where id=?");
								pstmt1.setInt(1, rs.getInt("id"));
								ResultSet rs1 = pstmt1.executeQuery();
								
								if(rs1.next()){
								user.setStatus(rs1.getString("status"));
								user.setId(rs.getInt("id"));
								}}
							
							
session.setAttribute("ticket1", user);



%>
</body>
</html>