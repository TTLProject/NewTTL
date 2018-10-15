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
String value[]=request.getParameterValues("value[]");
String data[]=request.getParameterValues("data[]");
String count=request.getParameter("count");

for(int i=0;i<=value.length-1;i++)
				{
				System.out.println(value[i]);
					//System.out.println(data[i]);

}

 %>




</body>
</html>