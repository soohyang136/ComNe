<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript" src="check.js"></script>
<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h2>수강신청</h2>
		<form name="frm" method="post" action="action.jsp">
			<table border=1>
				<tr>
					<td>수강월</td>
					<td><input type="text" name="date" />2022년 03월 예)202203</td>
				</tr>
				<tr>
					<td>회원명</td>
					<td>
						<select id="cust_name" onchange="selectName();">
							<option value=''>회원명</option>
							<option value='10001'>홍길동</option>
							<option value='10002'>장발장</option>
							<option value='10003'>임꺽정</option>
							<option value='20001'>성춘향</option>
							<option value='20002'>이몽룡</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>회원번호</td>
					<td><input id="cust_no" name="cust_no" readonly="readonly"/>예)10001</td>
				</tr>
				<tr>
					<td>강의장소</td>
					<td>
						<select name="place" id="place">
							<option value=0>강의장소</option>
							<option value="서울본원">서울본원</option>
							<option value="성남본원">성남본원</option>
							<option value="대전본원">대전본원</option>
							<option value="부산본원">부산본원</option>
							<option value="대구본원">대구본원</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>강의명</td>
					<td>
						<select id="teacher" name="teacher" onchange="selectTeacher();">
							<option value=''>강의선택</option>
							<option value=100000>초급반</option>
							<option value=200000>중급반</option>
							<option value=300000>고급반</option>
							<option value=400000>심화반</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>수강료</td>
					<td><input id="price" name="price" readonly="readonly"/>원</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center">
						<button type="submit" onclick="return check();">수강신청</button>
						<button>다시쓰기</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>