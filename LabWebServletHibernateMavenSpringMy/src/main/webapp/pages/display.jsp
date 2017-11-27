<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/table.css" />
<title>Display</title>
</head>
<body>
	<h3>Select Product Table Result : ${fn:length(select)} row(s)
		selected</h3>
	<c:if test="${!empty select}">
		<table>
			<thead>
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Price</th>
					<th>Make</th>
					<th>Expire</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="bean" items="${select}">
					<c:url var='path' value='/pages/product.jsp' scope="page">
						<c:param name="id" value="${bean[0]}"></c:param>
						<c:param name="name" value="${bean[1]}"></c:param>
						<c:param name="price" value="${bean[2]}"></c:param>
						<c:param name="make" value="${bean[3]}"></c:param>
						<c:param name="expire" value="${bean[4]}"></c:param>
					</c:url>
					<tr>
						<td><a href="${path}">${bean[0]}</a></td>
						<td>${bean[1]}</td>
						<td>${bean[2]}</td>
						<td>${bean[3]}</td>
						<td>${bean[4]}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:if test="${!empty msg}">
			<table>
				<thead>
					<tr>
						<h3>${msg}</h3>
					</tr>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Price</th>
						<th>Make</th>
						<th>Expire</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${bean.id}</td>
						<td>${bean.name}</td>
						<td>${bean.price}</td>
						<td>${bean.make}</td>
						<td>${bean.expire}</td>
					</tr>
				</tbody>
				<c:remove var="msg" />
			</table>
		</c:if>
	</c:if>
	<h3>
		<a href="<c:url value='/pages/product.jsp' />">Product Table</a>
	</h3>
</body>
</html>