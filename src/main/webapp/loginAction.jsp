<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="user.UserDAO"%>
<%@page import="java.io.PrintWriter"%>
<%request.setCharacterEncoding("UTF-8") %>
<jsp:userBean id="user" class="user.User" scope="page" />
<jsp:userBean name="user" property="userID" />
<jsp:userBean name="user" property="userPassword" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<!-- 로그인 페이지에서 넘어온 값을 넣어줌 -->
	<%
		UserDAO userDAO= new UserDAO();
		int result=userDAO.lofin(user.getUserID(),user.getUserPassword());
		if(result==1){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("locatioin.href='main.jsp'");
			script.println("</script>");
		}
		if(result==0){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀렸습니다')");
			script.println("history.back()");
			script.println("</script>");
		}
		if(result==2){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다')");
			script.println("history.back()");
			script.println("</script>");
		}
		if(result==0){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</body>
</html>
