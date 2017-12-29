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
			
			$.getJSON('/PCC/giveMeServant.admin', function(data){
				$.each(data, function(i,v){
					var td1 = $('<td></td>').text(v.serviceId);
					var td2 = $('<td></td>').text(v.name);
					var td3 = $('<td></td>').text(v.experience + '年');
					var td4 = $('<td></td>').text(v.type);
					var td5 = $('<td></td>').text(v.area);
					var btn = $('<button></button>').text('刪除服務員').click(function(){
						var isDelete = confirm('確認刪除此服務員?');
						if(!isDelete){
							return;
						}
						var serviceId = $(this).parents('tr').find('td:eq(0)').text();
						$.get('/PCC/deleteThisServant.admin?serviceId=' + serviceId, function(data){
							alert(data);
						})
						$(this).parents('tr').remove();
					});
					var td6 = $('<td></td>').append(btn);
					var tr = $('<tr></tr>').append(td1,td2,td3,td4,td5,td6);
					$('#ServantTable').append(tr);
				})
			})
			
			$('.passBtn').click(function(){
				$.get('/PCC/passMatching.admin?matchingId=' + $(this).val() ,function(data){
					alert(data);
				})
			})
			
			$('.refuseBtn').click(function(){
				var reason = prompt('請輸入拒絕理由');
				if(reason.trim().length == 0){
					return;
				}
				var isRecommend = confirm('是否要推薦其他服務員?');
				var recommend = 0;
				if(isRecommend){
					recommend = prompt('請輸入推薦的服務員編號');
				}
				
				$.get('/PCC/refuseMatching.admin?matchingId=' + $(this).val() +'&reason=' + reason + '&recommend=' + recommend,function(data){
					alert(data);
				})
				
			})
			
			$('#photo').change(function(){
	        if (this.files && this.files[0]) {
	            var reader = new FileReader();
	            reader.onload = function (e) {
	                $('#previewArea').attr('src', e.target.result);
	            	}
	            	reader.readAsDataURL(this.files[0]);
	        	}
			})
		
			$("#gogo").click(function (event) {
		        event.preventDefault();
		        var form = $('#formData')[0];
		        var data = new FormData(form);
				data.append('introduction',CKEDITOR.instances.introduction.getData());
		        $("#gogo").prop("disabled", true);
		        $.ajax({
		            type: "POST",
		            enctype: 'multipart/form-data',
		            url: "/PCC/createServant.admin",
		            data: data,
		            processData: false,
		            contentType: false,
		            cache: false,
		            success: function (data) {
		            	alert(data);
		                $("#gogo").prop("disabled", false);
		                location.reload();
		            },
		            error: function (e) {
		                console.log("ERROR : ", e);
		                $("#gogo").prop("disabled", false);
		            }
		        });
		    });
			
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
                <h3 style="display:inline;">配對審核系統</h3><button id="matchToggle">展開資料</button>
                <hr>
              </div>
            </div>

            <div class="clearfix"></div>

			<div id="matchingArea">
			<div id="matchingTable">
				<table>
				<c:forEach var="matching" items="${listOfMatchingDetails}">
				<tr class="apTr">
						<th rowspan="2">申請人：</th>
						<th>姓名</th>
						<th>電話</th>
						<th>預產期</th>
						<th>生產方式</th>
						<th>信箱</th>
						<th>地址</th>
						<th>需求</th>
						<th>住家型態</th>
						<th>天數</th>
					</tr>
					<tr class="apTr">
						<td>${matching[0].name}</td>
						<td>${matching[0].phone}</td>
						<td><fmt:formatDate value="${matching[0].expectedday}" pattern="yyyy-MM-dd"/></td>
						<td>${matching[0].way}</td>
						<td>${matching[0].email}</td>
						<td>${matching[0].address}</td>
						<td>${matching[0].demand}</td>
						<td>${matching[0].house}</td>
						<td>${matching[0].time}</td>
					</tr>
					<tr>
						<th rowspan="2">服務員：</th>
						<th>姓名</th>
						<th>服務區域</th>
						<th>服務類型</th>
						<th>經驗</th>
						<th rowspan="2" colspan="5">
							<span style="margin: 0px 200px 0px 0px;">申請時間：<fmt:formatDate value="${matching[2].date}" pattern="yyyy-MM-dd HH:mm"/></span>
							<button class="passBtn" value="${matching[2].matchingId}">審核通過</button>
							<button class="refuseBtn" value="${matching[2].matchingId}">拒絕申請</button>
						</th>
					</tr>
					<tr>
						<td>${matching[1].name}</td>
						<td>${matching[1].area}</td>
						<td>${matching[1].type}</td>
						<td>${matching[1].experience}年</td>
					</tr>
					<tr>
						<td colspan="10" style="border:	none;"></td> 
					</tr>
					</c:forEach>
				</table>
				</div>
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