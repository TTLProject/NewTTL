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
<%
String uname=request.getParameter("value");


Userbean user =  new Userbean();
if(uname==null){
	user.setUname("none");
}else{
user.setUname(uname);
/* user.setProjectName(proname);
user.setRequirementName(reqname);
user.setModuleName(modname); */
}
user.setProjectName("none");
user.setRequirementName("none");
user.setModuleName("none");
user.setTable("none");
session.setAttribute("testsession", user);
%>
</body>
</html>