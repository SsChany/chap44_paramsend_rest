<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!DOCTYPE html>

<html lang = "ko-kr">
<head>
<meta charset="UTF-8">
	<title>form param transfer</title>
</head>
<body>
	<!-- 이 부분에서 action 경로를 formRest, formRest2로 변경하면서 각 경로별로 테스트 합니다. -->
	<form name="frm" method="post" action="${pageContext.request.contextPath}/formRest2">
	
	<input type="text" id="name" name="name">	
	<input type="submit" value="전송">
	
	</form>
	
</body>
</html>
