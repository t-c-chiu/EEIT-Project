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
<link rel="stylesheet" type="text/css" href="../css/articleAndCourseCenter.css">
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
								<li><a id="center-message" class="center-li">系統訊息<span></span></a></li>
								<li><a id="personal-information" class="center-li">個人資料</a></li>
								<li><a id="member-point" class="center-li">會員點數<span>${member.point }點</span></a></li>
								<li><a id="change-password" class="center-li">更改密碼</a></li>
							</ul>
						</aside>
						<!-- Widget Member /-  -->
						<!-- Widget order -->
						<aside class="widget widget_categories">
							<h3 class="widget-title">交易訂單</h3>
							<ul>
								<li><a id="favorite-product" class="center-li">收藏商品<span>(4)</span></a></li>
								<li><a id="shopping-cart" class="center-li">購物車<span></span></a></li>
								<li><a id="order-list" class="center-li">訂單明細</a></li>
								<li><a id="course-list" class="center-li">我的課程<span></span></a></li>
							</ul>
						</aside>
						<!-- Widget oder /-  -->
						<!-- Widget article -->
						<aside class="widget widget_categories">
							<h3 class="widget-title">文章管理</h3>
							<ul>
								<li><a id="my-article" class="center-li">我的文章<span></span></a></li>
								<li><a id="favorite-article" class="center-li">我的收藏<span></span></a></li>
								<li><a id="reply-article" class="center-li">參與的討論<span></span></a></li>
								<li><a id="reported-article" class="center-li">檢舉的文章<span></span></a></li>
							</ul>
						</aside>
						<!-- Widget article /-  -->
					</div>
					<!-- /Area -->
					
					<!-- 系統訊息 -->
					<div id="center-change-1" class="col-md-8 col-sm-7 col-xs-12 content-area product-section2 no-left-padding">
						<h3 class="center-title">系統訊息</h3>
						<table id="mySystemMsgTable" class="forumTable">
							<tr>
								<th>標題</th>
								<th>訊息時間</th>
								<th>狀態</th>
							</tr>
						</table>
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
							<h3 class="entry-title">剩餘可使用點數: <span id="points"> ${member.point}  </span><span class="points">點</span></h3>
							<div class="entry-meta">
								<span class="post-admin">會員點數使用明細</span>
							</div>
							<div id="point-details" class="entry-content">
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
<!-- 									<div class="col-md-12 form-group"> -->
<!-- 										<label>E-mail *</label><span id="emailchange-span"></span>  -->
<!-- 										<input onblur="emailChangeCheck();" id="emailchange" name="emailchange" class="form-control" type="email" required /> -->
<!-- 									</div> -->
									<div class="col-md-12 form-group">
									<label>舊密碼 *</label><span id="psold-span"></span> <input
										onblur="" id="old-password" name="old-password"
										class="form-control" type="password" autocomplete="off"
										maxlength="20" required />
									</div>
									<div class="col-md-12 form-group">
									<label>新密碼 *</label><span id="ps-span"></span> <input
										onblur="psw();" id="r-password" name="password"
										class="form-control" type="password" autocomplete="off"
										maxlength="20" required />
									</div>
									<div class="col-md-12 form-group">
									<label>重複新密碼 *</label><span id="ps2-span"></span> <input
										onblur="match();" id="passwordMatch" class="form-control"
										type="password" autocomplete="off" maxlength="20"
										maxlength="20" required />
									</div>
								</div>
							<button id="send-newpassword"
								class="btn btn-default form-control password-send "
								type="button">確定更改為新密碼</button>
							</div>
						</form>
					</div>
					</div>
					<!-- 收藏商品 -->
					<div id="center-change-5" class="col-md-8 col-sm-7 col-xs-12 content-area product-section2 no-left-padding">
					<h3 class="center-title">收藏商品</h3>
					</div>
					<!-- 購物車 -->
					<div id="center-change-6" class="col-md-8 col-sm-7 col-xs-12 content-area product-section2 no-left-padding">
					<h3 class="center-title">購物車</h3>
					<table id="myBePaidTable" class="forumTable">
						<tr>
							<th>訂單類型</th>
							<th>訂單名稱</th>
							<th>訂單價格</th>
						</tr>
					</table>
					</div>
					<!-- 訂單明細 -->
					<div id="center-change-7" class="col-md-8 col-sm-7 col-xs-12 content-area product-section2 no-left-padding">
					<h3 class="center-title">訂單明細</h3>
					<table id="myBePaidListTable">
					</table>
					</div>
					<!-- 我的文章 -->
					<div id="center-change-8" class="col-md-8 col-sm-7 col-xs-12 content-area product-section2 no-left-padding">
					<h3 class="center-title">我的文章</h3>
					<table id="postArticleTable" class="forumTable">
						<tr>
							<th>分類</th>
							<th>主題</th>
							<th>發文日期</th>
							<th>收藏數</th>
							<th>狀態</th>
						</tr>
					</table>
					</div>
					<!-- 文章收藏 -->
					<div id="center-change-9" class="col-md-8 col-sm-7 col-xs-12 content-area product-section2 no-left-padding">
					<h3 class="center-title">我的收藏</h3>
					<table id="collectArticleTable" class="forumTable">
						<tr>
							<th>作者</th>
							<th>分類</th>
							<th>主題</th>
							<th>發文日期</th>
							<th>狀態</th>
						</tr>
					</table>
					</div>
					
					<div id="center-change-10" class="col-md-8 col-sm-7 col-xs-12 content-area product-section2 no-left-padding">
					<h3 class="center-title">參與的討論</h3>
					<table id="replyArticleTable" class="forumTable">
						<tr>
							<th>作者</th>
							<th>分類</th>
							<th>主題</th>
							<th>發文日期</th>
							<th>狀態</th>
						</tr>
					</table>
					</div>
					
					<div id="center-change-11" class="col-md-8 col-sm-7 col-xs-12 content-area product-section2 no-left-padding">
					<h3 class="center-title">檢舉的文章</h3>
					<table id="reportedArticleTable" class="forumTable">
						<tr>
							<th>作者</th>
							<th>主題</th>
							<th>發文日期</th>
							<th>文章狀態</th>
							<th>檢舉理由</th>
							<th>檢舉日期</th>
							<th>檢舉訊息狀態</th>
						</tr> 
					</table>
					</div>
					<!-- 我的課程 -->
					<div id="center-change-12" class="col-md-8 col-sm-7 col-xs-12 content-area product-section2 no-left-padding">
					<h3 class="center-title">我的課程</h3>
					<table id="myCoursesTable" class="forumTable">
						<tr>
							<th>課程名稱</th>
							<th>課程地點</th>
							<th>上課時間</th>
							<th>課程價位</th>
							<th>課程狀態</th>
							<th>繳費狀況</th>
						</tr>
					</table>
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
	<script type="text/javascript" src="../js/pointDetails.js"></script>
	<script type="text/javascript" src="../js/pagination.js"></script>
	<script type="text/javascript" src="../js/articleAndCourseCenter.js"></script>
</body>
</html>