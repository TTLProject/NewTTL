<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
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

String column =request.getParameter("column");
System.out .println(column);
ConnectionSteps steps = new ConnectionSteps();
        Connection conn=steps.connection();
      String query="alter table testdata drop column "+column;
        Statement stmt = conn.createStatement();
			stmt.executeQuery(query);
        PreparedStatement pstmt1 = conn.prepareStatement("delete from testdata1 where columnname=?");
        pstmt1.setString(1, column);
        int i1 =pstmt1.executeUpdate();
        response.sendRedirect("TestData.jsp");


 %>
</body>
</html>