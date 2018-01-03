<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.HashMap, model.bean.Cart"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>我的購物車--PCC購物網</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PCC - Shop</title>
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

<!-- 購物車表單的下載 -->

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!--/購物車表單的下載  -->

<!-- fontawesome -->
<link href="../revolution/fonts/fontawesome-all.css">
<!-- css -->
<link rel="stylesheet" type="text/css" href="../css/login.css">
<!-- <link rel="stylesheet" type="text/css" href="../css/center.css"> -->
<style>
	#payForm label{
		width: 100px;
	}
</style>
</head>



<body data-offset="200" data-spy="scroll" data-target=".ow-navigation">
	<div class="main-container">
		<!-- Loader -->
		<%@ include file="/pages/header.jsp"%>

		<!--	內容開始	-->
		<main> <!-- Page Banner -->

		<div class="container" style="margin-bottom: 100px">

				<div class="checkout-form">
					
					<div class="col-md-8 col-sm-12 col-xs-12 col-md-push-2 ">
						<div style="background-color: #FFB6C1">
							<h3>
								<label>訂購人資訊</label>
							</h3>
						</div>
						<div class="billing-field">
							<div class="col-md-12 form-group">
								<label>帳號 *</label><span></span> <input id="name"
									name="memberId" class="form-control" type="text"
									value="${member.name }" required />
							</div>
							<div class="col-md-12 form-group">
								<label>姓名 *</label><span></span> <input onblur="nameCheck();"
									id="name" name="name" class="form-control" type="text"
									value="${member.name }" required />
							</div>
							<div class="col-md-6 form-group">
								<label>Email *</label><span></span> <input
									onblur="emailCheck();" id="r-email" name="email"
									class="form-control" type="email" value="${member.email }"
									required />
							</div>
							<div class="col-md-6 form-group">
								<label>手機 *</label><span></span> <input onblur="phoneCheck();"
									name="phone" class="form-control" type="text" maxlength="10"
									value="${member.phone }" required />
							</div>
							<div class="col-md-6 form-group">
								<label>縣市 *</label><span></span> <input 
									name="area" class="form-control" type="text" maxlength="10"
									value="${member.area }" required />
							</div>
							<div class="col-md-12 form-group">
								<label>地址 *</label><span></span> <input onblur="addressCheck();"
									name="address" class="form-control" type="text"
									value="${member.address }" required />
							</div>
							
							<form id="payForm" style="margin: 30px;text-align: center;">
							<div class="col-md-6 form-group">
								<div class="card-wrapper"></div>
							</div>
							<div class="col-md-6 form-group">
								<label>信用卡卡號 * </label><input type="tel" name="number">
							</div>
							<div class="col-md-6 form-group">
								<label>全名* </label><input type="text" name="name">
							</div>
							<div class="col-md-6 form-group">
								<label>有效日期 * </label><input placeholder="MM/YY" type="tel" name="expiry">
							</div>
							<div class="col-md-6 form-group">
								<label>背面末三碼 * </label><input placeholder="CVC" type="number" name="cvc">
							</div>
							</form>
							<script src="../card-master/dist/card.js"></script>
						    <script>
						        new Card({
						            form: document.querySelector('#payForm'),
						            container: '.card-wrapper'
						        });
						    </script>
						</div>

					</div>

					<!-- 收件人資料 -->

					<div class="col-md-8 col-sm-12 col-xs-12 col-md-push-2 ">
						<div style="background-color: #FFB6C1">
							<h3>
								<label>收件人資訊</label>
							</h3>

						</div>
						<label>同訂購人資料</label><input type="checkbox" checked />
						<div class="billing-field">
							<div class="col-md-12 form-group">
								<label>姓名 *</label><span></span> <input onblur="" id="name"
									name="recipient" class="form-control" type="text"
									value="${member.name }" required />
							</div>
							<div class="col-md-6 form-group">
								<label>手機 *</label><span></span> <input onblur=";"
									name="recipientPhone" class="form-control" type="text"
									maxlength="10" value="${member.phone }" required />
							</div>
							<div class="col-md-6 form-group">
								<label>縣市 *</label><span></span> <input 
									name="area" class="form-control" type="text" maxlength="10"
									value="${member.area }" required />
							</div>
							<div class="col-md-12 form-group">
								<label>地址 *</label><span></span> <input onblur="addressCheck();"
									name="location" class="form-control" type="text"
									value="${member.address }" required />
							</div>

						</div>
						<button id="personal-updatebtn"
							class="btn btn-default form-control password-send " type="button"
							style="background-color: pink">確認送出</button>
					</div>
				</div>
			</div>
		</div>

	<!-- Container /- -->
	<%@ include file="/pages/footer.jsp"%>

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
	<!-- login  -->
	<!-- 	<script type="text/javascript" src="../js/login.js"></script> -->
	<script type="text/javascript">
		$(document).ready(function() {
			
			$('#personal-updatebtn').click(function(){
				$.post('/PCC/checkOut.admin', function(data){
					alert(data);
					location.replace('/PCC/pages/center.jsp');
				})
			})
			
			//信用卡卡號填寫
			$('.card').keyup(function(e) {
				if ($(this).val().length == $(this).attr('maxlength'))
					$(this).next(':input').focus();
			});

			//隱藏購物車內的東西
			$(".mini_cart_item").css("display", "none");

			//統計總數量
			totalPrice();

			//統計小計
			$('.quantityNumber').change(function() {

				var product = $(this);
				var number = product.val();
				var id = product.attr("id");
				var price = parseInt($("#" + id + "price").text());
				var subtoal = price * number;
				$("#" + id + "subtotal").text(subtoal);
				totalPrice();
			})

			// 按下刪除除去購物車物件
			$(".eliminate").click(function() {
				var spanId = $(this).attr("id").split("eliminate")[0];
				console.log("點到啦" + spanId);

				$.ajax({
					url : "/PCC/eliminate.shopping",
					type : "POST",
					data : {
						"productId" : spanId
					},
					success : function(data) {

						$("#" + spanId + "subtotal").text("0");
						totalPrice();
						$("#" + spanId + "tr").css("display", "none");

					}
				});

			});

			//按下去購物的按鈕就會轉跳
			$("#gotoShoppingButtoun").click(function() {
				location.replace("/PCC/pages/shop-2.jsp");

			});

		})

		//統計總數量
		function totalPrice() {
			var tal = 0;
			$(".subtal").each(function() {
				tal = tal + parseInt($(this).text());
			})

			$("#tatlePrice").text(tal);
			if (tal == 0) {

				$("#noShoppingImg").css("display", "");
				$(".table").css("display", "none");
				$("#checkButton").css("display", "none");
			}
		}
	</script>
</body>
</html>



