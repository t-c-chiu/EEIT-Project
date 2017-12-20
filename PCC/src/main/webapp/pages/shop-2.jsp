<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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

					<!-- 須回到購物商城的首頁 也就是 熱賣商品中心 -->
					<li class="active"><a href="#">購物商城</a></li>
					<!-- 須回到購物商城的首頁 也就是 熱賣商品中心 -->
				</ol>
			</div>
			<!-- Container /- -->
		</div>
		<!-- Page Banner /- --> <!-- Product Section2 -->
		<div
			class="product-section product-section1 product-section2 container-fluid no-padding">
			<!-- Container -->
			<div class="container">
				<div class="row">
					<!-- Widget Area -->
					<div
						class="col-md-4 col-sm-4 col-xs-12 widget-area no-right-padding">
						<!-- Widget Search -->
						<aside class="widget widget_search">
						<h3 class="widget-title">Search</h3>
						<div class="input-group">
							<form action="/PCC/searchProduct.shopping" method="get"
								id="searchForm">
								<input class="form-control" id="searchText" name="searchText"
									placeholder="Search You Wants Here . . ." type="text">
								<span id="serch-btn" class="input-group-btn">
									<button class="btn btn-default" type="button">
										<i class="icon icon-Search"></i>
									</button>
								</span>
							</form>
						</div>
						</aside>
						<!-- Widget Search /- -->
						<!-- Widget Categories -->
						<aside class="widget widget_categories">
						<h3 class="widget-title">Categories</h3>

						<ul>
							<c:forEach var="category" items="${categorys}">

								<li class="categoryli">
									<form action="<c:url value="/searchCatagory.shopping"/>"
										method="get">
										<a href="#">${category.categoryName}<span>(${category.sumCategory})
										</span>
										</a> <input type="text" name="category"
											value="${category.categoryName}" hidden />
									</form>
								</li>

							</c:forEach>
						</ul>

						</aside>
						<!-- Widget Categories /-  -->
						<!-- Widget Price -->
						<aside class="widget widget_price_filter">
						<h3 class="widget-title">filter by price</h3>
						<div class="price-filter">
							<div id="slider-range"></div>
							<div class="price-input">
								<span id="amount"></span> <span id="amount2"></span>
							</div>
							<a href="#" title="filter">Filter</a>
						</div>
						</aside>
						<!-- Widget Price /- -->
						<!-- Widget Latest Post -->
						<aside class="widget widget_latest_post">
						<h3 class="widget-title">recent posts</h3>

						<c:forEach var="asideProducts" items="${asideProducts}">
							<div class="latest-box">
								<div class="post-box">
									<!-- 思考一下 少 點圖跳到相關頁面 -->
									<a href="#"><img src="../images/latest-post-1.jpg"
										alt="Post"></a>
									<h5>
										<a href="#" title="need max shop.">${asideProducts.productName}</a>
									</h5>
									<div class="star-rating">
										<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star-o"></i>
									</div>
									<span class="price"><del>${asideProducts.price}</del>${asideProducts.price}</span>
									<!-- /思考一下 -->

								</div>
							</div>
						</c:forEach> </aside>
						<!-- Widget Latest Post /- -->
						<!-- Widget Tags -->
						<aside class="widget widget_tags">
						<h3 class="widget-title">popular tags</h3>
						<div class="tags-box">
							<c:forEach var="category" items="${categorys}">

								<a href="#" class="categoryli">${category.categoryName}
									<form action="<c:url value="/searchCatagory.shopping"/>"
										method="get">
										<input type="text" name="category"
											value="${category.categoryName}" hidden />
									</form>
								</a>
							</c:forEach>
						</div>
						</aside>
						<!-- Widget Tags -->
					</div>
					<!-- Widget Area /- -->

					<!-- Content Area -->
					<div
						class="col-md-8 col-sm-7 col-xs-12 content-area product-section2 no-left-padding">
						<!-- Products -->
						<ul class="products">
							<!-- 商品點選區  Product -->
							<c:forEach var="products8" items="${products}">

								<li class="product"><a
									href="/PCC/pages/${products8.productId}.jsp"> <img
										src="../images/product-10.jpg" alt="Product" />
										<h5>${products8.productName}</h5> <span class="price">
											<del>${products8.price}</del> ${products8.price}
									</span>
								</a> <a href="#" class="add-to-cart1" title="Add To Cart"> Add
										To Cart
										<p hidden>${products8.productId}</p>
								</a> <!-- 圖案旁邊的icon -->
									<div class="wishlist-box">
										<a href="#"> <i class="fa fa-arrows-alt"></i>
										</a> <a href="#"> <i class="fa fa-heart-o"></i>
										</a> <a href="#"> <i class="fa fa-search"></i>
										</a>
									</div> <!-- /圖案旁邊的icon --></li>

							</c:forEach>
					</div>
					<!-- Content Area /- -->
				</div>
				<!-- Row /- -->
				<nav class="ow-pagination">
				<ul class="pager">
					<li class="number"><a href="#">1</a></li>
					<li class="load-more"><a href="#">Load More</a></li>
					<li class="previous"><a href="#"><i
							class="fa fa-angle-right"></i></a></li>
					<li class="next"><a href="#"><i class="fa fa-angle-left"></i></a></li>
				</ul>
				</nav>
			</div>
			<!-- Container /- -->
		</div>
		<!-- Product Section2 /- --> </main>
		<!--	內容結束	-->

		<!-- Footer Main 1 -->
		<footer id="footer-main"
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
		<!-- Container /- --> </footer>
		<!-- Footer Main 1 -->

	</div>
	<form id="startForm" action="/PCC/star.shopping" method="post">
		<input id=startInput type="text" value="${start}" hidden />
	</form>

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
			var starInput = $('#startInput').val();
			ViewCart();
			if (starInput == "") {
				$('#startForm').submit();
			}
			//搜尋欄搜尋商品名
			$('#serch-btn').click(function() {
				// 				alert("已點");
				var searchText = $('#searchText').val();
				//				alert(searchText);
				if (searchText.trim().length == 0) {
					alert('請輸入搜尋條件');
					$('#filter').val('').focus();
				} else {
					$('#searchForm').submit();
				}
			})
			//分類欄點選分類
			$(".categoryli").click(function() {
				// 				alert(".categoryli被點選");
				var formid = $(this).find("input").val();

				// 				alert(formid);
				if (formid != '') {
					$(this).find("form").submit();
				}

			});

			//加入購物車

			$(".add-to-cart1").click(function() {
				var productId = $(this).find("p").text();
				var producIdCartLi = $("#" + productId+"SS");
			
				$.ajax({
					url : "/PCC/addCart.shopping",
					type : "POST",
					data : {"productId" : productId},
					success : function(data) {
						if (producIdCartLi.text() =="") {
							var item = $("#" + data.productId);
							item.css("display", "");
						}
						//抓數量的數字
						$("#" + data.productId + "span").text(data.quantity);
						//只要購物車內有東西，就打開View Cart 和Check Out
						$("#cartButtonLi").css("display","");
					}
				});

			});
			
			//只要購物車內有東西，就打開View Cart 和Check Out
			function ViewCart(){
				var sum=0;
				$(".cartSpan").each(function(){
					var number =parseInt($(this).text());
					sum=sum+number;
				});
				if(sum==0){
					$("#cartButtonLi").css("display","");

				}else{
					$("#cartButtonLi").css("display","none");
				}

			}	

			//按下X除去購物車物件
			
// 				$(".remove").click(function(){
// 					var parent=$(this).parent(".mini_cart_item");
// 								parent.css("display","none");
// 				ViewCart();		
//  					$.ajax({
// 						url : "/PCC/addCart.shopping",
// 						type : "POST",
// 						data : {"productId" : productId},
// 						success : function(data) {
// 							if (producIdCartLi.text() =="") {
// 								var item = $("#" + data.productId);
// 								item.css("display", "");
// 							}
// 							//抓數量的數字
// 							$("#" + data.productId + "span").text(data.quantity);
// 							//只要購物車內有東西，就打開View Cart 和Check Out
// 							$("#cartButtonLi").css("display","");
// 						}
// 					});
					
// 				});
		
			
			

		});
	</script>
</body>
</html>



