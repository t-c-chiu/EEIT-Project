<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.HashMap, model.bean.Cart"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>我的購物車--PCC購物網</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PCC - Shop</title>
<!-- Standard Favicon -->
<link rel="icon" type="image/x-icon" href="../images/pcc/pcc.png" />

<!-- Library - Google Font Familys -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="../revolution/css/settings.css">


<!-- RS5.0 Layers and Navigation Styles -->
<link rel="stylesheet" type="text/css"
	href="../revolution/css/layers.css">
<link rel="stylesheet" type="text/css"
	href="../revolution/css/navigation.css">

<!-- Library - Bootstrap v3.3.5 -->
<link rel="stylesheet" type="text/css" href="../libraies/lib.css">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">

<!-- Custom - Common CSS -->
<link rel="stylesheet" type="text/css" href="../css/plugins.css">
<link rel="stylesheet" type="text/css" href="../css/navigation-menu.css">
<link rel="stylesheet" type="text/css" href="../css/shortcode.css">
<link rel="stylesheet" type="text/css" href="../css/style.css">

<!-- 購物車表單的下載 -->

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--/購物車表單的下載  -->

<!-- fontawesome -->
<link href="../revolution/fonts/fontawesome-all.css">
<!-- css -->
<link rel="stylesheet" type="text/css" href="../css/login.css">
</head>



<body data-offset="200" data-spy="scroll" data-target=".ow-navigation">
	<div class="main-container">
		<!-- Loader -->
		<%@ include file="/pages/header.jsp"%>

		<!-- Loader /- -->

		<!-- Header -->

		<!--	內容開始	-->
		<main> <!-- Page Banner -->
		<div class="page-banner container-fluid no-padding">
			<!-- Container -->
			<div class="container">
				<div class="banner-content">
					<h3>購物商城</h3>
					<p>our vision is to be Earth's most customer centric company</p>
				</div>
				<ol class="breadcrumb">
					<li><a href="../index.html" title="Home">首頁</a></li>
					<li class="active">購物商城</li>
				</ol>
			</div>
			<!-- Container /- -->
		</div>
		<!-- Page Banner /- -->

		<div class="container">

			<!-- 無購物會出現的圖， -->

			<%
				if (session.getAttribute("addToCart") == null) {
					session.setAttribute("addToCart", new HashMap<Integer, Cart>());
				}
			%>

			<div align='center' id='noShoppingImg' style="display: none">
				<img alt='noShopping' src='../images/noShopping.jpg'>
				<button id="gotoShoppingButtoun"
					class="btn btn-default form-control footer-send " type="button"
					style="border-color: pink">我要去購物</button>
				<!-- 					<input id="gotoShoppingButtoun" type="button" value="去購物" style="width:200px;height:70px;font-size:20px; dashed;background-color:pink;"/> -->
			</div>




			<!-- 有購物後，出現的表單 -->

			<div style="margin-bottom: 100px" class="table-responsive">
				<table class="table" width="600" height="300"
					style="border: 3px #cccccc solid;">
					<caption style="font-size: 50px">購物車</caption>
					<tr style="height: 15px">
						<th>商品名稱</th>
						<th>數量及規格</th>
						<th>價格</th>
						<th>小計</th>
						<th></th>
					</tr>

					<c:forEach var="item" items="${addToCart}">
						<tr id="${item.key}tr">
							<td>
								<ul>
									<li style="list-style-type: none"><img alt="衣服"
										src="${item.value.pictureAscii}.jpg" width="140px" height="140px" /></li>
									<li style="list-style-type: none"><label>${item.value.productName}</label></li>
								</ul>
							</td>

							<td>
								<ul style="padding: 0px">
									<li
										style="list-style-type: none; padding: 5px; list-style-position: inside; margin-left: 0px;">規格：
									</li>
									<li style="list-style-type: none; padding: 5px">數量： <input
										style="font-size: 11px; font-family: serif;" type="number"
										min="1" max="10" size="7" value="${item.value.quantity}"
										id="${item.key}" class="quantityNumber" />
									</li>
								</ul>
							</td>
							<td><span>$</span><span class="price" id="${item.key}price">${item.value.price}</span></td>
							<td><span>$</span><span class="subtal"
								id="${item.key}subtotal">${item.value.subtotal}</span></td>
							<td class="eliminate" id="${item.key}eliminate">刪除</td>
						</tr>

					</c:forEach>
					<tr>

						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th><label>共$<span id="tatlePrice"
								style="font-size: 20px; font-weight: bold; color: red"></span>元
						</label></th>
					</tr>
				</table>
				<div align="center" style="padding-top: 40px">
					<button id="checkButton"
						class="btn btn-default form-control footer-send " type="button"
						style="border-color: pink">加入訂單</button>

					<!-- 		<input type="button" value="我要結帳" style="width:200px;height:70px;font-size:20px; dashed;background-color:pink;"/> -->
				</div>
			</div>
			<!--/ 有購物後，出現的表單 -->



		</div>

		<!-- Container /- --> <%@ include file="/pages/footer.jsp"%>
	</div>

	<!-- JQuery v1.12.4 -->
	<script src="../js/jquery.min.js"></script>

	<!-- Library - Js -->
	<script src="../libraies/lib.js"></script>
	<script src="../libraies/jquery.countdown.min.js"></script>

	<!-- RS5.0 Core JS Files -->
	<script type="text/javascript"
		src="../revolution/js/jquery.themepunch.tools.min.js"></script>
	<script type="text/javascript"
		src="../revolution/js/jquery.themepunch.revolution.min.js"></script>
	<script type="text/javascript"
		src="../revolution/js/extensoins/revolution.extension.video.min.js"></script>
	<script type="text/javascript"
		src="../revolution/js/extensoins/revolution.extension.slideanims.min.js"></script>
	<script type="text/javascript"
		src="../revolution/js/extensoins/revolution.extension.layeranimation.min.js"></script>
	<script type="text/javascript"
		src="../revolution/js/extensoins/revolution.extension.navigation.min.js"></script>
	<script type="text/javascript"
		src="../revolution/js/extensoins/revolution.extension.actions.min.js"></script>

	<!-- Library - Google Map API -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDW40y4kdsjsz714OVTvrw7woVCpD8EbLE"></script>

	<!-- Library - Theme JS -->
	<script src="../js/functions.js"></script>
	<!-- login  -->
	<!-- 	<script type="text/javascript" src="../js/login.js"></script> -->
	<script type="text/javascript">
		$(document).ready(function() {
			//隱藏購物車內的東西
			$(".mini_cart_item").css("display","none");
			
			//統計總數量
			totalPrice();
			
			//統計小計
			$('.quantityNumber').change(function() {

				var product=$(this);
				var number = product.val();
				var id=product.attr("id");
				var price=parseInt($("#"+id+"price").text());
				var subtoal=price*number;
				$("#"+id+"subtotal").text(subtoal);
				totalPrice();
			})
			
			// 按下刪除除去購物車物件
			$(".eliminate").click(function() {
				var spanId = $(this).attr("id").split("eliminate")[0];
				console.log("點到啦"+spanId);

			
				$.ajax({
					url : "/PCC/eliminate.shopping",
					type : "POST",
					data : {"productId":spanId} ,
					success : function(data) {
						
						$("#"+spanId+"subtotal").text("0");
						totalPrice();
						$("#"+spanId+"tr").css("display","none");
						
					}
				});
			
			});

			//按下去購物的按鈕就會轉跳
			$("#gotoShoppingButtoun").click(function(){
				location.replace("/PCC/pages/shop-2.jsp");
				
			});
			
			//按下去結帳就會轉跳頁面，並將購物車轉成訂單，status為0，訂單明細也會加入
			$("#checkButton").click(function(){
				var tatlePrice =$("#tatlePrice").text();
				$.ajax({
					url:"/PCC/addOrder.shopping",
					type:"GET",
					data:{
						"totalPrice":tatlePrice,
						"status":0
						},
					success:function(data){
						alert(data);
						location.replace("/PCC/pages/shop-2.jsp");
					}				
				});
				
 				
			})

		})
		
		//統計總數量
		function totalPrice(){
			var tal=0;
			$(".subtal").each(function(){
				tal=tal+parseInt($(this).text());
			})

			$("#tatlePrice").text(tal);
			if(tal==0){
				
				$("#noShoppingImg").css("display","");
				$(".table").css("display","none");	
				$("#checkButton").css("display","none");
			}
		}
		
		
	</script>
</body>
</html>



