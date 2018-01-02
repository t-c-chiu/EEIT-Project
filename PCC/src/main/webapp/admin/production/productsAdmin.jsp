<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Contact Form | Gentelella Alela! by Colorlib</title>

<!-- Bootstrap -->
<link href="../vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link href="../vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- NProgress -->
<link href="../vendors/nprogress/nprogress.css" rel="stylesheet">

<!-- Custom Theme Style -->
<link href="../build/css/custom.min.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

td, th {
	border: 2px solid #c6d1cb;
	padding: 8px;
	text-align: center;
}

.apTr {
	background-color: #dddddd;
}

button {
	margin: 0px 20px;
}

label {
	width: 80px;
	height: 30px;
}
</style>
<script src="js/productsAdmin.js">
	
</script>
</head>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">

			<%@ include file="leftAndTop.jsp"%>

			<!-- page content -->
			<div class="right_col" role="main">
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h2 style="display: inline;">商品管理系統</h2>
							<hr>

							<input id="pageOrder" type="text" name="searchWay"
								value="${searchWay}" hidden />
							<div>
								<font size="5px" /> <span id="productSearchAndUpdata"
									class="forntT">商品查詢與修改</span> <span id="productInsert"
									class="forntT">上架新商品</span> <span id="orderSelect"
									class="forntT">訂單查詢</span> </font>
							</div>

							<hr>
						</div>

					</div>

					<div class="clearfix"></div>

					<!-- -----------------------------------------拖曳出來區------------------------------------------------------- -->
					<div id="drogTable">

						<!-- -----------商品查詢與修改區 ------------------------ -->
						<div id="productSelectAndUpdataArea" class="hideClass">
							我是商品查詢與修改區 <input type="button" class="slideUP" value="收起" />
							<table>
								<thead style="border: gray 3px soild;">
									<tr>
										<th>編號</th>
										<th>商品名稱</th>
										<th>分類</th>
										<th>價錢</th>
										<th>存貨</th>
										<th>狀態</th>
										<th>圖片</th>
										<th>介紹內容</th>
										<th>修改按鈕</th>
									</tr>
								</thead>
								<tbody id="tbodyForProductSearch">

								</tbody>
							</table>
						</div>
						<!-- ---------------/商品查詢與修改區 ------------------------ -->


						<!-- --------------上架新品區------------------------- -->
						<div id="productInsertArea" class="hideClass">
							上架新商品區 <input type="button" class="slideUP" value="收起" />
						</div>
						<!-- --------------/上架新品區------------------------- -->


						<!-- --------------訂單查詢與修正 ---------------------------->

						<div id="orderSelectArea" class="hideClass">
							<table>
								<thead style="border: gray 3px soild;">
									<tr>
										<th>編號</th>
										<th>購買人</th>
										<th>總價錢</th>
										<th>訂購日期</th>
										<th>狀態</th>
										<th>收件人</th>
										<th>收件地址</th>
										<th>收件電話</th>
										<th></th>
									</tr>
								</thead>
								<tbody id="tbodyForOrder">
									

								</tbody>
							</table>



							<input type="button" class="slideUP" value="收起" />
						</div>
						<!-- --------------/訂單查詢與修正 ---------------------------->
					</div>
					<!-- -----------------------------------------/拖曳出來區------------------------------------------------------- -->
					<!------------------------------- 原本就存在的區域 ------------------------------------------>
					<div id="originalArea" style="width: 55%;">
						<!-- -----------商品查詢與修改區 ------------------------ -->
						<div id="productSelectAndUpdataQQ" class="hideClass">
							<label>商品編號</label> <input id="productId" type="text"
								name="productId" size="5" /> <br> <input id="IDButton"
								type="button" value="編號查詢" class="submit" /> <br> <br>
							<label>商品名稱：</label> <input id="productName" type="text"
								name="productName" size="5"><br> <input
								id="nameButton" type="button" value="名稱查詢" class="submit"><br>
							<br> <label>商品分類：</label> <select name="category"
								id="category">
								<option value="">請選擇</option>
								<option value="藥膳">藥膳</option>
								<option value="產前產品">產前產品</option>
								<option value="產後產品">產後產品</option>
								<option value="嬰兒產品">嬰兒產品</option>
							</select> <br> <input id="categoryButton" type="button" value="分類查詢"
								class="submit"><br> <br> <label>狀態:</label> <input
								type="radio" name="status" value="1" checked />上架 <input
								type="radio" name="status" value="0" />下架 <input type="radio"
								name="status" value="2" />熱門商品 <input type="radio"
								name="status" value="3" />新上架商品 <br> <input id="status"
								type="button" value="狀態查詢" class="submit"> <br> <br>


						</div>
						<!-- ---------------/商品查詢與修改區 ------------------------ -->


						<!-- --------------上架新品區------------------------- -->
						<div id="productInsertQQ" class="hideClass">
							<form id="formData" method="post"
								action="<c:url value="/adminInsert.shopping"/>"
								enctype="multipart/form-data">
								<input type="text" name="searchWay" value="上架商品" hidden /> <label>商品名稱：</label><input
									id="productName" type="text" name="productName" required><br>
								<label>商品分類：</label><select name="category" id="category"
									required>
									<option>請選擇</option>
									<option value="藥膳">藥膳</option>
									<option value="產前產品">產前產品</option>
									<option value="產後產品">產後產品</option>
									<option value="嬰兒產品">嬰兒產品</option>
								</select> <br> <label>商品價位：</label><input type="number" name="price"
									min="1" id="price" /><br> <label>商品存貨：</label><input
									type="number" name="stock" min="1" id="stock" /><br> <label>狀態</label>
								<input type="checkbox" name="status" value="1" checked="checked" />上架
								<input type="checkbox" name="status" value="0" />下架 <input
									type="checkbox" name="status" value="2" />熱門商品 <input
									type="checkbox" name="status" value="3" />新上架商品 <br> <label>商品內容：</label>
								<textarea name="context" id="introduction"></textarea>
								<br> <label>商品截圖：</label> <input type="file" id="photo"
									name="photo" accept="image/*"><br> <img
									id="previewPhoto" style="max-width: 250px;" /> <br> <input
									id="btnSubmit" type="submit" value="確定上架"> <input
									type="reset" value="重新填寫">
							</form>
							<br> <br>

						</div>
						<!-- --------------/上架新品區------------------------- -->


						<!-- --------------訂單查詢與修正 ---------------------------->

						<div id="orderSelectQQ" class="hideClass">

							<label>查詢所有訂單</label> 
							<input id="orderAllButton" type="button" value="查詢所有訂單" class="submitOrder" /> <br> <br> <label>訂單編號</label>
							<input id="orderId" type="text" name="orderId" size="5" /> <br>
							<input id="orderIdButton" type="button" value="訂單編號查詢"
								class="submitOrder" /> <br> <br> <label>購買人查詢訂單</label>
							<input id="orderMemberId" type="text" name="memberId" size="5" />
							<br> <input id="orderMemberIdButton" type="button"
								value="購買人查詢訂單" class="submitOrder" /> <br> <br> <label>訂單狀態:</label>
							<input id="statusOrderRadio" type="radio" name="status" value="0"
								checked />未付費 <input type="radio" name="status" value="1" />已繳清

							<br> <input id="statusOrder" type="button" value="訂單狀態查詢"
								class="submitOrder"> <br> <br>






<!-- 							<button class="slideDown">開開3</button> -->

						</div>
						<!-- --------------/訂單查詢與修正 ---------------------------->









					</div>

					<!------------------------------- /原本就存在的區域 ------------------------------------------>
				</div>

			</div>
		</div>
		<!-- /page content -->

		<!-- footer content -->
		<%@ include file="footer.jsp"%>
		<!-- /footer content -->
	</div>
	</div>

	<!-- jQuery -->
	<script src="../vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script src="../vendors/fastclick/lib/fastclick.js"></script>
	<!-- NProgress -->
	<script src="../vendors/nprogress/nprogress.js"></script>

	<!-- Custom Theme Scripts -->
	<script src="../build/js/custom.min.js"></script>
</body>
</html>