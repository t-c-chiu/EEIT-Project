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
	});
</script>


<title>Insert title here</title>
</head>
<body>

	<form>
		<table width="400" border="0" align="center">


			<tr>
				<td>預定住房日</td>
				<td><input type="text" id="beginDate"></td>
			</tr>

			<tr>
				<td>預定退房日</td>
				<td><input type="text" id="endDate"></td>
			</tr>




		</table>

	</form>


</body>
</html>