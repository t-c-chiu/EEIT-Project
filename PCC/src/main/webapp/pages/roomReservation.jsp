<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" 
href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<title>PCC - Room</title>
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

<style>

.zoom {
    display: inline-block;
    overflow: hidden;   
    border: 1px solid gray;
}

.zoom img {
    -webkit-transition: all .2s ease;
    -ms-transition: all .2s ease;
    transition: all .2s ease;    
    vertical-align: middle;
}

.zoom img:hover {
    -webkit-transform:scale(1.5); /* Safari and Chrome */
    -ms-transform:scale(1.5); /* IE 9 */
    transform:scale(1.5);
    cursor:pointer
}

#allForm {
display:none
}




</style>

<link rel="stylesheet" type="text/css" href="../css/login.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script>
	$(function() {
		var price
		var roomId
		var endDate
		var beginDate
		var totalPrice
		var unavailableDates
		var selectedDates
		var point
		var newPoint
		var usedPoint
	

		function showPrice() {
			totalPrice = (((endDate - beginDate) * price) / (86400000)-(usedPoint*50))
			
			newPoint=Math.round(point-usedPoint+(totalPrice/500))
			if(newPoint<0)
				{newPoint=0}
			
			$('#newPoint').empty().val(newPoint)
			
			if (!isNaN(totalPrice)) {
				if(totalPrice<0)
				{$('#totalPrice').empty().val(0)}
				else
				{$('#totalPrice').empty().val(totalPrice)}						
			}						
		}
		
				
		$('#beginDate').datepicker({
			numberOfMonths : 2,
			minDate : 0,
			beforeShowDay : unavailable,
			dateFormat : "yy/mm/dd",
			onSelect : function(selected) {
// 				$("#endDate").datepicker("option", "minDate", selected)
				beginDate = $('#beginDate').datepicker('getDate');
				showPrice()
			}
		});

		$('#endDate').datepicker({
			numberOfMonths : 2,
			minDate : 0,
			beforeShowDay : unavailable,
			dateFormat : "yy/mm/dd",
			onSelect : function(selected) {
// 				$("#beginDate").datepicker("option", "maxDate", selected)
				endDate = $(this).datepicker('getDate');
				showPrice()
			}
		});

		$(".image").click(function() {
			unavailableDates=[]
            roomId=$(this).attr("id")
            price = $(this).attr("alt")
			$("#roomId").empty().val(roomId)
			showPrice()
			$("#allForm").css('display','block')
			
			$.get('${pageContext.request.contextPath}/showByRoomId.room','roomId='+roomId,function(data){
				$.each(data,function(i,item){
					
					var endDateTemp = data[i].endDate;
					var beginDateTemp =data[i].beginDate;
							
			        for (var d = new Date(beginDateTemp);d <= new Date(endDateTemp);d.setDate(d.getDate() + 1)) 
			        {unavailableDates.push($.datepicker.formatDate('yy/m/d', d));	
			        }				    				
				})							
			})					
		});
		
		$('#usedPoint').change(function(){
			usedPoint=$(this).val()
			showPrice()
		})
		
		$("button").click(function(){			
			$.get('${pageContext.request.contextPath}/getMemberbyId.room',function(data){
				point=data.point
				usedPoint=data.point
				$("#name").empty().val(data.name)
				$("#email").empty().val(data.email)
			    $("#phone").empty().val(data.phone)
				$("#usedPoint").empty().val(point)
				showPrice()
			})
	
		
		})
		
		function unavailable(date) {
			dmy = date.getFullYear() + "/" + (date.getMonth() + 1) + "/"
					+ date.getDate();
			if ($.inArray(dmy, unavailableDates) == -1) {
				return [ true, "" ];
			} else {
				return [ false, "", "Unavailable" ];
			}
		}
		
		$('#commit').click(function(){
			$(".content").empty()
			selectedDates=[]
			
			var isSubmit=true;
			var name=$('#name').val();
			var email=$('#email').val();
			var phone=$('#phone').val();
			var begin=$('#beginDate').val();
			var end=$('#endDate').val();
			var usedPoint=$('#usedPoint').val()
			var Id=$('#roomId').val();
			var Price=$('#totalPrice').val();
	
												
			if(name.length==0){				
				$('#nameSpan').text(" 入住人不可為空")
				isSubmit = false;
			}
			
			if(email.length==0){
				$('#emailSpan').text(" email不可為空")
				isSubmit = false;
			}
			
			if(phone.length==0){
				$('#phoneSpan').text(" 電話不可為空")
				isSubmit = false;
			}
			
			if(begin.length==0){
				$('#beginSpan').text(" 入住日不可為空")
				isSubmit = false;
			}
			
			if(end.length==0){
				$('#endSpan').text(" 退房日不可為空")
				isSubmit = false;
			}
						
			if(usedPoint>point){
				$('#pointSpan').text(" 無效點數")
				isSubmit = false;				
			}
			
			if(Id.length==0||Price.length==0){

				isSubmit = false;	
			}
			
			for (var d = new Date(begin);d <= new Date(end);d.setDate(d.getDate() + 1)) 
		     {selectedDates.push($.datepicker.formatDate('yy/m/d', d));	
		       }
			var diff = $(unavailableDates).not(selectedDates).get();

			if(diff.length<unavailableDates.length){
				$('#beginSpan').text(" 無效日期")
				$('#endSpan').text(" 無效日期")
				isSubmit = false;	
			}
	
			return isSubmit;			
		})
				
		
	});
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
			<%@ include file="header.jsp" %>
		<!-- Header /- -->
		<!--	內容開始	-->
		<main> <!-- Page Banner -->

		<div class="page-banner container-fluid no-padding">
			<!-- Container -->
			<div class="container">
				<div class="banner-content">
					<h3>預約訂房</h3>
					<p>our vision is to be Earth's most customer centric company</p>
				</div>
				<ol class="breadcrumb">
					<li><a href="../index.html" title="Home">首頁</a></li>
					<li class="active">預約訂房</li>
				</ol>
			</div>
			<!-- Container /- -->
			

		</div>
		<!-- Page Banner /- --> <!-- Clients --> <!-- Container --> 
		
	
		<div class="container">
				<!-- Content Area -->
			            <c:forEach var="room" items="${listOfRooms}">		
				        <div class="content-area blog-section col-md-8 col-sm-8 col-xs-12">
				
					    <div class="type-post">
						<div class="col-md-5 col-sm-12 col-xs-12 no-padding entry-cover">
						<div class="zoom">
						<img src="<c:url value="../images/room/${room.roomImage}.jpg"/>"
							 class="image" alt="${room.price}" id="${room.roomId}">
						</div>
						</div>
						
						<div class="col-md-7 col-sm-12 col-xs-12 blog-content">
						<h3 class="entry-title">${room.roomId}</h3>
						<div class="entry-meta">
						<span class="post-like">房型 ${room.roomType}</span> 
						<span class="post-admin">房價 ${room.price}</span>
						</div>
							
						<div class="entry-content">
						<p>The weather started getting rough - the tiny ship was
						tossed. If not for the courage of the fearless If not for the
						courage of the Minnow would be lost.</p>								
						</div>
						
						</div>
					    </div>
				        </div>
				        </c:forEach>
		</div>
			

		
		<div id="allForm" class="container-fluid no-left-padding no-right-padding woocommerce-checkout">
			<!-- Container -->
			<div class="container">

				<!-- Billing -->
				
				<div class="checkout-form">
         
					<div class="col-md-12 col-sm-12 col-xs-12">
					    <div>						
							<h3>訂房填表</h3>						
						</div>
						
					<button>一鍵帶入</button>
						<form id="myform" action="<c:url value="/reserve.room"/>" method="post">
							<div class="billing-field">
						
								<div class="col-md-4 form-group">
									<label>入住人<span style="color:red" class="content" id="nameSpan"></span></label> <input class="form-control" type="text"
										name="name" id="name" >
								</div>
								<div class="col-md-4 form-group">
									<label>email<span style="color:red" class="content" id="emailSpan"></span></label> <input class="form-control" type="text"
										name="email" id="email">
								</div>
								<div class="col-md-4 form-group">
									<label>電話<span style="color:red" class="content" id="phoneSpan"></span></label> <input class="form-control" type="text"
										name="phone" id="phone">
								</div>

								<div class="col-md-4 form-group">
									<label>房間ID(暫)</label> <input class="form-control" type="text"
										name="roomId" id="roomId" readonly="readonly">
								</div>
								<div class="col-md-4 form-group">
									<label>入住日<span style="color:red" class="content" id="beginSpan"></span></label> <input class="form-control" type="text"
										name="beginDate" id="beginDate">
								</div>
								<div class="col-md-4 form-group">
									<label>退房日<span style="color:red" class="content" id="endSpan"></span></label> <input class="form-control" type="text"
										name="endDate" id="endDate">
								</div>
								
								<div class="col-md-4 form-group">
									<label>使用點數(一點折抵50)<span style="color:red" class="content" id="pointSpan"></span></label> <input class="form-control" type="text"
										name="usedPoint" id="usedPoint">
								</div>
																
								<div class="col-md-4 form-group">
									<label>總價</label> <input class="form-control" type="text"
										name="totalPrice" id="totalPrice" readonly="readonly">
								</div>
								<c:if test="${!empty member}">							
								<div class="col-md-4 form-group">
									<label>&#160;</label> <input class="form-control" type="submit"
										id="commit" name="RoomReservation" value="送出訂單">
								</div>
								</c:if>
					            <input name="newPoint" id="newPoint" type="hidden">
					   
	
							
								
							</div>
						</form>
					</div>
					

				</div>
				<!-- Billing /- -->		
			</div>
			
									
			<!-- Container /- -->
		</div>
		<!-- Content Area /- --> <!-- Clients /- --> </main>
		<!--	內容結束	-->
		<!-- Footer Main 1 -->
		<%@ include file="footer.jsp" %>
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

