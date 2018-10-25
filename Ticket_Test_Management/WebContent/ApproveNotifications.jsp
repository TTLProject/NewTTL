<%@page import="userbean.Userbean"%>
<%@page import="com.sun.org.apache.xalan.internal.xsltc.compiler.sym"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dao.ConnectionSteps"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
		Userbean user = (Userbean) session.getAttribute("session2");
	%>
<%
String assignby=request.getParameter("assignby");
String assignto = request.getParameter("assignto");
String ticketid= request.getParameter("ticketid");
String empname= request.getParameter("ename");
int nid=Integer.parseInt(request.getParameter("nid"));
ConnectionSteps steps = new ConnectionSteps();
		Connection conn = steps.connection();
			PreparedStatement pstmt = conn.prepareStatement("update notifications set status=?, executive=? ,subject=? where id=?");
			pstmt.setString(1, "approved");
			pstmt.setString(2, user.getUsername());
			pstmt.setString(3, "TicketApproved");
			pstmt.setInt(4, nid);
			
			
			PreparedStatement pstmt1 = conn.prepareStatement("update tickettable set editstatus=? where ticketid=? and username=?");
			pstmt1.setString(1, "approved");
			pstmt1.setString(2, ticketid);
			pstmt1.setString(3, empname);
			int n= pstmt1.executeUpdate();
		int i= pstmt.executeUpdate();
		if(i>0){
		PreparedStatement pstmt4= conn.prepareStatement("select * from tickettable where editstatus=? and ticketid=? and username=?");
			pstmt4.setString(1, "approved");
			pstmt4.setString(2, ticketid);
			pstmt4.setString(3, empname);
		    ResultSet rs1 = pstmt4.executeQuery();
		    if(rs1.next()){
		    
		    PreparedStatement pstmt2 = conn.prepareStatement("insert into tickettable1(username,id,ticketid) values(?,?,?) ");
		    if(rs1.getString("empname").equals(rs1.getString("assignedto"))){
		    
		    }else{
				pstmt2.setString(1, rs1.getString("assignedto"));
				pstmt2.setInt(2,rs1.getInt("id"));
				{
				PreparedStatement pstmt3 = conn.prepareStatement("select * from tickettable1 where pid=(select MAX(pid) from tickettable1 where username=?) and username=?");
				pstmt3.setString(1, rs1.getString("assignedto"));
				pstmt3.setString(2, rs1.getString("assignedto"));
				ResultSet rs =pstmt3.executeQuery();
				if(rs.next()) {
				
				String s;
				s = rs.getString("ticketid");
				int n1 = s.length();
				//System.out.println(s.substring(3));
				int r = Integer.parseInt(s.substring(4)) + 1;
				String s2 = "TID-00" + r;
				//System.out.println(s2);
				//System.out.println(s2.length());
				int n2 = s2.length();
				int n3 = n1 + 1;

				if (n1 == n2) {
				pstmt2.setString(3, s2);
				}

				else if (n3 == n2) {
					int r1 = Integer.parseInt(s.substring(4)) + 1;
					String s3 = "TID-0" + r1;
					pstmt2.setString(3, s3);
				} else {
					int r2 = Integer.parseInt(s.substring(4)) + 1;
					String s4 = "TID-" + r2;
					pstmt2.setString(3, s4);
				}
				} else {
					String id = "TID-001";
					pstmt2.setString(3, id);
				}
				
		    }
		    pstmt2.executeUpdate();
		    }
		}
		
			System.out.println("success");
			response.sendRedirect("ExecutiveNotifications.jsp");
		}else{
		
			System.out.println("failed");
			response.sendRedirect("ExecutiveNotifications.jsp");
			
		}




%>


</body>
</html>