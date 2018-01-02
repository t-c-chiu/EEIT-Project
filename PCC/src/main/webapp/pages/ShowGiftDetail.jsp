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

 <!-- jquery.tablesorter -->
<!-- load jQuery and tablesorter scripts -->
<script type="text/javascript" src="../tablesorter-master/js/jquery.tablesorter.js"></script>

<!-- tablesorter widgets (optional) -->
<script type="text/javascript" src="../tablesorter-master/js/jquery.tablesorter.widgets.js"></script>
    
    
    

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

.table-bordered {
    border: 1px solid #c2cfd6;
}
.table {
    width: 100%;
    max-width: 100%;
    margin-bottom: 1rem;
    background-color: transparent;
}
table {
    border-collapse: collapse;
}
thead {
    display: table-header-group;
    vertical-align: middle;
    border-color: inherit;
    background-color:#FF8888;
}
tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}
.table-bordered thead th, .table-bordered thead td {
    border-bottom-width: 2px;
}
.table thead th {
    vertical-align: bottom;
    border-bottom: 2px solid #c2cfd6;
}
tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
}
.table-bordered th, .table-bordered td {
    border: 1px solid #c2cfd6;
}
.table th, .table td {
    padding: 0.75rem;
    vertical-align: top;
    border-top: 1px solid #c2cfd6;
}
.table-bordered th, .table-bordered td {
    border: 1px solid #c2cfd6;
}





</style>

<link rel="stylesheet" type="text/css" href="../css/login.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script async defer
src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDYpbCt__aSkFOPc8En0xCzF6G8S_hD1Yg">
</script>
<script>

function initDetails(){			
	$.get('${pageContext.request.contextPath}/selectDetail.gift',function(data){
		console.log(data)
		var tbody=$('<tbody></tbody>')
		
		$('#detailTable>tbody').remove()
		$('#detailTable').append(tbody)
		$.each(data,function(i,details){
			var td0=$('<td></td>').text(details.exchangeDetailsId)
			var td1=$('<td></td>').text(details.giftName)
			var td2=$('<td></td>').text(details.point)
								  .addClass("price")
			var td3=$('<td></td>').text(details.number)
			var td4=$('<td></td>')			
			var button=$('<button>刪除</button>').addClass("delete")
    			                                .attr("id",details.exchangeDetailsId)
    		td4.html(button) 
						
			var tr1=$('<tr></tr>')
			tr1.append([td0,td1,td2,td3,td4])
			tbody.append(tr1)       
		})
		calculateSum()
		
	})
}
	
function calculateSum(){
	var sum=0

	$('.price').each(function(){		
		sum += Number($(this).text());						
	})
	
	$('#totalPoint').val(sum)

}

	$(function() {				
		initDetails()	
	
		
		$("body").on('click','.delete',function() {
			var exchangeDetailsId=$(this).attr('id')
			$.post('${pageContext.request.contextPath}/deleteDetail.gift','exchangeDetailsId='+exchangeDetailsId,function(data){
				alert(data)
				
			})
			$(this).parents('tr').remove()
			calculateSum()
		})
		
		$('#submit').click(function(){
			var totalPoint=$('#totalPoint').val()
			var data=$('#form').serialize()
						
			$.ajax({
				type: "POST",
    			url: '${pageContext.request.contextPath}/insertExchange.gift',    			
    			data: data,
    			success:function(data){
    				alert(data)
    			}				
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
		
					<!-- Container -->
			<div class="container">

				<!-- Billing -->
				
				<div class="checkout-form">
         
					<div class="col-md-12 col-sm-12 col-xs-12">
					
					<div id="main">
					<!-- Products -->
				<table id="detailTable" class="table table-bordered">
 					 <thead>
   						 <tr style="color:white">
      						<th>流水號</th>
     					    <th>商品名稱</th>
      						<th>點數</th>
      						<th>數量</th>
      						<th>刪除</th>
    					</tr>
  					</thead>
  					<tbody>
 					</tbody>
				</table>
					<!-- Products /- -->
                </div>	
                											
						<form id="form">
							<div class="billing-field">
								<div class="col-md-4 form-group">
									<label>收件人<span style="color:red" class="content" id="nameSpan"></span></label><input class="form-control" type="text"
										name="name" id="name" >
								</div>
								
								<div class="col-md-4 form-group">
									<label>地址<span style="color:red" class="content" id="addressSpan"></span></label><input class="form-control" type="text"
										name="address" id="address" >
								</div>
								
								<div class="col-md-4 form-group">
									<label>電話<span style="color:red" class="content" id="phoneSpan"></span></label><input class="form-control" type="text"
										name="phone" id="phone" >
								</div>
							
						
								<div class="col-md-4 form-group">
									<label>email<span style="color:red" class="content" id="areaSpan"></span></label><input class="form-control" type="text"
										name="email" id="email" >
								</div>
								
								<div class="col-md-4 form-group">
									<label>點數合計<span style="color:red" class="content" id="pointSpan"></span></label><input class="form-control" type="text"
										name="totalPoint" id="totalPoint" readonly="readonly" >
								</div>
								
								
								<div class="col-md-4 form-group">
									<label>&#160;<span style="color:red" class="content"></span></label><input class="btn btn-default form-control button-send" type="submit"
										id="submit" value="確認兌換">
								</div>																
							</div>
						</form>
					</div>
					

				</div>
				<!-- Billing /- -->		
			</div>
			<!-- Container /- -->
				
				
			</div>
			<!-- Container /- -->

			
	
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

