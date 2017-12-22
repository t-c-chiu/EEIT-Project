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
				var author = $('<span></span>').html('作者&nbsp;:&nbsp;'+data.memberId+'&nbsp;&nbsp;&nbsp;&nbsp;');
				var time = $('<span></span>').html('留言時間&nbsp;:&nbsp;'+data.date);
				$('#repliesArea').append(author,time,'<br>',data.contents,'<hr>');
				var repliesCount = parseInt($('#repliesCount').text());
				$('#repliesCount').empty().text(repliesCount + 1);
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
		
<%@ include file="header.jsp"%>

<!--	內容開始	-->		
		<main>
			<!-- Container -->
			<div class="" style="height:100px;"></div>
			<div class="container">
				<!-- Content Area -->
			<div class="content-area blog-section col-md-8 col-sm-8 col-xs-12">
			<h1>${detail.post.topic}</h1>
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
		文章收藏數&nbsp;:&nbsp;<span id="likesNum">${detail.post.likes}</span>	<hr>
		<c:if test="${member.memberId eq detail.post.memberId}">
				<button id="modifyButton">編輯內文</button>&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="deleteButton">刪除文章</button>
		</c:if>
		<c:if test="${!(member.memberId eq detail.post.memberId) && !empty member}">
			<button id="collect"></button>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<button id="report">檢舉本文</button>
		</c:if>
	
				</div><!-- Content Area /- -->
				<!-- Widget Area -->
				<div class="col-md-4 col-sm-4 col-xs-12 widget-area">
					<!-- Widget Search -->
					<aside class="widget widget_search">
						
					<h2><span id="repliesCount">${detail.repliesCount}</span>筆留言</h2>
				<div style="height:500px;overflow:hidden;">
					<div id="repliesArea" style="height:100%;width:380px;overflow-y:auto;overflow-x:hidden;">
						<c:forEach var="replyArticle" items="${detail.reply}">
							<span>作者&nbsp;:&nbsp;${replyArticle.memberId}</span>&nbsp;&nbsp;&nbsp;&nbsp;
							<span>留言時間&nbsp;:&nbsp;<fmt:formatDate value="${replyArticle.date}" pattern="yyyy-MM-dd HH:mm" /></span>
							<br>${replyArticle.contents}<hr>
						</c:forEach>
					</div>
				</div>
					<br><button id="replyButton">我要留言</button>
					</aside><!-- Widget Search /- -->
					<!-- Widget Categories -->
					<aside class="widget widget_categories">
					
					<div>
						<form id="replyForm" action="<c:url value="/reply.forum"/>" method="post">
							<input type="hidden" name="messageId" value="${detail.post.messageId}"/>
							<input id="replyContents" type="hidden" name="contents"/><br>
<!-- 							<input id="replyButton" type="button" value="我要留言"/> -->
						</form>
					</div>
					
					</aside><!-- Widget Categories /-  -->
				</div><!-- Widget Area /- -->
			</div><!-- Container /- -->
		</main>
<!--	內容結束	-->		
		<!-- Footer Main 1 -->
<%@ include file="footer.jsp" %>

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
