<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

<!-- 購物車表單 -->

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--/購物車表單  -->

<!-- fontawesome -->
<link href="../revolution/fonts/fontawesome-all.css">
<!-- css -->
<link rel="stylesheet" type="text/css" href="../css/login.css">
</head>

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
			<div style="margin-bottom: 100px" class="table-responsive">
				<table class="table" width="600" height="300"
					style="border: 3px #cccccc solid;">
					<caption style="font-size: 50px">購物車</caption>
					<tr>
						<th>商品名稱</th>
						<th>數量及規格</th>
						<th>價格</th>
						<th>小計</th>
						<th></th>
					</tr>
					
					<c:forEach var="item"  items="#{addToCart}">
					<tr>
						<td>
							<ul>
								<li style="list-style-type: none"><img alt="衣服" src="/PCC/images/deal-5.jpg"></li>
								<li style="list-style-type: none"><label>${item.value.productName}</label></li>
							</ul>
						</td>
						
						<td >
							<ul style="padding:0px">
								<li
									style="list-style-type: none; padding: 5px; list-style-position: inside; margin-left: 0px;">規格：
									<select>
										<option>請選擇</option>
										<option>F</option>
								</select>
								</li>
								<li style="list-style-type: none; padding: 5px">樣式： <select>
										<option>請選擇</option>
										<option>F</option>
								</select>
								</li>
								<li style="list-style-type: none; padding: 5px">數量： <input  style="font-size:11px;font-family:serif;" type="number" size="7" value="${item.value.quantity}"/>
								</li>
							</ul>
						</td>
						<td><span>$</span><span>${item.value.price}</span></td>
						<td><span>$</span><span>${item.value.subtotal}</span></td>
						<td>刪除</td>
					</tr>
					
					</c:forEach>
					<tr>

						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th>總價:$456789</th>
					</tr>
				</table>
				<div align="center" style="padding-top: 40px">
					<button class="btn btn-default form-control footer-send "
						type="button" style="background-color:pink;">我要結帳</button>

					<!-- 		<input type="button" value="我要結帳" style="width:200px;height:70px;font-size:20px; dashed;background-color:pink;"/> -->
				</div>
			</div>
		</div>

		<!--	內容結束	--> <!-- Footer Main 1 --> <footer id="footer-main"
			class="footer-main footer-main-1 services-section container-fluid">
		<!-- Container -->
		<div class="container">
			<div class="row">
				<div class="section-header">
					<h3>聯絡我們</h3>
					<p>Contact-us</p>
				</div>
				<!-- Widget About -->
				<aside class="col-md-6 col-sm-6 col-xs-12 ftr-widget widget_about">

				<a href="index.html" title="Max Shop">P<span>ostnatal</span> C<span>are</span>
					C<span>enter</span></a>
				<div class="info">
					<p>
						<i class="icon icon-Pointer"></i>106台北市大安區復興南路一段390號 2樓
					</p>
					<p>
						<i class="icon icon-Phone2"></i><a href="tel:(11)1234567890"
							title="Phone" class="phone">(02) 6631 6666</a>
					</p>
					<p>
						<i class="icon icon-Imbox"></i><a href="mailto:info@maxshop.com"
							title="info@maxshop.com">eeit98team05@outlook.com</a>
					</p>
				</div>

				</aside>
				<!-- Widget About /- -->
				<!-- Widget Newsletter -->
				<form action="#" method="post" name="contact-form"
					class="col-md-6 col-sm-6 col-xs-12" id="main-contact-form ">
					<div class="form-group">
						<input type="email" required="" placeholder="Email"
							class="form-control" name="email">
					</div>
					<div class="form-group">
						<textarea required="" placeholder="Message" rows="8"
							class="form-control" name="message"></textarea>
					</div>
					<button class="btn btn-default form-control footer-send "
						type="button">
						<i class="fa fa-paper-plane-o"></i> 送出
					</button>
				</form>
				<div class="copyright-section">
					<div class="coyright-content">
						<p>© PCC. all rights reserved</p>
					</div>
					<ul>
						<li><a href="#" title="Facebook"><i
								class="fa fa-facebook"></i></a></li>
						<li><a href="#" title="Twitter"><i class="fa fa-twitter"></i></a></li>

					</ul>
				</div>
				<!-- Widget Newsletter /- -->
			</div>
		</div>
		<!-- Container /- --> </footer> <!-- Footer Main 1 -->
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
			$('#serch-btn').click(function() {
				alert("已點");
				var searchText = $('#searchText').val();
				alert(searchText);
				if (searchText.trim().length == 0) {
					alert('請輸入搜尋條件');
					$('#filter').val('').focus();
				} else {
					$('#searchForm').submit();
				}
			})

		})
	</script>
</body>
</html>



