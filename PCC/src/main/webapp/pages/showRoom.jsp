<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="google-signin-client_id" content="368506092635-g2qmv1vf4gu9tbs24d644k0kgqqg79kr.apps.googleusercontent.com">
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
<style>
.button-send{
	margin:0 3%;
	width:94%;
	height: 50px;
	letter-spacing: 1.54px;
	font-size:16px;
    color: #fff;
    border-radius: 0;
    background-color: #EB7C81;
}
</style>

<link href="../revolution/fonts/fontawesome-all.css">
<link rel="stylesheet" type="text/css" href="../css/login.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<script>

$(function() {
	keywords=[]	
	$('#area').autocomplete({
		source:keywords		
	})
	
	
$('#area').keyup(function(){
	var area=$('#area').val();
	keywords.length = 0
	
	$.get('${pageContext.request.contextPath}/getRoombyArea.room','area='+area,function(data){		
		$.each(data,function(i,area){
			console.log(area)
			keywords.push(area)	
		})			
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
		<!-- Page Banner /- --> <!-- Clients -->
			<div class="section-header">
					<h3>台北市全區均有PCC分館</h3>
					<h5>媽咪能在離家最近的地方享受坐月子的美好</h5>
					<img src="../images/section-seprator.png" alt="section-seprator" />
			</div>	
			
		<div class="clients container-fluid" >
			<!-- Container -->
			<div class="container">
				<div class="clients-carousel">
					<div class="col-md-12 item">					
						<a href="#" title="client"><img src="../images/room/1.jpg"
							alt="client-1" /></a>				
					</div>
					<div class="col-md-12 item">
						<a href="#" title="client"><img src="../images/room/2.jpg"
							alt="client-2" /></a>
					</div>
					<div class="col-md-12 item">
						<a href="#" title="client"><img src="../images/room/3.jpg"
							alt="client-3" /></a>
					</div>
					<div class="col-md-12 item">
						<a href="#" title="client"><img src="../images/room/4.jpg"
							alt="client-4" /></a>
					</div>
					<div class="col-md-12 item">
						<a href="#" title="client"><img src="../images/room/5.jpg"
							alt="client-5" /></a>
					</div>

					<div class="col-md-12 item">
						<a href="#" title="client"><img src="../images/room/6.jpg"
							alt="client-1" /></a>
					</div>
					<div class="col-md-12 item">
						<a href="#" title="client"><img src="../images/room/7.jpg"
							alt="client-2" /></a>
					</div>
					<div class="col-md-12 item">
						<a href="#" title="client"><img src="../images/room/8.jpg"
							alt="client-3" /></a>
					</div>
					<div class="col-md-12 item">
						<a href="#" title="client"><img src="../images/room/9.jpg"
							alt="client-4" /></a>
					</div>
					<div class="col-md-12 item">
						<a href="#" title="client"><img src="../images/room/10.jpg"
							alt="client-5" /></a>
					</div>
				</div>
			</div>
			<!-- Container /- -->
		</div>	
						
									
			<!-- Container /- -->
		</div>
		
		
		<div class="about-section container-fluid no-padding">
			<!-- Container -->
			<div class="container">
				<div class="col-md-6 col-sm-6 col-xs-6">
					<img src="../images/room/singleRoom.jpg" alt="about" />
				</div>
				<div class="col-md-6 col-sm-6 col-xs-6">
					<div class="about-content">
						<h3>
							新手媽咪的最佳選擇！<span>標準房</span>要讓每一位媽咪享受在家一般的溫暖與自在！
						</h3>
						<p>標準房住宿空間－客房設計簡約，提供免費 WiFi 和免費每日客房整理。均設有空調、平面電視和獨立衛浴。
						另提供書桌、拖鞋、免費盥洗用品和毛巾。免費提供電動吸乳器、獨立奶瓶消毒鍋、高級有機棉哺乳衣！
						房內附有緊急呼叫鈴系統，座機及無線話機獨立可控式冷暖空調</p>
						<p>標準房是性價比最高的選擇！媽咪在住房的同時也能感受到物超所值！</p>
						<ul>
							<li>3M極淨全效智慧型飲水機</li>
							<li>多媒體整合、40吋數位液晶電視</li>
							<li>全室採用門禁感應管理系統</li>
						</ul>
					</div>
	
				</div>
				</div>		
		<div class="about-section container-fluid no-padding">
		<!-- Container -->
			<div class="container">
				<div id="about2" class="col-md-6 col-sm-6 col-xs-6">
				<div class="about-content">
						<h3>
							想要一段難忘的坐月子經驗嗎？<span>貴賓房</span>提供渡假般的感受，讓媽咪與家人享受最寬廣舒適的空間！
						</h3>
						<p>貴賓房住宿空間－客房設計低調奢華，提供免費 WiFi 和免費每日客房整理。
						超五星雙人加大床墊，採用2000多個1.3線迷你獨立袋裝彈簧，遠紅外線天然環保棉氈，
						完美平衡床網，為睡眠提供最貼心的支撐。
						浴室附有暖風設備、高級沐浴盥洗組，TOTO免治馬桶、乾濕分離衛浴設備</p>
						<p>貴賓房讓每一位媽咪與家人都能有最難忘的坐月子回憶！</p>
						<ul>
							<li>獨立一對一可控式冷暖空調</li>
							<li>多媒體整合、56吋數位液晶電視</li>
							<li>獨立會客空間、全室採用門禁感應管理系統</li>
						</ul>
					</div>
				</div>
				<div class="col-md-6 col-sm-6 col-xs-6">
					<img src="../images/room/doubleRoom.jpg" alt="about" />
				</div>
				
		</div>
		<div class="container">
			<div class="goto-next">
				<a href="#about2"><i class="icon icon-Mouse bounce"></i></a>
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
							<h3>開始訂房</h3>						
						</div>
									
						<form action="<c:url value="/show.room"/>" method="get">
							<div class="billing-field">
						
								<div class="col-md-4 form-group">
									<label>地區<span style="color:red" class="content" id="areaSpan"></span></label><input class="form-control" type="text"
										name="area" id="area" >
								</div>
								
								<div class="col-md-4 form-group">
									<label>房型<span style="color:red" class="content" id="roomTypeSpan"></span></label> 
									<div class="select">
										<select class="form-control" name="roomType">										
											<option value="標準房">標準房</option>
											<option value="貴賓房">貴賓房</option>
										</select>
									</div>
								</div>
								
								
								<div class="col-md-4 form-group">
									<label>&#160;<span style="color:red" class="content"></span></label><input class="btn btn-default form-control button-send" type="submit"
										value="送出">
								</div>																
						</div>
						</form>
					</div>
					

				</div>
				<!-- Billing /- -->		
			</div>
			<!-- Container /- -->
		</div>
		<!-- About Section /- --> <!-- Category Section -->
			

			
			
			
		<!-- Clients /- --> </main>
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

