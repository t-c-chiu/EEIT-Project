<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PCC - Center</title>
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
<link rel="stylesheet" type="text/css" href="../css/center.css">
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
					<h3>會員中心</h3>
					<p>Welcome to PCC Member Center.</p>
				</div>
				<ol class="breadcrumb">
					<li><a href="../index.jsp" title="Home">首頁</a></li>
					<li class="active">會員中心</li>
				</ol>
			</div>
			<!-- Container /- -->
		</div>
		<!-- Page Banner /- --> <!-- Checkout -->
		<div
			class="container-fluid no-left-padding no-right-padding woocommerce-checkout">
			<!-- Container -->
			<div class="container">
				<div class="row">
					<!-- Area -->
					<div class="col-md-4 col-sm-4 col-xs-12 widget-area no-right-padding">
						<!-- Widget Member -->
						<aside class="widget widget_categories center-aside">
							<h3 class="widget-title">會員資訊</h3>
							<ul>
								<a id="center-message" class="center-li"><li>系統訊息<span>(1)</span></li></a>
								<a id="personal-information" class="center-li"><li>個人資料</li></a>
								<a id="member-point" class="center-li"><li>會員點數<span>21055點</span></li></a>
								<a id="change-password" class="center-li"><li>更改密碼</li></a>
							</ul>
						</aside>
						<!-- Widget Member /-  -->
						<!-- Widget order -->
						<aside class="widget widget_categories">
							<h3 class="widget-title">交易訂單</h3>
							<ul>
								<li id="favorite-product"><a href="#">收藏商品<span>(4)</span></a></li>
								<li id="shopping-cart"><a href="#">購物車<span>(5)</span></a></li>
								<li id="order-list"><a href="#">訂單明細</a></li>
							</ul>
						</aside>
						<!-- Widget oder /-  -->
						<!-- Widget article -->
						<aside class="widget widget_categories">
							<h3 class="widget-title">文章管理</h3>
							<ul>
								<li id="my-article"><a href="#">我的文章<span>(4)</span></a></li>
								<li id="favorite-article"><a href="#">文章收藏<span>(5)</span></a></li>
							</ul>
						</aside>
						<!-- Widget article /-  -->
					</div>
					<!-- /Area -->
					
					<!-- 系統訊息 -->
					<div id="center-change-1" class="col-md-8 col-sm-7 col-xs-12 content-area product-section2 no-left-padding">
							<h3 class="center-title">系統訊息</h3>
						<!-- 1 -->	
						<div class="type-post">
						<div class="col-md-12 col-sm-12 col-xs-12 blog-content">
							<h3 class="entry-title">聖誕節商品特賣會!! 聖誕老人瘋狂好禮大抽獎!</h3>
							<div class="entry-meta">
								<span class="post-admin">活動期間: <i class="fa fa-calendar-o"></i>12/01 ~ 12/30</span>
							</div>
							<div class="entry-content">
								<p>活動期間，凡於購物商城內消費滿1000，即可獲得「聖誕刮刮卡」乙張。iPhone X、NINTENDO SWITCH台灣專用主機、黑武士1：1藍芽喇叭、台南晶英酒店雙人住宿券、餐點商品優惠券等大獎，即刮即中，通通有獎！</p>
								<a href="#" title="Read More" class="read-more">Read More<i class="fa fa-long-arrow-right"></i></a>
							</div>
						</div>
					</div>
					<!-- 2 -->	
						<div class="type-post">
						<div class="col-md-12 col-sm-12 col-xs-12 blog-content">
							<h3 class="entry-title">聖誕節商品特賣會!! 聖誕老人瘋狂好禮大抽獎!</h3>
							<div class="entry-meta">
								<span class="post-admin">活動期間: <i class="fa fa-calendar-o"></i>12/01 ~ 12/30</span>
							</div>
							<div class="entry-content">
								<p>活動期間，凡於購物商城內消費滿1000，即可獲得「聖誕刮刮卡」乙張。iPhone X、NINTENDO SWITCH台灣專用主機、黑武士1：1藍芽喇叭、台南晶英酒店雙人住宿券、餐點商品優惠券等大獎，即刮即中，通通有獎！</p>
								<a href="#" title="Read More" class="read-more">Read More<i class="fa fa-long-arrow-right"></i></a>
							</div>
						</div>
					</div>
					<!-- 3 -->	
						<div class="type-post">
						<div class="col-md-12 col-sm-12 col-xs-12 blog-content">
							<h3 class="entry-title">聖誕節商品特賣會!! 聖誕老人瘋狂好禮大抽獎!</h3>
							<div class="entry-meta">
								<span class="post-admin">活動期間: <i class="fa fa-calendar-o"></i>12/01 ~ 12/30</span>
							</div>
							<div class="entry-content">
								<p>活動期間，凡於購物商城內消費滿1000，即可獲得「聖誕刮刮卡」乙張。iPhone X、NINTENDO SWITCH台灣專用主機、黑武士1：1藍芽喇叭、台南晶英酒店雙人住宿券、餐點商品優惠券等大獎，即刮即中，通通有獎！</p>
								<a href="#" title="Read More" class="read-more">Read More<i class="fa fa-long-arrow-right"></i></a>
							</div>
						</div>
					</div>
					</div>
					<!-- 個人資料 -->
					<div id="center-change-2" class="col-md-8 col-sm-7 col-xs-12 content-area product-section2 no-left-padding">
					<h3 class="center-title">個人資料</h3>
					<form method="POST">
					<div class="type-post">
						<div class="col-md-12 col-sm-12 col-xs-12 blog-content">
							<div class="entry-content">
								<p><span class="personal-content">姓名:</span><span id="nameEl">${member.name}</span></p>
								<p><span class="personal-content">E-mail:</span><span id="emailEl">${member.email }</span></p>
								<p><span class="personal-content">電話:</span><span id="phoneEl">${member.phone }</span></p>
								<p><span class="personal-content">地址:</span><span id="areaEl">${member.area }</span> , <span id="addressEl">${member.address }</span></p>
							</div>
						</div>
					</div>
					</form>
					<div class="checkout-form">
					<div class="center-title-s">修改個人資料</div>
					<form id="personal-update">
							<div class="col-md-8 col-sm-12 col-xs-12 col-md-push-2 ">
								<div class="billing-field">
									<div class="col-md-12 form-group">
									<label>姓名 *</label><span id="name-span"></span> <input
										onblur="nameCheck();" id="name" name="name"
										class="form-control" type="text" value="${member.name }" required />
								</div>
								<div class="col-md-6 form-group">
									<label>Email *</label><span id="email-span"></span>  <input onblur="emailCheck();" id="r-email" name="email"
										class="form-control" type="email" value="${member.email }" required />
								</div>
								<div class="col-md-6 form-group">
									<label>手機 *</label><span id="phone-span"></span> <input
										onblur="phoneCheck();" id="phone" name="phone"
										class="form-control" type="text" maxlength="10" value="${member.phone }" required />
								</div>
								<div class="col-md-6 form-group">
									<label>縣市 *</label>
									<div class="select">
										<select id="${member.area }" name="area" class="form-control">
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
										class="form-control" type="text" value="${member.address }" required />
								</div>
								</div>
								<button id="personal-updatebtn"
								class="btn btn-default form-control password-send "
								type="button">確定修改個人資料</button>
							</div>
						</form>
					
					</div>
					</div>
					<!-- 會員點數 -->
					<div id="center-change-3" class="col-md-8 col-sm-7 col-xs-12 content-area product-section2 no-left-padding">
					<h3 class="center-title">會員點數</h3>
					<form method="POST">
					<div class="type-post">
						<div class="col-md-12 col-sm-12 col-xs-12 blog-content">
							<h3 class="entry-title">剩餘可使用點數: <span class="points"> ${member.point}  點</span></h3>
							<div class="entry-meta">
								<span class="post-admin">會員點數使用明細</span>
							</div>
							<div class="entry-content">
								<p><span class="personal-content">11/12</span>加入會員贈送 <span class="personal-content-right">+5000點</span></p>
								<p><span class="personal-content">11/30</span>購物回饋 <span class="personal-content-right">+200點</span></p>
								<p><span class="personal-content">12/02</span>點數消費 <span class="personal-content-right">-500點</span></p>
								<p><span class="personal-content">12/20</span>聖誕節活動消費贈送 <span class="personal-content-right">+1000點</span></p>
							</div>
						</div>
					</div>
					</form>
					</div>
					<!-- 更改密碼 -->
					<div id="center-change-4" class="col-md-8 col-sm-7 col-xs-12 content-area product-section2 no-left-padding">
					<h3 class="center-title">更改密碼</h3>
					<div class="checkout-form">
						<form method="POST">
							<div class="col-md-8 col-sm-12 col-xs-12 col-md-push-2 ">
								<div class="billing-field">
									<div class="col-md-12 form-group">
										<label>E-mail *</label><span id="emailchange-span"></span> 
										<input onblur="emailChangeCheck();" id="emailchange" name="emailchange" class="form-control" type="email" required />
									</div>
								</div>
							<button id=""
								class="btn btn-default form-control password-send "
								type="button submit">寄送新密碼給我</button>
							</div>
						</form>
					</div>
					</div>
					
					
				</div>	
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

	<!-- login  -->
	<script type="text/javascript" src="../js/login.js"></script>
	<!-- center -->
	<script type="text/javascript" src="../js/center.js"></script>
</body>
</html>