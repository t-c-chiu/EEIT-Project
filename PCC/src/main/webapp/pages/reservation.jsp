<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PCC - Reservation</title>
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
<link rel="stylesheet" type="text/css" href="../css/login.css">

<!-- fontawesome -->
<link href="../revolution/fonts/fontawesome-all.css">


<!-- jQuery CDN for login -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script type="text/javascript">

</script>

</head>

<body data-offset="200" data-spy="scroll" data-target=".ow-navigation">
	<div class="main-container">
		<!-- Header -->
		<%@ include file="header.jsp"%>
		<!-- Header /- -->
		
		<!--	內容開始	-->
		<main> <!-- Page Banner -->
		<div class="page-banner container-fluid no-padding">
			<!-- Container -->
			<div class="container">
				<div class="banner-content">
					<h3>線上預約</h3>
					<p>our vision is to be Earth's most customer centric company</p>
				</div>
				<ol class="breadcrumb">
					<li><a href="../index.html" title="Home">首頁</a></li>
					<li class="active">線上預約</li>
				</ol>
			</div>
			<!-- Container /- -->
		</div>
		<!-- Page Banner /- --> <!-- Checkout -->
		<div
			class="container-fluid no-left-padding no-right-padding woocommerce-checkout">
			<!-- Container -->
			<div class="container">

				<!-- Billing -->
				<div class="checkout-form">
					<form action="<c:url value="/submitReservationForm.match"/>" method="post">
						<table width="100%" border="0" cellspacing="1" cellpadding="5" bgcolor="#F19FAE">
              <tbody><tr>
                <td width="18%" height="30" align="center" bgcolor="#FAD6DB"><span class="color_name">※ </span> 申請者姓名</td>
                <td colspan="2" bgcolor="#FFFFFF" width="82%"><input type="text" name="name" id="name" style="width:100px;" class="borderall"></td>
              </tr>
              <tr>
                <td height="30" align="center" bgcolor="#FAD6DB"><span class="color_name">※ </span>手機</td>
                <td colspan="2" bgcolor="#FFFFFF"><input type="text" name="phone" id="phone" class="linbox borderall" style="width:150px;"></td>
              </tr>
              <tr>
                <td height="30" align="center" bgcolor="#FAD6DB"><span class="color_name">※ </span>預產期 </td>
                <td colspan="2" bgcolor="#FFFFFF"><input type="date" name="expectedday" id="dy" style="width:150px;" class="borderall">
<!--    年
                  <input type="text" name="dm" id="dm" style="width:30px;" class="borderall">
                  月
                  <input type="text" name="db" id="db" style="width:30px;" class="borderall">
                  日 --> </td>
              </tr>
              <tr>
                <td height="30" align="center" bgcolor="#FAD6DB"><span class="color_name">※ </span>生產方式</td>
                <td colspan="2" bgcolor="#FFFFFF"><input name="way" type="radio" id="status" value="自然產" checked="CHECKED" class="borderall">
                  自然產
                  <input type="radio" name="way" id="status" value="剖附產" class="borderall">
                  剖腹產　第
                  <select name="way" id="status_num" class="borderall">
                    <option value="第1胎">1</option>
                    <option value="第2胎">2</option>
                    <option value="第3胎">3</option>
                    <option value="第4胎">4</option>
                    <option value="第5胎">5</option>
                    <option value="第6胎">6</option>
                    <option value="第7胎">7</option>
                    <option value="第8胎">8</option>
                  </select>
                  胎</td>
              </tr>
              <tr>
                <td height="30" align="center" bgcolor="#FAD6DB"><span class="color_name">※ </span><span class="inportem">EMAIL</span></td>
                <td colspan="2" bgcolor="#FFFFFF"><input type="text" name="email" id="useremail" class="linbox borderall" style="width:240px;"></td>
              </tr>
              <tr>
                <td height="30" align="center" bgcolor="#FAD6DB"><span class="color_name">※ </span>實際服務地址</td>
                <td colspan="2" bgcolor="#FFFFFF"><input type="text" name="address" id="addr" class="linbox borderall" style="width:240px;"></td>
              </tr>
              <tr>
                <td height="30" rowspan="3" align="center" bgcolor="#FAD6DB"><span class="color_name">※ </span>坐月子需求<br>
                  (服務項目)</td>
                <td width="13%" height="30" align="center" bgcolor="#FFFFFF">
                  陪伴照顧</td>
                <td width="69%" bgcolor="#FFFFFF">(
                  <input type="checkbox" name="demand" id="accompany" value="嬰兒" class="borderall">
嬰兒/
<input type="checkbox" name="demand" id="accompany2" value="產婦" class="borderall">
產婦)</td>
              </tr>
              <tr>
                <td width="13%" height="30" align="center" bgcolor="#FFFFFF"> 膳食月子餐</td>
                <td bgcolor="#FFFFFF">(
                  <input type="checkbox" name="demand" id="food" value="葷食" class="borderall">
葷食/
<input type="checkbox" name="demand" id="food2" value="素食" class="borderall">
素食) 　</td>
              </tr>
              <tr>
                <td width="13%" height="30" align="center" bgcolor="#FFFFFF">須準備晚餐</td>
                <td bgcolor="#FFFFFF"><select name="demand" id="foodnum" class="borderall">
                  <option selected="selected" value="1">0</option>
                  <option value="1餐">1</option>
                  <option value="2餐">2</option>
                  <option value="3餐">3</option>
                  <option value="4餐">4</option>
                  <option value="5餐">5</option>
                  <option value="6餐">6</option>
                  <option value="7餐">7</option>
                  <option value="8餐">8</option>
                  <option value="9餐">9</option>
                  <option value="10餐">10</option>
                </select>
份</td>
              </tr>
              <tr>
                <td height="30" align="center" bgcolor="#FAD6DB"><span class="color_name">※ </span>房屋型態</td>
                <td colspan="2" bgcolor="#FFFFFF"><input name="house" type="radio" id="room" value="公寓" checked="CHECKED" class="borderall">
                  公寓
                  <input type="radio" name="house" id="room" value="透天" class="borderall">
                  透天
<!--                   <input type="radio" name="room" id="room" value="透天" class="borderall"> -->
<!--                   透天 -->
<!--                   <input type="text" name="floor" id="floor" style="width:50px;" class="borderall"> -->
<!--                   樓</td> -->
              </tr>
              <tr>
                <td height="30" align="center" bgcolor="#FAD6DB"><span class="color_name">※ </span>服務時間</td>
                <td colspan="2" bgcolor="#FFFFFF">服務天數：預計
                  <input type="text" name="time" id="service_days" style="width:50px;" class="borderall">
                  天<br>
              </td>
              </tr>           
              
            </tbody></table>
            <input type="submit" value="送出">
            
					</form>
				</div>
				<!-- Billing /- -->
			</div>
			<!-- Container /- -->
		</div>
		<!-- Checkout /- --> </main>
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

