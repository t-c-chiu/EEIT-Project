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

.googleMap:hover{
 cursor:pointer
}


.dlg-no-close .ui-dialog-titlebar-close {display: none;} 



</style>

<link rel="stylesheet" type="text/css" href="../css/login.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script async defer
src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDYpbCt__aSkFOPc8En0xCzF6G8S_hD1Yg">
</script>
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
		var plusPoint
	
		function showPrice() {
			totalPrice = (((endDate - beginDate) * price) / (86400000)-(usedPoint*50))
			plusPoint =Math.round(totalPrice/500)
			
			newPoint=(point-usedPoint+plusPoint)
			if(newPoint<0)
				{newPoint=0}
			
			$('#newPoint').empty().val(newPoint)
							
			if (!isNaN(totalPrice)&&!isNaN(newPoint)) {
				if(totalPrice<0)
				{$('#totalPrice').empty().val(0)
				 $('#showPlus').empty().val(0)
				 $('#showNew').empty().val(0)
				 }
				 
				else
				{$('#totalPrice').empty().val(totalPrice)
				 $('#showPlus').empty().val(plusPoint)
				 $('#showNew').empty().val(newPoint)
				}						
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

		$("body").on('click','.image',function() {
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
			
			$('#showUse').empty().val(usedPoint)
		})
		
		$("#formButton").click(function(){			
			$.get('${pageContext.request.contextPath}/getMemberbyId.room',function(data){
				point=data.point
				usedPoint=data.point
				$("#name").empty().val(data.name)
				$("#email").empty().val(data.email)
			    $("#phone").empty().val(data.phone)
				$("#usedPoint").empty().val(point)
				$('#showUse').empty().val(point)
				showPrice()
	
			})
											
		})
		
		$("#orderByP").click(function(){
			var order=$('#order').val()
			alert(order)
			
			$.get('${pageContext.request.contextPath}/getRoombyOrder.room','order='+order,function(data){				
				create(data)									
			})												
		})
		
		function create(data){
			var div1=$('<div></div>').addClass("container")
			$('#main').empty().append(div1)
			$.each(data,function(i,room){
					
			var div2=$('<div></div>').addClass("content-area blog-section col-md-8 col-sm-8 col-xs-12")
			var div3=$('<div></div>').addClass("type-post")
			var div4=$('<div></div>').addClass("col-md-5 col-sm-12 col-xs-12 no-padding entry-cover")
			var div5=$('<div></div>').addClass("zoom")
			var img=$('<img></img>').attr('src','/PCC/images/room/'+room.roomImage+'.jpg')
			                        .addClass("image")
			                        .attr('id',room.roomId)
			                        .attr('alt',room.price)
					
			var div6=$('<div></div>').addClass("col-md-7 col-sm-12 col-xs-12 blog-content")
			var h3=$('<h3></h3>').addClass("entry-title").text(room.roomName)
			
			var div7=$('<div></div>').addClass("entry-meta")
			var img2=$('<img></img>').addClass("googleMap")
									 .attr('alt',room.address)
									 .attr('width',"120px")
									 .attr('src','/PCC/images/room/googleMap.png')
			
			var span1=$('<span></span>').addClass("post-like")
			var span2=$('<span></span>').addClass("post-admin").text('房價 '+room.price)
			var div8=$('<div></div>').addClass("entry-content")
			var p1=$('<p></p>').text(room.info)
			
			span1.append(img2)
			div5.append(img)
			div4.append(div5)		
			div7.append([span1,span2])
			div8.append(p1)				
			div6.append([h3,div7,div8])		
			div3.append([div4,div6])						
			div2.append(div3)
			div1.append(div2)
			})	
		}
				
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
				
		$('#range').change(function(){
			var price=$('#rangeValue').empty().val($(this).val()).val()
				
			$.get('${pageContext.request.contextPath}/getRoombyPrice.room','price='+price,function(data){
				create(data)
			})
			
		})
		
		
			$("body").on('click','.googleMap',function(){		
            var point=$(this).attr("alt")
				
			var geocoder = new google.maps.Geocoder();
			geocoder.geocode({
			address : point
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
			var marker = new google.maps.Marker({
				position : dest,
				map : map
			});						
		}
	})

            $("#dialog-confirm").dialog({ 
              resizable: true,
                height: $(window).height() * 0.5,//dialog視窗高度
                width: $(window).width() * 0.5,
                modal: true,
                dialogClass: "dlg-no-close",
                buttons: {
                                          關閉: function () {
                     $(this).dialog("close");
                 }
             }      
            });
})
	
                $(window).resize(function () {
                    var wWidth = $(window).width();
                    var dWidth = wWidth * 0.9;
                    var wHeight = $(window).height();
                    var dHeight = wHeight * 0.9;
                    $("#dialog-confirm").dialog("option", "width", dWidth);
                    $("#dialog-confirm").dialog("option", "height", dHeight);
                });

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
		

			<div id="dialog-confirm" style="display:none;background-color:activeborder;">
            <div id="map" style="height: 500px; width: 1000px;"></div>	
            </div>    
		
		
		<div class="container">
				<div class="col-md-4 col-sm-4 col-xs-12 widget-area">
					<!-- Widget Search -->
						<aside class="widget widget_categories">
						
							<h3 class="widget-title">您的搜尋條件</h3>
							<ul>
							<li>地區：${area}</li>
						    <li>房型：${roomType}</li>
					
						    <li>每晚最低價格：<input id="range" type="range" min="500" max="4000" step="500">
						        NTD：<input id="rangeValue" type="text" readonly="readonly" style="border:none" placeholder="2500" ></li>																	    						    
<!-- 							<li><input type="text" id="order">&#160;&#160;<button id="orderByP">調順序</button></li> -->				
							</ul>
						</aside><!-- Widget Categories /-  -->
						
						<aside class="widget widget_categories">
						
							<h3 class="widget-title">點數資訊</h3>
							<ul>
							<li>持有點數：${member.point}</li>
						    <li>使用點數：<input id="showUse" type="text" readonly="readonly"  style="border:none"></li>						
						    <li>增加點數：<input id="showPlus" type="text" readonly="readonly"  style="border:none"></li>
						    <li>合計點數：<input id="showNew" type="text" readonly="readonly"  style="border:none"></li>	
				
							</ul>
										
						</aside><!-- Widget Categories /-  -->
						
						
				</div><!-- Widget Area /- -->
		
		<div id="main" class="col-md-8">
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
						<h3 class="entry-title">${room.roomName}</h3>
						<div class="entry-meta">
<%-- 						<span class="post-like">${room.address}</span> --%>
						<span class="post-like"><img class="googleMap" alt="${room.address}" width="120px" src="<c:url value="../images/room/googleMap.png"/>">
						</span>
						<span class="post-admin">房價 ${room.price}</span>
						</div>
							
						<div class="entry-content">
                        <p>${room.info}</p> 
	  	
                        
						</div>													
						</div>
					    </div>
				        </div>
				        
				        </c:forEach>
	    </div>			        			        			        
		</div>
						
		</div>
						
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
						
					<button id="formButton">一鍵帶入</button>
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
									<label>總價(折扣後每500得一點)</label> <input class="form-control" type="text"
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


	<!-- Library - Theme JS -->
	<script src="../js/functions.js"></script>

</body>
</html>

