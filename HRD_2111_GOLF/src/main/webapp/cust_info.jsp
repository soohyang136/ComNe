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
<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h2>회원정보조회</h2>
		<table border=1 class="listTable">
		 	<tr>
		 		<td>수강월</td>
		 		<td>회원번호</td>
		 		<td>회원명</td>
		 		<td>강의명</td>
		 		<td>강의장소</td>
		 		<td>수강료</td>
		 		<td>등급</td>
		 	</tr>
		 	<%
		 	request.setCharacterEncoding("UTF-8");
		 	Connection conn = null;
		 	Statement stmt = null;
		 	String price = "";
		 	String day = "" ;
		 	
		 	try {
		 		conn = Util.getConnection();
		 		stmt = conn.createStatement();
		 		String sql = "select c.regist_month, cust.c_no, cust.c_name, t.class_name, c.class_area, t.class_price, cust.grade from tbl_teacher_202201 t, tbl_class_202201 c, tbl_member_202201 cust where t.teacher_code = c.teacher_code and cust.c_no = c.c_no";
		 		ResultSet rs = stmt.executeQuery(sql);
		 		while(rs.next()) {
		 			price = "₩" + rs.getString("class_price");
		 			day = rs.getString("regist_month").substring(0,4) + "년" + rs.getString("regist_month").substring(4,6) + "월";
		 			%>
		 			<tr>
		 				<td><%=day %></td>
		 				<td><%=rs.getString("c_no") %></td>
		 				<td><%=rs.getString("c_name") %></td>
		 				<td><%=rs.getString("class_name") %></td>
		 				<td><%=rs.getString("class_area") %></td>
		 				<td><%=price %></td>
		 				<td><%=rs.getString("grade") %></td>
		 			</tr>
		 			<%
		 		}
		 	}catch(Exception e){
		 		e.printStackTrace();
		 	}
		 	%>
		</table>
	</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>