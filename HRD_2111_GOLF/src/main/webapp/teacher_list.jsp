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
		 		<td>강사코드</td>
		 		<td>강의명</td>
		 		<td>강사명</td>
		 		<td>총매출</td>
		 	</tr>
		 	<%
		 	request.setCharacterEncoding("UTF-8");
		 	Connection conn = null;
		 	Statement stmt = null;
		 	String price = "";
		 	
		 	try {
		 		conn = Util.getConnection();
		 		stmt = conn.createStatement();
		 		String sql = "select t.teacher_code, t.class_name, t.teacher_name, sum(c.tuition) as price from tbl_teacher_202201 t, tbl_class_202201 c where t.teacher_code = c.teacher_code group by t.teacher_code, t.class_name, t.teacher_name";
		 		ResultSet rs = stmt.executeQuery(sql);
		 		while(rs.next()) {
		 			price = "₩" + rs.getString("price");
		 			%>
		 			<tr>
		 				<td><%=rs.getString("teacher_code") %></td>
		 				<td><%=rs.getString("class_name") %></td>
		 				<td><%=rs.getString("teacher_name") %></td>
		 				<td><%=price %></td>
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