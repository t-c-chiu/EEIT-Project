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



<script type="text/javascript">
function removeElement()
{
document.getElementById("p1").style.display="none";
}
</script>

<body>

<h1>Hello</h1>

<p id="p1">This is some text. This is some text. This is some text.
This is some text. This is some text. This is some text.
This is some text. This is some text. This is some text.</p>

<input type="button" onclick="removeElement()"
value="Do not display paragraph" />


<br/>
<br/>







	<form action="<c:url value="/controller.shopping"/>" method="get">
		<label>請輸入ProductId:</label><input id="productId" type="text"
			name="productId" /> <input type="submit">

	</form>
	<br>
	<br>
	<label>ProductId: </label>${products.productId}<br>
	<label>productName: </label>${products.productName}<br>
	<label>category: </label>${products.category}<br>
	<label>stock: </label>${products.stock}<br>
	<label>price: </label>${products.price}<br>
	
	<br>
	<br>

	<!--      enctype="multipart/form-data" -->
	<!-- action="<c:url value="/controller.shopping"/>" method="post"  -->
	<br>
	<br>
	
	
	<h1>以下為測試後台新增產品</h1>
	<form id="inserFormId">
		<label>productName: </label><input id="productName" type="text"
			name="productName" /><br> <label>category: </label><input
			id="category" type="text" name="category" /><br> <label>stock:
		</label><input id="stock" type="text" name="stock" /><br> <label>price:
		</label><input id="price" type="text" name="price" /><br> <label>picture:
		</label><input id="picture" type="file" name="picture" /><br> <input
			type="submit" value="上傳" id="subInsert" />

	</form>
	<br><br>
	
	<h1>以下為欄位測試</h1>
	<form action="<c:url value="/star.shopping"/>" method="get">


		<input type="submit">

	</form>

	<c:forEach var="category" items="${categorys}">
		<ul>
			<li>${category.categoryName}</li>
			<li>${category.sumCategory}</li>
		</ul>
	</c:forEach>




	<script src="js/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#subInsert').click(function() {
				$.ajax({
					url : "/PCC/controller.shopping",
					type : "POST",
					data : $('#inserFormId').serialize(),
					success : function(data) {
						alert(data);

					}
				});

			});

		});
	</script>


</body>
</html>