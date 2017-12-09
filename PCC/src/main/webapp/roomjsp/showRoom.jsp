<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


	<form action="<c:url value="/show.room"/>" method="get">
		<table width="400" border="0" align="center">

			<tr>
				<td><h3>選房系統</h3></td>
			</tr>
			<tr>
				<td><select name="roomType">
						<option value="normal">標準房</option>
						<option value="good">貴賓房</option>
				</select></td>
				<td><input type="submit" name="Room" value="送出"></td>
			</tr>

		</table>


	</form>


</body>
</html>