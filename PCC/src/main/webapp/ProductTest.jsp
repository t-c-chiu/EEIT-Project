<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="<c:url value="/controller.shopping"/>" method="get">
		<label>請輸入ProductId:</label><input id="productId" type="text" name="productId" />
		
		<input type="submit">
		
	</form>
	<br><br>
	<label>ProductId: </label>${products.productId}<br>
	<label>productName: </label>${products.productName}<br>
	<label>category: </label>${products.category}<br>
	<label>stock: </label>${products.stock}<br>
	<label>price: </label>${products.price}<br>
	<label>picture: </label>${products.picture}<br>
     <br><br>
     
<!--      enctype="multipart/form-data" -->
     <br><br>
     <h1>以下為測試後台新增產品</h1>
     <form action="<c:url value="/controller.shopping"/>" method="post" >
	<label>productName: </label><input id="productName" type="text" name="productName" /><br>
	<label>category: </label><input id="category" type="text" name="category" /><br>
	<label>stock: </label><input id="stock" type="text" name="stock" /><br>
	<label>price: </label><input id="price" type="text" name="price" /><br>
	<label>picture: </label><input id="picture" type="file" name="picture" /><br>

	<input type="submit"value="上傳" />
     
     </form>
     
     
     <script type="text/javascript">
     
     
     
     </script>
     
     
</body>
</html>