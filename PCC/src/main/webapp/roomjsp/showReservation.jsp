<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="400" border="0" align="center">
		<tr>
		　　　<td><h3>您已訂房成功！</h3></td>
			<td><span>謝謝您！${member.name}</span></td>			
		</tr>
		
		<tr>
			<td>入住人</td>
			<td>${roomReservation.name}</td>
		</tr>
		
		<tr>
			<td>電話</td>
			<td>${roomReservation.phone}</td>
		</tr>
		
		<tr>
			<td>email</td>
			<td>${roomReservation.email}</td>
		</tr>
		
		<tr>
			<td>訂房日</td>
			<td>${roomReservation.beginDate}</td>
		</tr>

		<tr>
			<td>退房日</td>
			<td>${roomReservation.endDate}</td>
		</tr>

		<tr>
			<td>總金額</td>
			<td>${roomReservation.totalPrice}</td>
		</tr>

	</table>

</body>
</html>