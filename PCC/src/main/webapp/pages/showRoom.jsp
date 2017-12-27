<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" 
href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>PCC - Room</title>
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
<style>

</style>

<link href="../revolution/fonts/fontawesome-all.css">
<link rel="stylesheet" type="text/css" href="../css/login.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<script>

$(function() {
	keywords=[]	
	$('#area').autocomplete({
		source:keywords		
	})
	
	
$('#area').keyup(function(){
	var area=$('#area').val();
	keywords.length = 0
	
	$.get('${pageContext.request.contextPath}/getRoombyArea.room','area='+area,function(data){		
		$.each(data,function(i,area){
			console.log(area)
			keywords.push(area)	
		})			
	  })		
	})		
})

</script>
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

		<!-- Header -->
		<%@ include file="header.jsp" %>
		<!-- Header /- -->
		<!--	內容開始	-->
		<main> <!-- Page Banner -->
		<div class="page-banner container-fluid no-padding">
			<!-- Container -->
			<div class="container">
				<div class="banner-content">
					<h3>預約訂房</h3>
					<p>our vision is to be Earth's most customer centric company</p>
				</div>
				<ol class="breadcrumb">
					<li><a href="../index.html" title="Home">首頁</a></li>
					<li class="active">預約訂房</li>
				</ol>
			</div>

			<!-- Container /- -->
		</div>
		<!-- Page Banner /- --> <!-- Clients -->
			


			
		<div class="clients container-fluid" >
			<!-- Container -->
			<div class="container">
				<div class="clients-carousel">
					<div class="col-md-12 item">					
						<a href="#" title="client"><img src="../images/room/1.jpg"
							alt="client-1" /></a>				
					</div>
					<div class="col-md-12 item">
						<a href="#" title="client"><img src="../images/room/2.jpg"
							alt="client-2" /></a>
					</div>
					<div class="col-md-12 item">
						<a href="#" title="client"><img src="../images/room/3.jpg"
							alt="client-3" /></a>
					</div>
					<div class="col-md-12 item">
						<a href="#" title="client"><img src="../images/room/4.jpg"
							alt="client-4" /></a>
					</div>
					<div class="col-md-12 item">
						<a href="#" title="client"><img src="../images/room/5.jpg"
							alt="client-5" /></a>
					</div>

					<div class="col-md-12 item">
						<a href="#" title="client"><img src="../images/room/6.jpg"
							alt="client-1" /></a>
					</div>
					<div class="col-md-12 item">
						<a href="#" title="client"><img src="../images/room/7.jpg"
							alt="client-2" /></a>
					</div>
					<div class="col-md-12 item">
						<a href="#" title="client"><img src="../images/room/8.jpg"
							alt="client-3" /></a>
					</div>
					<div class="col-md-12 item">
						<a href="#" title="client"><img src="../images/room/9.jpg"
							alt="client-4" /></a>
					</div>
					<div class="col-md-12 item">
						<a href="#" title="client"><img src="../images/room/10.jpg"
							alt="client-5" /></a>
					</div>
				</div>
			</div>
			<!-- Container /- -->
		</div>	
						
									
			<!-- Container /- -->
		</div>
		
		
		<div class="about-section container-fluid no-padding">
			<!-- Container -->
			<div class="container">
				<div class="col-md-6 col-sm-6 col-xs-6">
					<img src="../images/about.jpg" alt="about" />
				</div>
				<div class="col-md-6 col-sm-6 col-xs-6">
					<div class="about-content">
						<h5>
							When you shop on <span>max shop</span> you can assured about the
							quality of the products you're buying.
						</h5>
						<p>You wanna be where you can see our troubles are all the
							same. You wanna be where everybody knows Your name. So lets make
							the most of this beautiful day. Since we're together. , We're
							gonna do it. On your mark get set and go now.</p>
						<p>Makin their way the only way they know how. That's just a
							little bit more than the law will allow. Doin' it our way.</p>
						<ul>
							<li>We Provide Only Branded Products</li>
							<li>Max Shop Provides Best Offers</li>
							<li>Our Shop Located In World Wide</li>
						</ul>
					</div>
				</div>

				<div id="about2" class="col-md-6 col-sm-6 col-xs-6">
				<div class="about-content">
						<h5>
							When you shop on <span>max shop</span> you can assured about the
							quality of the products you're buying.
						</h5>
						<p>You wanna be where you can see our troubles are all the
							same. You wanna be where everybody knows Your name. So lets make
							the most of this beautiful day. Since we're together. , We're
							gonna do it. On your mark get set and go now.</p>
						<p>Makin their way the only way they know how. That's just a
							little bit more than the law will allow. Doin' it our way.</p>
						<ul>
							<li>We Provide Only Branded Products</li>
							<li>Max Shop Provides Best Offers</li>
							<li>Our Shop Located In World Wide</li>
						</ul>
					</div>
				</div>
				<div class="col-md-6 col-sm-6 col-xs-6">
					<img src="../images/about.jpg" alt="about" />
				</div>
				
			<div class="goto-next">
				<a href="#about2"><i class="icon icon-Mouse bounce"></i></a>
			</div>
				
		</div>
			<!-- Container /- -->
		</div>
		<!-- About Section /- --> <!-- Category Section -->
			
					<div id="allForm" class="container-fluid no-left-padding no-right-padding woocommerce-checkout">
			<!-- Container -->
			<div class="container">

				<!-- Billing -->
				
				<div class="checkout-form">
         
					<div class="col-md-12 col-sm-12 col-xs-12">
					    <div>						
							<h3>開始訂房</h3>						
						</div>
									
						<form action="<c:url value="/show.room"/>" method="get">
							<div class="billing-field">
						
								<div class="col-md-4 form-group">
									<label>地區<span style="color:red" class="content" id="areaSpan"></span></label><input class="form-control" type="text"
										name="area" id="area" >
								</div>
								
								<div class="col-md-4 form-group">
									<label>房型<span style="color:red" class="content" id="roomTypeSpan"></span></label> 
									<div class="select">
										<select class="form-control" name="roomType">										
											<option value="normal">標準房</option>
											<option value="good">貴賓房</option>
										</select>
									</div>
								</div>
								
								
								<div class="col-md-4 form-group">
									<label>&#160;<span style="color:red" class="content"></span></label><input class="btn btn-default form-control footer-send" type="submit"
										value="送出">
								</div>																
						</div>
						</form>
					</div>
					

				</div>
				<!-- Billing /- -->		
			</div>
			
			
			
		<!-- Clients /- --> </main>
		<!--	內容結束	-->
		<!-- Footer Main 1 -->
		
	<%@ include file="footer.jsp" %>
		<!-- Footer Main 1 -->

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

</body>
</html>

