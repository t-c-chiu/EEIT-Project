<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    
	<form action="<c:url value="/deleteReservation.room"/>" method="get">
		<table width="400" border="0" align="center">
			<tr>
			    <td>刪除訂單</td>
				<td><input type="text" name="roomReserverId"></td>
				<td><input type="submit" name="deleteReservation" value="刪除"></td>
			</tr>
		</table>
	</form>

	<table width="400" border="0" align="center">

		<tr>
			<th>訂單編號</th>
			<th>入住人</th>
			<th>電話</th>
			<th>email</th>
			<th>房間編號</th>
			<th>入住日</th>
			<th>退房日</th>
			<th>總價</th>
		</tr>

		<c:forEach var="roomReservation" items="${listOfReservation}">

			<tr>
				<td>${roomReservation.roomReserverId}</td>
				<td>${roomReservation.name}</td>
				<td>${roomReservation.phone}</td>
				<td>${roomReservation.email}</td>
				<td>${roomReservation.roomId}</td>
				<td>${roomReservation.beginDate}</td>
				<td>${roomReservation.endDate}</td>
				<td>${roomReservation.totalPrice}</td>
			</tr>

		</c:forEach>




	</table>

</body>
</html>