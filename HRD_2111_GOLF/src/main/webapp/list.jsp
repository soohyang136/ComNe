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
		<h2>강사조회</h2>
		<table border=1 class="listTable">
		 	<tr>
		 		<td>강사코드</td>
		 		<td>강사명</td>
		 		<td>강의명</td>
		 		<td>수강료</td>
		 		<td>강사자격취득일</td>
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
		 		String sql = "select * from tbl_teacher_202201";
		 		ResultSet rs = stmt.executeQuery(sql);
		 		while(rs.next()) {
		 			price = "₩" + rs.getString("class_price");
		 			day = rs.getString("teacher_regist_date").substring(0,4) + "년" + rs.getString("teacher_regist_date").substring(4,6) + "월" + rs.getString("teacher_regist_date").substring(6,8) + "일";
		 			%>
		 			<tr>
		 				<td><%=rs.getString("teacher_code" )%></td>
		 				<td><%=rs.getString("teacher_name") %></td>
		 				<td><%=rs.getString("class_name") %></td>
		 				<td><%=price %></td>
		 				<td><%=day %></td>
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