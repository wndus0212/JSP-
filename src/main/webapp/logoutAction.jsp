<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<title>>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		session.invalidate();	/* 이 페이지에 접속하면 세션을 invalidate 시켜줌 */
	%>	
	<script>
		location.href='main.jsp';
	</script>
</body>
</html>

