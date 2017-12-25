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


			<!-- 有購物後，出現的表單 -->

			<div style="margin-bottom: 100px" class="table-responsive">
				<table class="table" width="600" height="200"
					style="border: 3px #cccccc solid;">
					<caption style="font-size: 50px">已成立訂單</caption>
					<tr style="height: 15px">
						<th>訂單編號</th>
						<th>訂購人資訊</th>
						<th>總價</th>
						<th>送達資訊</th>
						<th>訂購日期</th>
						<th></th>
					</tr>
					<tr>
						<td>${order.orderId}</td>
						<td>

							<p>
								<span class="personal-content">姓名:</span><span id="nameEl">${member.name}</span>
							</p>
							<p>
								<span class="personal-content">E-mail:</span><span id="emailEl">${member.email }</span>
							</p>
							<p>
								<span class="personal-content">電話:</span><span id="phoneEl">${member.phone }</span>
							</p>
							<p>
								<span class="personal-content">地址:</span><span id="areaEl">${member.area }</span>
								, <span id="addressEl">${member.address }</span>
							</p>

						</td>
						<td>${order.totalPrice}</td>
						<td>

							<p>
								<span class="personal-content">收件人姓名:</span><span id="nameEl">${order.recipient}</span>
							</p>

							<p>
								<span class="personal-content">收件人電話:</span><span id="phoneEl">${order.recipientPhone }</span>
							</p>
							<p>
								<span class="personal-content">收件地址:</span><span id="addressEl">${order.location}</span>
							</p>


						</td>
						<td name="date" id="date">日期</td>
						<td><input type="button" value="訂單明細" /></td>
					</tr>




				</table>
				<div align="center">
				<h4 style="color:#FFBB00"><label >感謝您的購物!!</label></h4>
				<input type="button" value="繼續購物">
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
			$(".mini_cart_item").css("display", "none");
			//取得今日日期
			var Today=new Date();
			$("#date").text(Today.getFullYear()+ " / " + (Today.getMonth()+1) + " / " + Today.getDate() + " "+Today.getHours()+':'+Today.getMinutes());
		
		
		
		
		});
		

		
		
	</script>
</body>
</html>



