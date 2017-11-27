<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/table.css" />

<title>Product</title>
<script type="text/javascript">
	function clearForm() {
		var inputs = document.getElementsByTagName("input");
		for (var i = 0; i < inputs.length; i++) {
			if (inputs[i].type == "text") {
				inputs[i].value = "";
			}
		}
	}
</script>
</head>
<body>

	<h3>Welcome,</h3>

	<h3>Product Table</h3>
	<form action="<c:url value='/pages/product.controller'/>" method="post">
		<table>
			<tr>
				<td>ID :</td>
				<td><input type="text" name="id" value="${param.id}"></td>
				<td>${errors.id}</td>
			</tr>
			<tr>
				<td>Name :</td>
				<td><input type="text" name="name" value="${param.name}"></td>
				<td>${errors.name}</td>
			</tr>

			<tr>
				<td>Price :</td>
				<td><input type="text" name="price" value="${param.price}"></td>
				<td>${errors.price}</td>
			</tr>
			<tr>
				<td>Make :</td>
				<td><input placeholder="yyyy-MM-dd" type="text" name="make" value="${param.make}"></td>
				<td>${errors.make}</td>
			</tr>
			<tr>
				<td>Expire :</td>
				<td><input type="text" name="expire" value="${param.expire}"></td>
				<td>${errors.expire}</td>
			</tr>
			<tr>
				<td><input type="submit" name="prodaction" value="Insert">
					<input type="submit" name="prodaction" value="Update"></td>
				<td><input type="submit" name="prodaction" value="Delete">
					<input type="submit" name="prodaction" value="Select"> <input
					type="button" value="Clear" onclick="clearForm()"></td>
			</tr>
		</table>

	</form>
</body>
</html>