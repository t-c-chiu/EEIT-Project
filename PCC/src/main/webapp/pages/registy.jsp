<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PCC - Registy</title>
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

<!-- fontawesome -->
<link href="../revolution/fonts/fontawesome-all.css">

<!-- css -->
<link rel="stylesheet" type="text/css" href="../css/login.css">
</head>

<body data-offset="200" data-spy="scroll" data-target=".ow-navigation">
	<div class="main-container">
		<!-- Loader -->
		<div id="site-loader" class="load-complete">
			<div class="loader">
				<div class="loader-inner ball-clip-rotate">
					<div></div>
				</div>
			</div>
		</div>
		<!-- Loader /- -->

		<%@ include file="header.jsp"%>
		<!--	內容開始	-->
		<main> <!-- Page Banner -->
		<div class="page-banner container-fluid no-padding">
			<!-- Container -->
			<div class="container">
				<div class="banner-content">
					<h3>會員註冊</h3>
					<p>Welcome to PCC company</p>
				</div>
				<ol class="breadcrumb">
					<li><a href="../index.html" title="Home">首頁</a></li>
					<li class="active"><a href="../pages/registy.html" title="Registy">會員註冊</a></li>
				</ol>
			</div>
			<!-- Container /- -->
		</div>
		<!-- Page Banner /- --> <!-- Checkout -->
		<div
			class="container-fluid no-left-padding no-right-padding woocommerce-checkout">
			<!-- Container -->
			<div class="container">

				<!-- Billing -->
				<div class="checkout-form">
					<form>
						<div class="col-md-6 col-sm-12 col-xs-12 col-md-push-3 ">
							<h3>會員註冊</h3>
							<div class="billing-field">
								<div class="col-md-12 form-group">
									<label>姓名 *</label> <input class="form-control" type="text" />
								</div>
								<div class="col-md-12 form-group">
									<label>帳號 *</label> <input id="account" class="form-control" type="text"
										placeholder="8~20個英文,數字" />
								</div>
								<div class="col-md-12 form-group">
									<label>密碼 *</label> <input id="password" class="form-control"
										type="password" autocomplete="off"
										autofocus required />
								</div>
								<div class="col-md-12 form-group">
									<label>重複密碼 *</label> <input id="passwordMatch"
										match="Password" class="form-control" type="password"
										autocomplete="off" autofocus required />
								</div>
								<div class="col-md-6 form-group">
									<label>Email *</label> <input id="email" class="form-control" type="text" />
								</div>
								<div class="col-md-6 form-group">
									<label>手機 *</label> <input id="phone" class="form-control" type="text" />
								</div>
								<div class="col-md-6 form-group">
									<label>地址 *</label>
									<div class="select">
										<select class="form-control">
											<option>台北市</option>
											<option>新北市</option>
											<option>台中市</option>
											<option>新竹市</option>
										</select>
									</div>
								</div>
								<div class="col-md-12 form-group">
									<label>縣市 *</label> <input class="form-control" type="text" />
								</div>
							</div>
						</div>
					</form>
					<button class="btn btn-default form-control footer-send "
						type="button">註冊</button>
				</div>
				<!-- Billing /- -->
			</div>
			<!-- Container /- -->
		</div>
		<!-- Checkout /- --> </main>
		<!--	內容結束	-->
<%@ include file="footer.jsp"%>

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
	<!-- login -->
	<script src="js/login.js"></script>	
	
	<script type="text/javascript">
	$(document).ready(function(){
		$('#account').blur(function(){
			$.ajax()
		});
		
	});
	
	
	</script>

</body>
</html>