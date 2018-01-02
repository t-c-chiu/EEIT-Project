<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Contact Form | Gentelella Alela! by Colorlib</title>

    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <style>
	table {
	    font-family: arial, sans-serif;
 	    border-collapse: collapse; 
	    width: 100%;
	}
	
	td, th {
	    border: 2px solid #c6d1cb;
	    padding: 8px;
	    text-align: center;
	} 
	
	.apTr{
	    background-color: #dddddd;
	}
	
	button{
		margin:0px 20px;
	}
	
	label{ 
 		width: 80px;
 		height: 30px;
	}
	 
	</style>
	<script>
		$(function(){
		//拖曳系統
			$('#matchToggle').click(function(){
				$('#matchingTable').slideToggle(1000);
			});
		
		
		})
	</script>
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">

         <%@ include file="leftAndTop.jsp"%>

        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3 style="display:inline;">商品管理系統</h3>
                <hr>
               <div>
            	   <span id="productSearchAndUpdata">商品查詢與修改</span>
            	   <span id="productInsert">上架新商品</span>
				   <span id="orderSelect">訂單查詢</span>
               </div> 
                <button id="matchToggle">展開資料</button>
                <hr>
              </div>
              
            </div>

            <div class="clearfix"></div>

<!-- -----------------------------------------拖曳出來區------------------------------------------------------- -->			
			<div id="matchingTable">
						我是測試用資料
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
					
				</div>
<!-- -----------------------------------------/拖曳出來區------------------------------------------------------- -->
				<div id="createServant" style="width: 35%;float: left;">
				<h3>新增服務員</h3>
					<form id="formData" method="post" action="<c:url value="/createServant.admin"/>" enctype="multipart/form-data">
						<label>姓名：</label><input type="text" name="name"><br>
						<label>年資：</label><input type="number" name="experience">&nbsp;年<br>
						<label>接案類型：</label>
						<input type="radio" name="type" value="9小時">&nbsp;9小時
						<input type="radio" name="type" value="24小時">&nbsp;24小時
						<input type="radio" name="type" value="9小時,24小時皆可">&nbsp;9小時,24小時皆可<br>
						<label>服務區域：</label><input type="text" name="area"><br>
						<label>服務員介紹：</label>
						<textarea name="introduction" id="introduction"></textarea><br>
						<script src="<c:url value="/ckeditorbasic/ckeditor.js"/>"></script> 
						<script>
							CKEDITOR.replace("introduction", {
								width : 500
							});
						</script>
						<label>服務員照片：</label><input type="file" name="photo" id="photo"><br>
						<img id="previewArea" style="max-width:200px;"><br><br>
						<input id="gogo" type="submit">
					</form>
				</div>
				<div id="manageServant" style="width: 55%;float: right;"> 
				<h3>服務員清單</h3>
					<table id="ServantTable">
						<tr>
							<th>編號</th>
							<th>姓名</th>
							<th>年資</th>
							<th>接案類型</th>
							<th>服務區域</th>
							<th>管理</th> 
						</tr>
					</table>
				</div>
			</div>

          </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <%@ include file="footer.jsp" %>
        <!-- /footer content -->
      </div>
    </div>

    <!-- jQuery -->
    <script src="../vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="../vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="../vendors/nprogress/nprogress.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>
  </body>
</html>