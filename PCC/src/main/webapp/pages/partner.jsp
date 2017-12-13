<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PCC - Partner</title>
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
</head>

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
		<%@ include file="header.jsp"%>
		<!-- Header /- -->
		
		<!--	內容開始	-->
		<main> <!-- Page Banner -->
		<div class="page-banner container-fluid no-padding">
			<!-- Container -->
			<div class="container">
				<div class="banner-content">
					<h3>文章/討論</h3>
					<p>our vision is to be Earth's most customer centric company</p>
				</div>
				<ol class="breadcrumb">
					<li><a href="../index.html" title="Home">首頁</a></li>
					<li class="active">文章/討論</li>
				</ol>
			</div>
			<!-- Container /- -->
		</div>
		<!-- Page Banner /- --> <!-- Latest Blog -->
		<div class="blog-section latest-blog container-fluid">
			<!-- Container -->
			<div class="container">
				<!-- Section Header -->
				<div class="section-header">
					<h3>Latest News</h3>
					<p>our vision is to be Earth's most customer centric company</p>
					<img src="../images/section-seprator.png" alt="section-seprator" />
				</div>
				<!-- Section Header /- -->
				

				<c:forEach var="servant" items="${servantList}">
				<div class="col-md-4 col-sm-6 col-xs-6">
					<div class="type-post">
						<div class="entry-cover">
							<a href="blog-post.html"><img src="../images/match/${servant[0]}.jpg"
								alt="blog"></a> <span class="post-date"><a href="#"><i
									class="fa fa-calendar-o"></i>July 20</a></span>
						</div>
						<div class="blog-content">
							<h3 class="entry-title">
								<a href="blog-post.html"
									title="new Collectios are imported In Our shop.">new
									Collectios are<span>imported</span> In Our shop.
								</a>
							</h3>
							<div class="entry-meta">
								<span class="post-like"><a href="#" title="224 Likes"><i
										class="fa fa-heart-o"></i>224 Likes</a></span> <span class="post-admin"><i
									class="fa fa-user"></i>服務員: <a href="#" title="Max"><!-- 姓名 -->${servant[6]}</a></span>
							</div>
							<div class="entry-content">
								<p><!-- 自我介紹 -->
								   ${servant[5]}
								</p>
								<a href="blog-post.html" title="Read More" class="read-more">Read
									More<i class="fa fa-long-arrow-right"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>

<!--
				<div class="col-md-4 col-sm-6 col-xs-6">
					<div class="type-post">
						<div class="entry-cover">
							<a href="blog-post.html"><img src="../images/blog-3.jpg"
								alt="blog"></a> <span class="post-date"><a href="#"><i
									class="fa fa-calendar-o"></i>march 14</a></span>
						</div>
						<div class="blog-content">
							<h3 class="entry-title">
								<a href="blog-post.html"
									title="buyers are saying it's good shop">buyers are saying
									it's <span>good shop</span>
								</a>
							</h3>
							<div class="entry-meta">
								<span class="post-like"><a href="#" title="150 Likes"><i
										class="fa fa-heart-o"></i>150 Likes</a></span> <span class="post-admin"><i
									class="fa fa-user"></i>Posted By <a href="#" title="Max">${servant[6]}</a></span>
							</div>
							<div class="entry-content">
								<p>The weather started getting rough - the tiny ship was
									tossed. If not for the courage of the fearless crew the Minnow
									would be lost.</p>
								<a href="blog-post.html" title="Read More" class="read-more">Read
									More<i class="fa fa-long-arrow-right"></i>
								</a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-4 col-sm-6 col-xs-6">
					<div class="type-post">
						<div class="entry-cover">
							<a href="blog-post.html"><img src="../images/blog-2.jpg"
								alt="blog"></a> <span class="post-date"><a href="#"><i
									class="fa fa-calendar-o"></i>june 26</a></span>
						</div>
						<div class="blog-content">
							<h3 class="entry-title">
								<a title="Best Solds in the this year was watches"
									href="blog-post.html">Best Solds in the this year was <span>watches</span></a>
							</h3>
							<div class="entry-meta">
								<span class="post-like"><a href="#" title="85 Likes"><i
										class="fa fa-heart-o"></i>85 Likes</a></span> <span class="post-admin"><i
									class="fa fa-user"></i>Posted By <a href="#" title="Max">Max</a></span>
							</div>
							<div class="entry-content">
								<p>The weather started getting rough - the tiny ship was
									tossed. If not for the courage of the fearless crew the Minnow
									would be lost.</p>
								<a href="blog-post.html" title="Read More" class="read-more">Read
									More<i class="fa fa-long-arrow-right"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Container /- -->
		</div>
		<!-- Latest Blog /- --> </main>
		<!--	內容結束	-->
		
		<!-- Footer Main 1 -->
		<%@ include file="footer.jsp"%>
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

