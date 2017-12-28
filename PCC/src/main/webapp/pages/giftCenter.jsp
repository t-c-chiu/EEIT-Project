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

<title>PCC - Gift</title>
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

.addto-cart:hover{
 cursor:pointer
}

.dlg-no-close .ui-dialog-titlebar-close {display: none;} 


.footer-send2{
    color:#fff;
    border-radius: 0;  
    background-color: #20B2AA;
}
.footer-send2:hover{
    background-color: #d4d4d4;
    color:#2C3536;
}

</style>

<link rel="stylesheet" type="text/css" href="../css/login.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script async defer
src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDYpbCt__aSkFOPc8En0xCzF6G8S_hD1Yg">
</script>
<script>
function initGift(){			
	$.get('${pageContext.request.contextPath}/selectGift.gift',function(data){
		console.log(data)
		var ul=$('<ul></ul>').addClass('products')
		$('#main').empty().append(ul)
		
		$.each(data,function(i,gift){
			var li=$('<li></li>').addClass("product design")
			var img=$('<img></img>').addClass("image")
									.attr('src','../images/gift/'+gift.giftId+'.jpg')
			                        .attr('alt',gift.giftName)
			var h= $('<h5></h5>').text(gift.giftName)                       
			var span=$('<span></span>').addClass("price")
			                            .text(gift.point+"points")
			   
			var a=$('<a></a>').addClass("addto-cart")
			                  .text("加入兌換")
			                  .attr('id',gift.giftId)
			li.append([img,h,span,a])
			ul.append(li)
		})
	})
	
}

	$(function() {
		initGift()	
		
		$('body').on('click','.addto-cart',function(){
			alert($(this).attr("id"))
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
					<h3>禮物中心</h3>
					<p>our vision is to be Earth's most customer centric company</p>
				</div>
				<ol class="breadcrumb">
					<li><a href="../index.html" title="Home">首頁</a></li>
					<li class="active">禮物中心</li>
				</ol>
			</div>
			<!-- Container /- -->
		</div>
		<!-- Page Banner /- --> <!-- Product Section -->
		
	<div id="product-section"
			class="product-section container-fluid no-padding">
			<!-- Container -->
			<div class="container">
				<div class="row">
					<!-- Section Header -->
					<div class="section-header">
						<h3>Our Products</h3>
						<p>our vision is to be Earth's most customer centric company</p>
						<img src="../images/section-seprator.png" alt="section-seprator" />
					</div>
					<!-- Section Header /- -->
					<ul id="filters" class="products-categories no-left-padding">
						<li><a data-filter="*" class="active" href="#">All
								Products</a></li>
						<li><a data-filter=".design" href="#">jewellery</a></li>
						<li><a data-filter=".video" href="#">books</a></li>
						<li><a data-filter=".photography" href="#">watches</a></li>
						<li><a data-filter=".web" href="#">shoes</a></li>
						<li><a data-filter=".design" href="#">electronics</a></li>
						<li><a data-filter=".photography" href="#">mobiles</a></li>
						<li><a data-filter=".video" href="#">more<i
								class="fa fa-angle-down"></i></a></li>								
					</ul>
				</div>
				<div id="main">
					<!-- Products -->
					<ul class="products">
					
				
						<li class="product design"><img src="../images/product-1.jpg" alt="Product" />
						<h5>Stylish Chair</h5> 
						<span class="price">50 points</span>				
						<a class="addto-cart" title="Add To Cart">加入兌換</a></li>
				
					
					</ul>
					<!-- Products /- -->
                </div>
				</div>
				<!-- Row /- -->
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

