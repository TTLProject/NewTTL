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
		String[] id = request.getParameterValues("check");

		
	%>

	<%
		try {
			ConnectionSteps steps = new ConnectionSteps();
			Connection conn = steps.connection();
			if(id==null){
			response.sendRedirect("TestData.jsp");
			}
			for (int a = 0; a < id.length; a++) {
		System.out.println(id[a]);
		
				PreparedStatement pstmt2 = conn.prepareStatement("DELETE  FROM testdata where id=?");
				pstmt2.setString(1, id[a]);
				int l2 = pstmt2.executeUpdate();
if(l2>0){
System.out.println("ok");

}

}	
response.sendRedirect("TestData.jsp");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	%>


</body>
</html>