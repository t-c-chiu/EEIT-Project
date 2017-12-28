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
<title>PCC - Course</title>
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
<link rel="stylesheet" type="text/css" href="../css/login.css">
<link rel="stylesheet" type="text/css" href="../css/course.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	var startDates = [];
	
	function showTime(){
		$('.days').each(function(index){
			var today = new Date();
			var courseDay = new Date(Date.parse(startDates[index]));
			var diff = (courseDay.getTime() - today.getTime()) / 1000;
			$(this).text(Math.floor(diff / (24 * 3600)) + ' 天 '
						+ Math.floor((diff % (24 * 3600)) / 3600) + ' 小時 '
						+ Math.floor((diff % 3600) / (60)) + ' 分 '
						+ Math.floor(diff % 60) + ' 秒');
		})
	}

	$(function(){
		$('.endDate').each(function(){
			startDates.push($(this).text());
		})
		
		setInterval(showTime,1000);
		
		$('.courseImg').mouseover(function(){
			$(this).css('height','180px');
		}).mouseout(function(){
			$(this).css('height','150px');
		})
		
		$('#categoryOpt').change(function(){
			var category =$(this).val();
			if('default' == category)
				return;
			$.getJSON('/PCC/showByCategory.clazz','category='+category,function(clazzlist){
				var h2 = $('<h2></h2>').text(category+'的課程有:');
				$('#categoryClass').empty().append('<br>',h2);
				$.each(clazzlist,function(i,clazz){
					var div = $('<div></div>').css('display','inline-block').css({width:'292.5px',height:'225px',textAlign:'center'});
					var strong = $('<strong></strong>').text(clazz.courseName);
					var a = $('<a></a>').attr('href','/PCC/clazzDetail.clazz?detail='+clazz.classId);
					var img = $('<img></img>').css('height','150px').attr('src','/PCC/images/clazz/' + clazz.classId + '.jpg');
					var price = $('<span></span>').text('價格:  '+clazz.price+'元');
					a.append(img);
					div.append(strong,'<br><br>',a,'<br><br>',price);
					$('#categoryClass').append(div);
				})
			})
		})
	})
</script>
</head>

<body data-offset="200" data-spy="scroll" data-target=".ow-navigation">
	<div class="main-container">
		<!-- Header -->
<%@ include file="header.jsp"%>
		<!-- Header /- -->
		
		<!--	內容開始	-->
		<main> <!-- Page Banner -->
		<!-- Page Banner /- --> <!-- Clients -->
	
		<div class="clients container-fluid">
			<!-- Container -->
			<div class="container">
				<div class="container-fluid no-padding" style="height:100px;">
				<h4>依分類過濾</h4>
					<div id="classCategory">
					<select id="categoryOpt">
							<option value="default">選擇分類</option>
						<c:forEach var="category" items="${clazzInfo.listOfCategory}">
							<option value="${category}">${category}</option>
						</c:forEach>
					</select>
					</div>
				</div>
				<div id="categoryClass"></div><br>
				<h2>最新上架課程:</h2>
				<div class="clients-carousel">
					<c:forEach var="clazz" items="${clazzInfo.listOfClazz}">
						<div class="col-md-12 item">
							<h5>${clazz.category}</h5>
							<strong>${clazz.courseName}</strong>
							<a href="<c:url value="/clazzDetail.clazz?detail=${clazz.classId}"/>">
							<img class="courseImg" style="height:150px;" src="<c:url value="/images/clazz/${clazz.classId}.jpg"/>"/></a>
							<span>上架日期:</span>&nbsp;&nbsp;<span><fmt:formatDate value="${clazz.startDate}" pattern="yyyy/MM/dd"/></span><br>
							<span>開課日期:</span>&nbsp;&nbsp;<span class="endDate"><fmt:formatDate value="${clazz.endDate}" pattern="yyyy/MM/dd hh:mm"/></span><br>
							<span>距離開課還剩:</span>&nbsp;&nbsp;<span class="days"></span>
						</div>
					</c:forEach>
				</div>
				<h2>即將開課:</h2>
				<div class="clients-carousel">
					<c:forEach var="clazz" items="${clazzInfo.listOfClosestCourse}">
						<div class="col-md-12 item">
							<h5>${clazz.category}</h5>
							<strong>${clazz.courseName}</strong>
							<a href="<c:url value="/clazzDetail.clazz?detail=${clazz.classId}"/>">
							<img title="${clazz.courseName}" class="courseImg" style="height:150px;" src="<c:url value="/images/clazz/${clazz.classId}.jpg"/>"/></a>
							<span>報名學員人數 :</span><span>&nbsp;&nbsp;${clazz.currentStudents}</span><br>
							<span>開課所需人數:</span><span>&nbsp;&nbsp;${clazz.numberOfStudents}</span><br>
							<span>達成百分比:</span>&nbsp;&nbsp;<span><fmt:formatNumber type = "percent" maxFractionDigits = "2" value = "${clazz.currentStudents / clazz.numberOfStudents}"/></span>
						</div>
					</c:forEach>
				</div>
			</div>
			<!-- Container /- -->
		</div>
		<!-- Clients /- --> </main>
		<!--	內容結束	-->
		
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

