<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Gentelella Alela! |</title>
<!-- Bootstrap -->
<link href="../vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link href="../vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- NProgress -->
<link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
<!-- iCheck -->
<link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">
<!-- bootstrap-progressbar -->
<link
	href="../vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css"
	rel="stylesheet">
<!-- PNotify -->
<link href="../vendors/pnotify/dist/pnotify.css" rel="stylesheet">
<link href="../vendors/pnotify/dist/pnotify.buttons.css"
	rel="stylesheet">
<link href="../vendors/pnotify/dist/pnotify.nonblock.css"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link href="../build/css/custom.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
<link rel="stylesheet"
	href="<c:url value="/jQuery-Timepicker-Addon-master/src/jquery-ui-timepicker-addon.css"/>" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
#actions {
	cursor: pointer;
	margin: 20px;
}

#actions span {
	font-size: 18px;
	margin: 5px 20px;
}

label {
	width: 120px;
	height: 30px;
}

input[type="submit"], input[type="reset"] {
	margin: 20px 80px;
}

th, td {
	padding: 10px;
}

#sidebar_right {
	　background-color: #FFFF33;
	　width: 120px;
	　height: 400px;
	　text-align: center;
	　line-height: 400px;
	　float: right;
}

.right {
	width: 56%;
}

.table {
	
}

#upfile {
	color: transparent
}
</style>
</head>
<body class="nav-md">
	<div class="container body">
		<div class="main_container">

			<%@ include file="leftAndTop.jsp"%>

			<!-- page content -->
			<div class="right_col" role="main">
				<!-- 中間的center -->
				<div>
					<div class="page-title">
						<div class="title_left">
							<h3>商品管理系統12356489979791531564849123456879aasdfghjkkkkkkkkkkkll</h3>
							<hr>
							<div id="actions">
								<span id="showCurrent">商品查詢與修改</span> <span id="applyCourse">上架新商品</span>
								<span>訂單查詢與修改</span> <span></span>
							</div>
						</div>
					</div>

					<div class="clearfix"></div>

					<div id="currentCourseArea" style="float: left">
						<div id="currentCourseTable">
							<label>商品編號</label>
							<form action="/PCC/adminSearchIdForProduct.shopping" method="get">
								<input name="searchWay" value="id" hidden /> <input id="productId" type="text" name="productId" size="5">
								<input id="IDButton" type="submit" value="編號查詢" class="submit">

							</form>

							<label>商品名稱：</label>

							<form action="/PCC/adminSearchNameForProduct.shopping"
								method="get">
								<input name="searchWay" value="name" hidden/>
								<input id="productName" type="text" name="productName" size="5">
								<input id="nameButton" type="submit" value="名稱查詢" class="submit">
							</form>
							<label>商品分類：</label>
							<form action="/PCC/adminSearchCategoryForProduct.shopping"
								method="get">
								<input name="searchWay" value="category" hidden/>
								<select name="category" id="category">
									<option>請選擇</option>
									<option value="藥膳">藥膳</option>
									<option value="產前產品">產前產品</option>
									<option value="產後產品">產後產品</option>
									<option value="嬰兒產品">嬰兒產品</option>
								</select><input id="categoryButton" type="submit" value="分類查詢"
									class="submit">
							</form>
							<label>狀態:</label>
							<form action="/PCC/adminSearchStatusForProduct.shopping"
								method="get">
								<input name="searchWay" value="status" hidden/>
								<input type="radio" name="status" value="1" checked />上架 <input
									type="radio" name="status" value="0" />下架 <input type="radio"
									name="status" value="2" />熱門商品 <input type="radio"
									name="status" value="3" />新上架商品 <input id="status"
									type="submit" value="狀態查詢" class="submit"> <br>
							</form>
						</div>
					</div>


					<div id="applyCourseFrom" style="display: none; float: left;">
						<form id="formData" method="post"
							action="<c:url value="/adminInsert.shopping"/>"
							enctype="multipart/form-data">
							<label>商品名稱：</label><input id="productName" type="text"
								name="productName" required><br> <label>商品分類：</label><select
								name="category" id="category" required>
								<option>請選擇</option>
								<option value="藥膳">藥膳</option>
								<option value="產前產品">產前產品</option>
								<option value="產後產品">產後產品</option>
								<option value="嬰兒產品">嬰兒產品</option>
							</select> <br> <label>商品價位：</label><input type="number" name="price"
								min="1" id="price" /><br> <label>商品存貨：</label><input
								type="number" name="stock" min="1" id="stock" /><br> <label>狀態</label>
							<input type="checkbox" name="status" value="1" checked="checked" />上架
							<input type="checkbox" name="status" value="0" />下架 <input
								type="checkbox" name="status" value="2" />熱門商品 <input
								type="checkbox" name="status" value="3" />新上架商品 <br> <label>商品內容：</label>
							<textarea name="context" id="introduction"></textarea>
							<br> <label>商品截圖：</label> <input type="file" id="photo"
								name="photo" accept="image/*"><br> <img
								id="previewPhoto" style="max-width: 250px;" /> <br> <input
								id="btnSubmit" type="submit" value="確定上架"> <input
								type="reset" value="重新填寫">
						</form>
					</div>
					<!-- center旁邊的right -->
					<div id="sidebar_right">
						<span class="right">
							<table>
								<thead style="border: gray 3px soild;">
									<tr>
										<th>編號</th>
										<th>商品名稱</th>
										<th>分類</th>
										<th>價錢</th>
										<th>存貨</th>
										<th>狀態</th>
										<th>圖片</th>
										<th>介紹內容</th>
										<th>修改按鈕</th>
									</tr>
								</thead>
								<tbody id="tbody">
									<c:forEach var="item" items="${adminProduct}">

										<tr>
											<form id="updateForm" method="post" action="/PCC/adminUpdata.shopping" enctype="multipart/form-data">
												<td><input type="text" name="productId"
													value="${item.productId}" size="2" readonly
													style="background-color: pink;" /></td>
												<td><input type="text" name="productName"
													value="${item.productName}" size="5" /></td>
												<td><input type="text" name="category"
													value="${item.category}" size="2" /></td>
												<td><input type="text" name="price"
													value="${item.price}" size="2" /></td>
												<td><input type="text" name="stock"
													value="${item.stock}" size="1" /></td>
												<td><input type="text" name="status"
													value="${item.status}" size="1" /></td>
												<td><img id="imgArea"src="${item.pictureAscii}" width="100px"
													height="75px" /> 
													<input id="upfile" type="file" name="photo"  accept="image/*" /></td>
												<td><input type="textarea" name="context"
													value="${item.context}" size="5" /></td>
												<td><input id="updataButton" type="submit" value="修改" /></td>
											</form>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</span>
					</div>
					<!-- /center旁邊的right -->
				</div>
				<!-- /中間的certer -->

				<div class="clearfix"></div>
			</div>
			<!-- /page content -->




			<!-- footer content -->
			<%@ include file="footer.jsp"%>
			<!-- /footer content -->
		</div>
	</div>

	<div id="custom_notifications" class="custom-notifications dsp_none">
		<ul class="list-unstyled notifications clearfix"
			data-tabbed_notifications="notif-group">
		</ul>
		<div class="clearfix"></div>
		<div id="notif-group" class="tabbed_notifications"></div>
	</div>

	<!-- jQuery -->
	<script src="../vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script src="../vendors/fastclick/lib/fastclick.js"></script>
	<!-- NProgress -->
	<script src="../vendors/nprogress/nprogress.js"></script>
	<!-- bootstrap-progressbar -->
	<script
		src="../vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
	<!-- iCheck -->
	<script src="../vendors/iCheck/icheck.min.js"></script>

	<!-- Custom Theme Scripts -->
	<script src="../build/js/custom.min.js"></script>

</body>

<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="<c:url value="/jQuery-Timepicker-Addon-master/src/jquery-ui-sliderAccess.js"/>"></script>
<script
	src="<c:url value="/jQuery-Timepicker-Addon-master/src/jquery-ui-timepicker-addon.js"/>"></script>

<script>
	var clicked = {
		color : 'red',
		fontSize : '20px'
	};
	var unclicked = {
		color : '',
		fontSize : '18px'
	};


	//商品區
	$(document).ready(function() {

		//更新產品
// 		$("#updataButton").click(function() {
// 			var form=$('#updataForm').serialize();
// 			console.log(form);
// 			$.ajax({
// 				url : "/PCC/adminUpdata.shopping",
// 				type : "POST",
// 				data : form,
// 				success : function(data) {
// 					alert(data);
// 					if (data == "更新成功!!") {
// 						var input = $("#upfile");
// 						// 若有選取檔案
// 						if (input.files && input.files[0]) {

// 							// 建立一個物件，使用 Web APIs 的檔案讀取器(FileReader 物件) 來讀取使用者選取電腦中的檔案
// 							var reader = new FileReader();

// 							// 事先定義好，當讀取成功後會觸發的事情
// 							reader.onload = function(e) {

// 								console.log(e);

// 								// 這裡看到的 e.target.result 物件，是使用者的檔案被 FileReader 轉換成 base64 的字串格式，
// 								// 在這裡我們選取圖檔，所以轉換出來的，會是如 『data:image/jpeg;base64,.....』這樣的字串樣式。
// 								// 我們用它當作圖片路徑就對了。
// 								$('#imgArea').attr('src', e.target.result);

// 								// 檔案大小，把 Bytes 轉換為 KB
// 								var KB = format_float(e.total / 1024, 2);
// 								$('.size').text("檔案大小：" + KB + " KB");
// 							}

// 							// 因為上面定義好讀取成功的事情，所以這裡可以放心讀取檔案
// 							reader.readAsDataURL(input.files[0]);
// 						}

// 					}
// 				}
// 			});

// 		});

		//判斷表格的填寫

		$("#productName").blur(function() {

			//以後寫
		});

		//按表格送出後顯現table
		// 		$(".submit").click(function(){
		// 			$("#tbody").css("display","block");

		// 		});

	});

	$(function() {

		// 		init();

		$('#actions > span').click(function() {
			$('#actions > span').css(unclicked);
			$(this).css(clicked);
		})

		$('#showCurrent').click(function() {
			// 			init();
			$('#applyCourseFrom').css('display', 'none');
			$('#currentCourseArea').css('display', 'block');
		})

		$('#applyCourse').click(function() {
			$('#currentCourseArea').css('display', 'none');
			$('#applyCourseFrom').css('display', 'block');
		})

		$('input[type="reset"]').click(function() {
			CKEDITOR.instances.introduction.setData('');
		})

		$('#endDate').datetimepicker({
			numberOfMonths : 2,
			minDate : 0,
			dateFormat : "yy/mm/dd",
			showSecond : false,
			timeFormat : 'HH:mm',
			controlType : 'select',
			stepMinute : 30
		});

		$('#photo').change(function() {
			if (this.files && this.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#previewPhoto').attr('src', e.target.result);
				}
				reader.readAsDataURL(this.files[0]);
			}
		})

		// 		$("#btnSubmit").click(function (event) {
		// 	        event.preventDefault();
		// 	        var form = $('#formData')[0];
		// 	        var data = new FormData(form);
		// 			data.append('introduction',CKEDITOR.instances.introduction.getData());
		// 	        $("#btnSubmit").prop("disabled", true);
		// 	        $.ajax({
		// 	            type: "POST",
		// 	            enctype: 'multipart/form-data',
		// 	            url: "/PCC/controller.shopping",
		// 	            data: data,
		// 	            processData: false,
		// 	            contentType: false,
		// 	            cache: false,
		// 	            success: function (data) {
		// 	            	alert(data);
		// 	                $("#btnSubmit").prop("disabled", false);
		// 	                location.reload();
		// 	            },
		// 	            error: function (e) {
		// 	                console.log("ERROR : ", e);
		// 	                $("#btnSubmit").prop("disabled", false);
		// 	            }
		// 	        });
		// 	    });
	})

	//為了上圖片後，計算圖檔大小的function
	/**
	 * 格式化
	 * @param   num 要轉換的數字
	 * @param   pos 指定小數第幾位做四捨五入
	 */
	function format_float(num, pos) {
		var size = Math.pow(10, pos);
		return Math.round(num * size) / size;
	}
</script>
</html>
