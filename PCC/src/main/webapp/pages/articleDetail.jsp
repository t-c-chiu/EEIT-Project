<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>PCC - Article</title>
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
<script src="<c:url value="/ckeditor/ckeditor.js"/>"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(function(){
		
		$.get('${pageContext.request.contextPath}/testCollect.forum',function(data){
			$('#collect').text(data);
		})
		
		$('#modifyButton').click(function(){
			$('#readyOnlyContents').css('display','none');
			$('#postForm').css('display','block');
		})
		
		$('#cancelButton').click(function(){
			$('#readyOnlyContents').css('display','block');
			$('#postForm').css('display','none');
		})
		
		$('#topicButton').click(function(){
			var topic = $('#filter').val();
			if(topic.trim().length == 0){
				$('#searchError').text('請輸入搜尋條件');
				$('#filter').val('').focus();
			}else{
				$('#topicForm').submit();
			}
		})
		
		$('#replyButton').click(function(){
			var contents = prompt('請輸入留言');
			if(contents.trim().length == 0){
				alert('留言不得為空');
				return;
			}
			$('#replyContents').val(contents);
			var formData = $("#replyForm").serialize();
			$.post('${pageContext.request.contextPath}/reply.forum',formData,function(data){
				console.log(data)
				console.log(data.memberId);
				var author = $('<span></span>').html('作者&nbsp;:&nbsp;'+data.memberId+'&nbsp;&nbsp;&nbsp;&nbsp;');
				var time = $('<span></span>').html('留言時間&nbsp;:&nbsp;'+data.date);
				$('#repliesArea').append(author,time,'<br>',data.contents,'<hr>');
			})
		})
		
		$('#deleteButton').click(function(){
			var isDelete = confirm('確定要刪除文章嗎?');
			if(isDelete){
				$.ajax('${pageContext.request.contextPath}/delete.forum',{
					type:'DELETE',
					success:function(data){
						alert(data);
						location.href = '${pageContext.request.contextPath}/showByOrder.forum?order=date';
					}
				});
			}
		})
		
		$('#report').click(function(){
			var reason = prompt('請輸入檢舉理由');
			if(reason.trim().length == 0){
				alert('檢舉理由不可為空白');
				return;
			}
			$.post('${pageContext.request.contextPath}/report.forum','reason=' + reason, function(data){
				alert(data);
			})
		})
		
		$('#collect').click(function(){
			$.get('${pageContext.request.contextPath}/collect.forum', function(data){
				if(data == '收藏成功'){
					var likesNum = parseInt($('#likesNum').text());
					$('#likesNum').empty().text(likesNum + 1);
					$('#collect').text('取消收藏');
				}else{
					var likesNum = parseInt($('#likesNum').text());
					$('#likesNum').empty().text(likesNum - 1);
					$('#collect').text('收藏文章');
				}
			})
		})
		
		$('#postButton').click(function(){
			var contents = CKEDITOR.instances.contents.getData();
			if(contents.length == 0){
				$('#contentsSpan').text('請輸入內容');
				return;
			}
			var contents = CKEDITOR.instances.contents.getData();
			$.post('${pageContext.request.contextPath}/modify.forum','contents=' + contents,function(data){
				alert('編輯成功');
				$('#readyOnlyContents').css('display','block').html(data);
				$('#postForm').css('display','none');
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
		</div><!-- Loader /- -->	
		
		<!-- Header -->
		<header class="header-section header-section-1 container-fluid no-padding">
			
			<!-- Middel Header -->
			<div class="middel-header">
				<!-- Container -->
				<div class="container">
					<!-- Logo Block -->
					<div class="col-md-4 col-sm-6 col-xs-12 logo-block">
						<a href="index.html" class="navbar-brand">PCC <span>logo</span></a>
					</div><!-- Logo Block /- -->
					<!-- Search Block -->
					<div class="col-md-5 col-sm-6 col-xs-6 search-block">
						<div class="input-group">
							<input class="form-control" placeholder="Search You Wants Here . . ." type="text">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button"><i class="icon icon-Search"></i></button>
							</span>
						</div>
					</div><!-- Search Block /- -->
					<!-- Menu Icon -->
					<div class="col-md-3 col-sm-6 col-xs-6 menu-icon">
						<ul class="cart">
							<li>
								<a aria-expanded="true" aria-haspopup="true" data-toggle="dropdown" id="cart" class="btn dropdown-toggle" title="Add To Cart" href="#"><i class="icon icon-ShoppingCart"></i></a>
								<ul class="dropdown-menu no-padding">
									<li class="mini_cart_item">
										<a title="Remove this item" class="remove" href="#">&#215;</a>
										<a href="#" class="shop-thumbnail">
											<img alt="poster_2_up" class="attachment-shop_thumbnail" src="images/product-wishlist-1.jpg">Flying Ninja
										</a>
										<span class="quantity">2 &#215; <span class="amount">Rs.12.00</span></span>
									</li>
									<li class="mini_cart_item">
										<a title="Remove this item" class="remove" href="#">&#215;</a>
										<a href="#" class="shop-thumbnail">
											<img alt="poster_2_up" class="attachment-shop_thumbnail" src="../images/product-wishlist-2.jpg">Flying Ninja
										</a>
										<span class="quantity">2 &#215; <span class="amount">Rs.12.00</span></span>
									</li>
									<li class="button">
										<a href="#" title="View Cart">View Cart</a>
										<a href="#" title="Check Out">Check out</a>
									</li>
								</ul>
							</li>
							<li><a href="#" title="Like"><i class="icon icon-Heart"></i></a></li>
							<li><a href="#" title="User"><i class="icon icon-User"></i></a></li>
						</ul>
					</div><!-- Menu Icon /- -->
				</div><!-- Container /- -->
			</div><!-- Middel Header /- -->
			
			<!-- Menu Block -->
			<div class="container-fluid no-padding menu-block">
				<!-- Container -->
				<div class="container">
					<!-- nav -->
					<nav class="navbar navbar-default ow-navigation">
						<div class="navbar-collapse collapse" id="navbar">
							<ul class="nav navbar-nav">
								<li class="dropdown">
									<a href="../index.html" title="Home" class="dropdown-toggle" role="button" aria-haspopup="true" aria-expanded="false">首頁</a>
								</li>
								<li><a href="../pages/reservation.html" title="Reservation">線上預約</a></li>
								<li><a href="../pages/partner.html" title="Partner">服務夥伴</a></li>
								<li class="dropdown">
                                        <a href="../pages/shop.html" title="Shop" class="dropdown-toggle" role="button" aria-haspopup="true" aria-expanded="false">購物商城 </a>
                                        <i class="ddl-switch fa fa-angle-down"></i>
                                        <ul class="dropdown-menu">
                                            <li><a href="#" title="">商品類</a></li>
                                            <li><a href="#" title="">商品類</a></li>
                                            <li><a href="#" title="">商品類</a></li>
                                        </ul>
                                    </li>
								<li class="dropdown">
                                        <a href="../pages/room.html" title="Room" class="dropdown-toggle" role="button" aria-haspopup="true" aria-expanded="false">預約訂房</a>
                                    </li>
                                    <li class="dropdown">
                                        <a href="../pages/course.html" title="Course" class="dropdown-toggle" role="button" aria-haspopup="true" aria-expanded="false">線上課程</a>
                                        <i class="ddl-switch fa fa-angle-down"></i>
                                        <ul class="dropdown-menu">
                                            <li><a href="#" title="">教學類</a></li>
                                            <li><a href="#" title="">教學類</a></li>
                                        </ul>
                                    </li>
                                    <li class="dropdown">
                                        <a href="<c:url value="/showByOrder.forum?order=date"/>" title="Forum" class="dropdown-toggle" role="button" aria-haspopup="true" aria-expanded="false">文章/討論</a>
                                        <i class="ddl-switch fa fa-angle-down"></i>
                                        <ul class="dropdown-menu">
                                        	<li><a href="<c:url value="/showByOrder.forum?order=likes"/>">熱門文章</a></li>
                                            <li><a href="<c:url value="/showAll.forum?category=懷孕討論"/>">懷孕討論</a></li>
                                            <li><a href="<c:url value="/showAll.forum?category=育兒討論"/>">育兒討論</a></li>
                                            <li><a href="<c:url value="/showAll.forum?category=心情分享"/>">心情分享</a></li>
                                        </ul>
                                    </li>
								<li><a href="../pages/contact-us.html" title="Contact Us">聯絡資訊</a></li>
							</ul>
						</div><!--/.nav-collapse -->
					</nav><!-- nav /- -->
				</div><!-- Container /- -->
			</div><!-- Menu Block /- -->
		</header><!-- Header /- -->
<!--	內容開始	-->		
		<main>
			<!-- Container -->
			<div class="" style="height:100px;"></div>
			<div class="container">
				<!-- Content Area -->
			<div class="content-area blog-section col-md-8 col-sm-8 col-xs-12">
			<h1>${detail.post.topic}</h1>
			<c:if test="${member.memberId eq detail.post.memberId}">
				<button id="modifyButton">編輯內文</button>&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="deleteButton">刪除文章</button>
			</c:if>
			<hr>
			<h3>${detail.post.memberId}</h3>
			文章類型&nbsp;:&nbsp;${detail.post.category}&nbsp;&nbsp;&nbsp;&nbsp;
			發文日期&nbsp;:&nbsp;<fmt:formatDate value="${detail.post.date}" pattern="yyyy-MM-dd HH:mm" />
		<hr>
		<div id="readyOnlyContents">${detail.post.contents}</div>
		<form id="postForm" style="display:none;" action="<c:url value="/modify.forum"/>" method="post" enctype="multipart/form-data">
		內容:<textarea name="contents" id="contents">${detail.post.contents}</textarea>
		<span id="contentsSpan"></span><br>
		<script>
			CKEDITOR.replace("contents", {
				width : 700
			});
		</script>
		<br><input id="postButton" type="button" value="送出"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input id="cancelButton" type="button" value="取消"/>
		</form>
		<hr>
		文章收藏數&nbsp;:&nbsp;<span id="likesNum">${detail.post.likes}</span>
		<c:if test="${!(member.memberId eq detail.post.memberId) && !empty member}">
		<hr>
			<button id="collect"></button>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<button id="report">檢舉本文</button>
		</c:if>
	
	<h2>留言區:</h2>
	<div id="repliesArea" style="height:300px;overflow:auto;">
		<c:forEach var="replyArticle" items="${detail.reply}">
			<span>作者&nbsp;:&nbsp;${replyArticle.memberId}</span>&nbsp;&nbsp;&nbsp;&nbsp;
			<span>留言時間&nbsp;:&nbsp;<fmt:formatDate value="${replyArticle.date}" pattern="yyyy-MM-dd HH:mm" /></span>
			<br>${replyArticle.contents}<hr>
		</c:forEach>
	</div>
		<div>
			<form id="replyForm" action="<c:url value="/reply.forum"/>" method="post">
				<input type="hidden" name="messageId" value="${detail.post.messageId}"/>
				<input id="replyContents" type="hidden" name="contents"/><br>
				<input id="replyButton" type="button" value="我要留言"/>
			</form>
		</div>
			
				</div><!-- Content Area /- -->
				
				<!-- Widget Area -->
				<div class="col-md-4 col-sm-4 col-xs-12 widget-area">
					<!-- Widget Search -->
					<aside class="widget widget_search">
						<h3 class="widget-title">搜尋文章</h3>
						<div class="input-group">
						<form id="topicForm" action="<c:url value="/search.forum" />" method="get">
							<input id="filter" name="topic" type="text" class="form-control" placeholder="輸入查詢">
							<span class="input-group-btn">
								<button id="topicButton" class="btn btn-search" title="Search" type="button"><i class="icon icon-Search"></i></button>
							</span>
							<span id="searchError"></span>
						</form>
						</div>
					</aside><!-- Widget Search /- -->
					<!-- Widget Categories -->
					<aside class="widget widget_categories">
						<h3 class="widget-title">主題分類</h3>
						<ul>
							<li><a href="<c:url value="/showByOrder.forum?order=likes"/>">熱門文章</a></li>
							<li><a href="<c:url value="/showAll.forum?category=懷孕討論"/>">懷孕討論</a></li>
							<li><a href="<c:url value="/showAll.forum?category=育兒討論"/>">育兒討論</a></li>
							<li><a href="<c:url value="/showAll.forum?category=心情分享"/>">心情分享</a></li>
						</ul>
					</aside><!-- Widget Categories /-  -->
				</div><!-- Widget Area /- -->
			</div><!-- Container /- -->
		</main>
<!--	內容結束	-->		
		<!-- Footer Main 1 -->
		<footer id="footer-main" class="footer-main footer-main-1 services-section container-fluid">
			<!-- Container -->
                <div class="container">
                    <div class="row">
                        <div class="section-header">
                            <h3>聯絡我們</h3>
                            <p>Contact-us</p>
                        </div>
                        <!-- Widget About -->
                        <aside class="col-md-6 col-sm-6 col-xs-12 ftr-widget widget_about">

                            <a href="index.html" title="Max Shop">P<span >ostnatal</span> C<span>are</span> C<span>enter</span></a>
                            <div class="info">
                                <p><i class="icon icon-Pointer"></i>106台北市大安區復興南路一段390號 2樓</p>
                                <p><i class="icon icon-Phone2"></i><a href="tel:(11)1234567890" title="Phone" class="phone">(02) 6631 6666</a></p>
                                <p><i class="icon icon-Imbox"></i><a href="mailto:info@maxshop.com" title="info@maxshop.com">eeit98team05@outlook.com</a></p>
                            </div>

                        </aside>
                        <!-- Widget About /- -->
                        <!-- Widget Newsletter -->
                        <form action="#" method="post" name="contact-form" class="col-md-6 col-sm-6 col-xs-12" id="main-contact-form ">
                            <div class="form-group">
                                <input type="email" required="" placeholder="Email" class="form-control" name="email">
                            </div>
                            <div class="form-group">
                                <textarea required="" placeholder="Message" rows="8" class="form-control" name="message"></textarea>
                            </div>
                            <button class="btn btn-default form-control footer-send " type="button"><i class="fa fa-paper-plane-o"></i> 送出</button>
                        </form>
                        <div class="copyright-section">
                            <div class="coyright-content">
                                <p>© PCC. all rights reserved</p>
                            </div>
                            <ul>
                                <li><a href="#" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#" title="Twitter"><i class="fa fa-twitter"></i></a></li>

                            </ul>
                        </div>
                        <!-- Widget Newsletter /- -->
                    </div>
                </div>
                <!-- Container /- -->
		</footer><!-- Footer Main 1 -->

	</div>
	
        <!-- JQuery v1.12.4 -->
        <script src="../js/jquery.min.js"></script>

        <!-- Library - Js -->
        <script src="../libraies/lib.js"></script>
        <script src="../libraies/jquery.countdown.min.js"></script>

        <!-- RS5.0 Core JS Files -->
        <script type="text/javascript" src="../revolution/js/jquery.themepunch.tools.min.js"></script>
        <script type="text/javascript" src="../revolution/js/jquery.themepunch.revolution.min.js"></script>
        <script type="text/javascript" src="../revolution/js/extensoins/revolution.extension.video.min.js"></script>
        <script type="text/javascript" src="../revolution/js/extensoins/revolution.extension.slideanims.min.js"></script>
        <script type="text/javascript" src="../revolution/js/extensoins/revolution.extension.layeranimation.min.js"></script>
        <script type="text/javascript" src="../revolution/js/extensoins/revolution.extension.navigation.min.js"></script>
        <script type="text/javascript" src="../revolution/js/extensoins/revolution.extension.actions.min.js"></script>
	
	<!-- Library - Google Map API -->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDW40y4kdsjsz714OVTvrw7woVCpD8EbLE"></script>

        <!-- Library - Theme JS -->
        <script src="../js/functions.js"></script>
    
</body>
</html>
