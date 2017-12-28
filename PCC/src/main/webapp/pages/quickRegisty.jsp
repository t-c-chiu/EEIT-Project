<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PCC - QuickRegisty</title>
<!-- Standard Favicon -->
<link rel="icon" type="image/x-icon" href="../images/pcc/pcc.png" />

<!-- RS5.0 Layers and Navigation Styles -->
<link rel="stylesheet" type="text/css"
	href="../revolution/css/layers.css">
<link rel="stylesheet" type="text/css"
	href="../revolution/css/navigation.css">
<link rel="stylesheet" type="text/css" href="../css/shortcode.css">

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

<!-- css -->
<link rel="stylesheet" type="text/css" href="../css/login.css">
</head>
<body data-offset="200" data-spy="scroll" data-target=".ow-navigation">
	<div class="main-container">
		<!--	內容開始	-->
		<main>
		<div
			class="container-fluid no-left-padding no-right-padding woocommerce-checkout">
			<!-- Container -->
			<div class="container quick">
				<!-- Billing -->
				<div class="checkout-form">
					<form id="quick-registy-form" method="POST">
						<div class="col-md-6 col-sm-12 col-xs-12 col-md-push-3 ">
							<h3>PCC會員快速註冊</h3>
							<div class="billing-field">
								<div class="col-md-6 form-group">
									<label>手機 *</label><span id="phone-span"></span> <input
										onblur="phoneCheck();" id="phone" name="phone"
										class="form-control" type="text" maxlength="10" required />
								</div>
								<div class="col-md-6 form-group">
									<label>縣市 *</label>
									<div class="select">
										<select name="area" class="form-control">
											<option value="基隆市">基隆市</option>
											<option value="臺北市">臺北市</option>
											<option value="新北市">新北市</option>
											<option value="宜蘭縣">宜蘭縣</option>
											<option value="新竹市">新竹市</option>
											<option value="新竹縣">新竹縣</option>
											<option value="桃園市">桃園市</option>
											<option value="苗栗縣">苗栗縣</option>
											<option value="臺中市">臺中市</option>
											<option value="彰化縣">彰化縣</option>
											<option value="南投縣">南投縣</option>
											<option value="嘉義市">嘉義市</option>
											<option value="嘉義縣">嘉義縣</option>
											<option value="雲林縣">雲林縣</option>
											<option value="臺南市">臺南市</option>
											<option value="高雄市">高雄市</option>
											<option value="屏東縣">屏東縣</option>
											<option value="臺東縣">臺東縣</option>
											<option value="花蓮縣">花蓮縣</option>
											<option value="金門縣">金門縣</option>
											<option value="連江縣">連江縣</option>
											<option value="澎湖縣">澎湖縣</option>
										</select>
									</div>
								</div>
								<div class="col-md-12 form-group">
									<label>地址 *</label><span id="address-span"></span> <input
										onblur="addressCheck();" id="address" name="address"
										class="form-control" type="text" required />
								</div>

							</div>
						</div>

						<div class="col-md-6 col-md-push-3" style="clear:both;">
							<button id="quick-registy-btn"
							class="btn btn-default form-control footer-send "
							type="button">快速註冊</button>
						</div>

					</form>

				</div>
				<!-- Billing /- -->
			</div>
			<!-- Container /- -->
		</div>
		<!-- Checkout /- --> </main>
		<!--	內容結束	-->

	</div>

	<!-- JQuery v1.12.4 -->
	<script src="../js/jquery.min.js"></script>

	<!-- Library - Js -->
	<script src="../libraies/lib.js"></script>
	<script src="../libraies/jquery.countdown.min.js"></script>

	<!-- Library - Theme JS -->
	<script src="../js/functions.js"></script>

	<!-- login  -->
	<script type="text/javascript" src="../js/login.js"></script>
</body>
</html>