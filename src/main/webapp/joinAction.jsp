<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty property="userID" name="user" />
<jsp:setProperty property="userPassword" name="user" />
<jsp:setProperty property="userName" name="user" />
<jsp:setProperty property="userGender" name="user" />
<jsp:setProperty property="userEmail" name="user" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<title>>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		if(user.getUserID()==null|| user.getUserPassword()==null||user.getUserGender()==null||user.getUserEmail()==null){
			PrintWriter script= response.getWriter();
			script.println("<script>");
			script.println("alert('입력되지 않은 항목이 있습니다')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			UserDAO userDAO= new UserDAO();
			int result= userDAO.join(user);
			if(result==-1){		//아이디는 primary key 이므로 아이디 중복시 경고문구 출력
				PrintWriter script= response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				PrintWriter script= response.getWriter();
				script.println("<script>");
				script.println("alert('회원가입이 정상적으로 처리되었습니다')");
				script.println("location.href='main.jsp");
				script.println("</script>");
			}
		}
	%>
</body>
</html>

