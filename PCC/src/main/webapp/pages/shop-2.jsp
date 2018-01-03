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
<meta name="google-signin-client_id" content="368506092635-g2qmv1vf4gu9tbs24d644k0kgqqg79kr.apps.googleusercontent.com">
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
		<%@ include file="header.jsp"%>

		<!-- Header -->

		<!--	內容開始	-->
		<main> <!-- Page Banner -->
		<div class="page-banner container-fluid no-padding">
			<!-- Container -->
			<div class="container">
				<div class="banner-content">
					<h3 id="shoppingTitil">購物商城</h3>
				</div>
				<ol class="breadcrumb">
					<li><a href="../index.jsp" title="Home">首頁</a></li>

					<!-- 須回到購物商城的首頁 也就是 熱賣商品中心 -->
					<li class="active">購物商城</li>
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
							<a id="priceFilter" title="filter">Filter</a>
						</div>
						</aside>
						<!-- Widget Price /- -->
						<!-- Widget Latest Post -->
						<aside class="widget widget_latest_post">
						<h3 class="widget-title">recent posts</h3>

						<c:forEach var="asideProducts" items="${asideProducts}">
							<div class="latest-box">
								<div class="post-box">

									<div class="productItem">
										<form  action="/PCC/productId.shopping" method="get">
											<input type="text" name="productId" value="${asideProducts.productId}" hidden />
										</form> 
										<a >
										<img src="${asideProducts.pictureAscii}" width="85px" height="75px" alt="Post" />
										</a>
										<h5>
											<a title="need max shop.">${asideProducts.productName}</a>
										</h5>


										<div class="star-rating">
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star-o"></i>
										</div> 
										<span class="price"><del>${asideProducts.price}</del>${asideProducts.price}</span>
									</div>

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
									<form action="<c:url value='/searchCatagory.shopping'/>" method="get">
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



								<li class="product">
								<a id="${products8.productId}" class="productItem" href="#"> 
									<img src="${products8.pictureAscii }" alt="Product"/>
										<h5>${products8.productName}</h5> 
									<span class="price">
										<del>${products8.price}</del> ${products8.price}
									</span>
									<form id="${products8.productId}ProductForm" action="/PCC/productId.shopping" method="get" hidden>
										<input type="text" name="productId"	value="${products8.productId}" hidden />
									</form>
								</a> 
								
								<a href="#" class="add-to-cart1" title="Add To Cart"> Add
										To Cart
										<p hidden>${products8.productId}</p>
										
								</a> <!-- 圖案旁邊的icon --> 									
								<div  class="wishlist-box heart-shop">
										<a class="heart" name="${products8.productId}"> 
										<h1 class="forheart"><i class="fa fa-heart-o"></i></h1>
										</a> 

								</div>
							 </li>
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

		</div>
		<!-- Product Section2 /- --> </main>
		<!--	內容結束	-->

		<!-- Footer Main 1 -->
		<%@ include file="footer.jsp"%>
		<!-- Footer Main 1 -->
		<!-- Container /- -->
	</div>
	<form id="startForm" action="/PCC/star.shopping" method="post">
		<input name="pageName" type="text" value="searchPage" hidden /> 
		<input id="startInput" type="text" value="${start}" hidden />
		<input id="startCategory" type="text" name="categoryName" value="${categoryName}" hidden />	
	</form>


	<form  id="priceFilterForm" action="/PCC/searchByPrice.shopping" method="get" hidden>
			<input id="lowPrice" type="text" name="lowPrice" hidden/>
			<input id="hightPrice" type="text" name="hightPrice" hidden/>
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
	<script type="text/javascript" src="../js/login.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {

			var starInput = $('#startInput').val();
			var startCategory=$("#startCategory");
			ViewCart();

			if (starInput == "" || startCategory.val()=="") {
				startCategory.val("一開始");
				$('#startForm').submit();
			}
				
// 			//回到熱門商品首頁
			$("#shoppingTitil").click(function(){
				$("#startForm").submit();
				
			});
			
			
			
			
			// 搜尋欄搜尋商品名
			$('#serch-btn').click(function() {
				// alert("已點");
				var searchText = $('#searchText').val();
				// alert(searchText);
				if (searchText.trim().length == 0) {
					alert('請輸入搜尋條件');
					$('#filter').val('').focus();
				} else {
					$('#searchForm').submit();
				}
			})
			// 分類欄點選分類
			$(".categoryli").click(function() {
				$(this).find("form").submit();
			});

			// 加入購物車

			$(".add-to-cart1").click(function() {
				var productId = $(this).find("p").text();
				var producIdCartLi = $("#" + productId + "SS");
				$.ajax({
					url : "/PCC/addCart.shopping",
					type : "POST",
					data : {
						"productId" : productId,
						"number":1
					},
					success : function(data) {
						if (producIdCartLi.text() == "") {
							var item = $("#" + data.productId);
							item.css("display", "");
							alert("已加入購物車喔!!");
						}
						// 抓數量的數字
						$("#" + data.productId + "span").text(data.quantity);
						// 只要購物車內有東西，就打開View Cart 和Check Out
						ViewCart();
					}
				});
			});

			//點旁邊的小圖轉跳頁面

			$(".productItem").click(function() {
				$(this).find("form").submit();
			});

			
			//點擊愛心加到我的最愛
			$(".heart").click(function(){
				var id=$(this).attr("name");
		
				$.ajax({
					url:"/PCC/addToFavoriteProduct.shopping",
					type:"GET",
					data:{"productId":id},
					success:function(data){
						alert(data);						
					}
					
				});
				
			});
			
			
			//點擊filter可以藉由價錢來搜尋
			$("#priceFilter").click(function(){
				
				var lowPrice1=$("#amount").text();
				var lowPrice=lowPrice1.split("$");
				var hightPrice1=$("#amount2").text();
				var hightPrice=hightPrice1.split("$");
				$("#lowPrice").val(lowPrice[1]);
				$("#hightPrice").val(hightPrice[1]);
				$("#priceFilterForm").submit();
				
			});
			
			
		});

		// 是否打開 ViweCart
		function ViewCart() {
			var sum = 0;
			$(".cartSpan").each(function() {
				var number = parseInt($(this).text());

				sum = sum + number;
			});
			if (sum == 0) {
				$("#cartButtonLi").css("display", "none");

			} else {
				$("#cartButtonLi").css("display", "");
			}

		}
		
//autocompelte for 搜尋Text
$(function() {
	keywords=[]	
	$('#searchText').autocomplete({
		source:keywords		
	})
	
	
$('#searchText').keyup(function(){
	var searchText=$('#searchText').val();
	keywords.length = 0
	
	$.get('${pageContext.request.contextPath}/autocomplete.shopping','searchText='+searchText,function(data){		
		$.each(data,function(i,searchText){
			console.log(searchText)
			keywords.push(searchText)	
		})			
	  })		
	})	
})
		
		
	</script>
</body>
</html>



