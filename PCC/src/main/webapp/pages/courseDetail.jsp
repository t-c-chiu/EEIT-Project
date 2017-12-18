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
<style>
	table{
		width: 100%;
		margin: auto;
		text-align: center;
	}
	
	td{
		padding: 10px;
	}
	
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(function(){
		$('#routeSelect').change(calcRoute);
		
		$('#beStudentBtn').click(function(){
			$.post('${pageContext.request.contextPath}/beStudent.clazz',function(data){
				alert(data);
				if('報名成功' == data && $('#peopleLeft')){
					var peopleLeft = parseInt($('#peopleLeft').text());
					if(peopleLeft > 1){
						$('#peopleLeft').empty().text(peopleLeft - 1);
					}else{
						$('#courseStatus').empty().text('即將開課');
					}
				}
			})
		})
	})
	
	var directionsDisplay;
	function initMap() {
		directionsDisplay = new google.maps.DirectionsRenderer();
		var geocoder = new google.maps.Geocoder();
		geocoder.geocode({
			address : $('#loc').text()
		}, function(results, status) {
			if (status == 'OK') {
				var dest = {
					lat : results[0].geometry.location.lat(),
					lng : results[0].geometry.location.lng()
				};
				var map = new google.maps.Map(document.getElementById('map'), {
					zoom : 16,
					center : dest
				});
				directionsDisplay.setMap(map);
				var marker = new google.maps.Marker({
					position : dest,
					map : map
				});
			}
		})
	}
	
	function calcRoute(){
		var mode = $(this).val();
		if(mode == 'default')
			return;
		var directionsService = new google.maps.DirectionsService();
		var start = '${member.address}';
		var request = {
			    origin: start,
			    destination: $('#loc').text(),
			    travelMode: mode
		};
		directionsService.route(request, function(result, status) {
		    if (status == 'OK') {
		      	directionsDisplay.setDirections(result);
		      	$('#routeMsg').text('從您的住家' + $('#routeSelect').find(":selected").text() + '到上課地點需時約 '
		      						+ result.routes[0].legs[0].duration.text);
		    }
		});
	}
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
		<%@ include file="header.jsp"%>

		<main> <!-- Page Banner -->

		<div class="clients container-fluid">
			<div class="container">
				<div style="float: left; width: 50%;">
					<table class="clazzDetail">
						<tr>
							<td><img style="height: 200px;"
								src="<c:url value="/images/clazz/${clazzDetail.classId}.jpg"/>"></td>
						</tr>									
						<tr>
							<td style="font-size: 28px;">${clazzDetail.courseName}</td>
						</tr>
						<tr>
							<td>${clazzDetail.introduction}</td>
						</tr>
						<tr>
						<c:choose>
							<c:when test="${clazzDetail.status == 0}">
							<td id="courseStatus">課程狀態:&nbsp;&nbsp;還缺&nbsp;<span id="peopleLeft">${clazzDetail.numberOfStudents - clazzDetail.currentStudents}</span>&nbsp;人即可開課</td>
							</c:when>
							<c:otherwise>
							<td>課程狀態:&nbsp;&nbsp;即將開課</td>
							</c:otherwise>
						</c:choose>
						</tr>
						<tr>
							<td>預計開課時間:&nbsp;&nbsp;<fmt:formatDate
									value="${clazzDetail.endDate}" pattern="yyyy/MM/dd hh:mm" /></td>
						</tr>
						<tr>
							<td>課程價位:&nbsp;&nbsp;${clazzDetail.price}&nbsp;元</td>
						</tr>
						<tr>
							<td><button id="beStudentBtn">我要報名本課程</button></td>
						</tr>
					</table>
					
				</div>
				<div style="float: right; width: 45%;">
					<h3>
						上課地點:&nbsp;&nbsp;<span id="loc">${clazzDetail.location}</span>
					</h3>
					<br>
					<div id="map" style="height: 450px; width: 600px;"></div>
					<script async defer
						src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB6xPewLqeX388Ecohy3LHWMWN5GtxjNZ4&callback=initMap">
					</script>
					<br>
					<select id="routeSelect">
						<option value="default">選擇抵達方式</option>
						<option value="DRIVING">開車</option>
						<option value="WALKING">走路</option>
						<option value="TRANSIT">搭乘大眾運輸</option>
					</select><br><br>
					<span id="routeMsg" style="font-size:18px;"></span>
				</div>
			</div>
		</div>
		</main>

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
	<!-- 	<script -->
	<!-- 		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDW40y4kdsjsz714OVTvrw7woVCpD8EbLE"></script> -->

	<!-- Library - Theme JS -->
	<script src="../js/functions.js"></script>

</body>
</html>

