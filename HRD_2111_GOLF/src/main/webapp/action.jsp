<%@page import="java.lang.reflect.Parameter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="DBPKG.Util" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
Connection conn = null;
Statement stmt = null;
String date = request.getParameter("date");
String no = request.getParameter("cust_no");
String place = request.getParameter("place");
String price = request.getParameter("price");
String teacher = request.getParameter("teacher");
String code = "";
if(teacher == "100000"){
	code = "100";
}
else if(teacher == "200000"){
	code = "200";
}
else if(teacher == "300000"){
	code = "300";
}
else code = "400";

try{
	conn = Util.getConnection();
	stmt = conn.createStatement();
	String sql = String.format("insert into tbl_class_202201 values('%s', '%s', '%s', %d, '%s')", date, no, place, Integer.parseInt(price), code);
	stmt.executeUpdate(sql);
}catch(Exception e) {
	e.printStackTrace();
}
%>
<jsp:forward page="register.jsp"></jsp:forward>
</body>
</html>