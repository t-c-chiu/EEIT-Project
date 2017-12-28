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
<!-- <link href="../revolution/fonts/fontawesome-all.css"> -->  
 
<link rel="stylesheet" type="text/css" href="../css/login.css"> 
	
	<script src="<c:url value="/ckeditor/ckeditor.js"/>"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script>
		$(function(){
			$('#topicButton').click(function(){
				var topic = $('#filter').val();
				if(topic.trim().length == 0){
					$('#searchError').text('請輸入搜尋條件');
					$('#filter').val('').focus();
				}else{
					$('#topicForm').submit();
				}
			})
				
			$('#postButton').click(function(){
				var topic = $('#topic').val();
				var contents = CKEDITOR.instances.contents.getData();
				var isSubmit = true;
				if(topic.trim().length == 0){
					$('#topicSpan').text('請輸入主題');
					isSubmit = false;
				}else{
					$('#topicSpan').text('');
				}
				if(contents.length == 0){
					$('#contentsSpan').text('請輸入內容');
					isSubmit = false;
				}else{
					$('#contentsSpan').text('');
				}
				if(isSubmit){
					$('#postForm').submit();
				}
			})
			
			$('#postClick').click(function(){

				$.get('${pageContext.request.contextPath}/isOKtoPost.forum',function(data){
					
					if('OK' != data){
						alert(data);
						return;
					}
					
					$('#forumClick').removeClass();
					$('#postClick').addClass('active');
					$('#articlesArea').css('display','none');
					$('#postArea').css('display','block');
					$('#forumTitle').text('發表文章');
				})
			})
			
			$('#forumClick').click(function(){
				$('#postClick').removeClass();
				$(this).addClass('active');
				$('#postArea').css('display','none');
				$('#articlesArea').css('display','block');
				$('#forumTitle').text('文章/討論');
			})
			
			$('#cancelPost').click(function(){
				$('#postClick').removeClass();
				$('#forumClick').addClass('active');
				$('#postArea').css('display','none');
				$('#articlesArea').css('display','block');
				$('#forumTitle').text('文章/討論');
			})
		})
	</script>
</head>
<body data-offset="200" data-spy="scroll" data-target=".ow-navigation">
	<div class="main-container">
		
<%@ include file="header.jsp"%>

<!--	內容開始	-->		
		<main>
			<!-- Page Banner -->
			<div class="page-banner container-fluid no-padding" style="height:100px;">
				<!-- Container -->
				<div class="container">
					<div class="banner-content">
						<h3 id="forumTitle">文章/討論</h3>
					</div>
					<ol class="breadcrumb" style="cursor:pointer;">
						<li><a href="../index.jsp" title="Home">首頁</a></li>							
						<li id="forumClick" class="active">文章/討論</li>
						<li id="postClick">發表文章</li>
					</ol>
				</div>
			</div><!-- Page Banner /- -->
			
			<!-- Container -->
			<div class="container">
				<!-- Content Area -->
				<div class="content-area blog-section col-md-8 col-sm-8 col-xs-12">
			<div id="postArea" style="display:none;">
				<form id="postForm" action="<c:url value="/post.forum"/>" method="post" enctype="multipart/form-data">
					文章標題　<input type="text" name="topic" id="topic"/><span id="topicSpan"></span><br><br>
					主題分類　<select name="category">
								<option value="懷孕討論">懷孕討論</option>
								<option value="育兒討論">育兒討論</option>
								<option value="心情分享">心情分享</option>
							</select> <br><br>
					內容　<textarea name="contents" id="contents"></textarea><span id="contentsSpan"></span><br>
						<script>
							CKEDITOR.replace("contents", {
								width : 700,
								height : 300
							});
						</script>
				</form>
						<input id="postButton" type="button" value="發文"/>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input id="cancelPost" type="button" value="取消"/>
			</div>
			<div style="height:800px;overflow:hidden">
				<div id="articlesArea" style="height:100%;width:770px;overflow-y:auto;overflow-x:hidden;">
				<c:forEach var="article" items="${listOfPostArticles}">
					<div class="type-post">
						<div style="width:100%;" class="col-md-7 col-sm-12 col-xs-12 blog-content">
							<h3 class="entry-title">${article.topic}</h3>
							<span>主題分類&nbsp;:&nbsp;${article.category}</span>
							<span style="float:right;">發文時間&nbsp;:&nbsp;<fmt:formatDate value="${article.date}" pattern="yyyy-MM-dd HH:mm" /></span>
							<div class="entry-meta"> 
								<span class="post-like"><i class="fa fa-heart-o"></i>${article.likes} Likes</span>
								<span class="post-admin"><i class="fa fa-user"></i>${article.memberId}</span>
							</div>
							<div class="entry-content">
								<a href="<c:url value="/showDetial.forum?messageId=${article.messageId}" />" title="Read More" class="read-more">閱讀本文<i class="fa fa-long-arrow-right"></i></a>
							</div>
						</div>
					</div>
				</c:forEach>
				</div>
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

<%@ include file="footer.jsp"%>

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
	
