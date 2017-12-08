<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>


<script>
	$(function() {
		$('#beginDate').datepicker({
			minDate : 0
		});
		$('#endDate').datepicker({
			minDate : 0
		});

		$(".image").click(function() {
			$(this).css({
				'border-style' : 'double'
			})
			
			$("#roomId").empty().append($(this).text())
		});
		
		

	});
</script>



<title>Insert title here</title>
</head>
<body>

	<table width="400" border="0" align="center">

		<tr>
			<th>圖片</th>
			<th>房間編號</th>
			<th>房型</th>
			<th>每晚房價</th>
		</tr>

		<c:forEach var="room" items="${listOfRooms}">

			<tr>
				<td><img height="120" width="160"
					src="<c:url value="/roomimage/${room.roomImage}.jpg"/>"></td>
				<td class="image">${room.roomId}</td>
				<td>${room.roomType}</td>
				<td>${room.price}</td>
			</tr>

		</c:forEach>
	</table>


	<form action="<c:url value="/reserve.room"/>" method="post">
		<table width="400" border="0" align="center">
			<tr>
				<td><h3>訂房系統</h3></td>
			</tr>

			<tr>
				<td>會員ID</td>
				<td><span>${member.memberId}</span></td>
			</tr>


			<tr>
				<td>入住人</td>
				<td><input type="text" name="name" value="${member.name}"></td>
			</tr>

			<tr>
				<td>聯絡email</td>
				<td><input type="text" name="email" value="${member.email}"></td>
			</tr>

			<tr>
				<td>電話</td>
				<td><input type="text" name="phone" value="${member.phone}"></td>
			</tr>


			<tr>
				<td>預定住房日</td>
				<td><input type="text" name="beginDate" id="beginDate"></td>
			</tr>

			<tr>
				<td>預定退房日</td>
				<td><input type="text" name="endDate" id="endDate"></td>
			</tr>

			<tr>
				<td>房間ID(暫)</td>
				<td><span id="roomId"></span></td>
			</tr>

			<tr>
				<td>總價(暫)</td>
				<td><input type="text" name="totalPrice"></td>
			</tr>

			<tr>
				<td><input type="submit" name="RoomReservation" value="送出">
				</td>
			</tr>

		</table>

	</form>


</body>
</html>