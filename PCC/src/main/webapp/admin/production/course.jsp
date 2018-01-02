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

    <title>PCC Admin Course</title>
    <!-- Bootstrap -->
<link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Font Awesome -->
<link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<!-- NProgress -->
<link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
<!-- iCheck -->
<link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">
<!-- bootstrap-progressbar -->
<link href="../vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
<!-- PNotify -->
<link href="../vendors/pnotify/dist/pnotify.css" rel="stylesheet">
<link href="../vendors/pnotify/dist/pnotify.buttons.css" rel="stylesheet">
<link href="../vendors/pnotify/dist/pnotify.nonblock.css" rel="stylesheet">

<!-- Custom Theme Style -->
<link href="../build/css/custom.min.css" rel="stylesheet">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
<link rel="stylesheet" href="<c:url value="/jQuery-Timepicker-Addon-master/src/jquery-ui-timepicker-addon.css"/>" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
<style>
	#actions{
		cursor: pointer;
		margin: 20px;
	}
	
	#actions span{
		font-size: 18px;
		margin: 5px 20px;
	}
	
	label{ 
 		width: 120px;
 		height: 30px;
	}
	
	input[type="submit"], input[type="reset"]{
		margin: 20px 80px;
	}
	
	th, td{
		padding: 10px;
	}
</style>
</head>
<body class="nav-md">
    <div class="container body">
      <div class="main_container">

        <%@ include file="leftAndTop.jsp" %>

        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>課程管理系統</h3>
                <hr>
                <div id="actions">
		            <span id="showCurrent">當前課程</span>
		            <span id="applyCourse">上架新課程</span>
           	 	</div>
              </div>
            </div>
            
            <div class="clearfix"></div>
            
            <div id="currentCourseArea">
            	<table id="currentCourseTable">
            		<tr>
            			<th>課程類型</th>
            			<th>課程名稱</th>
            			<th>課程狀態</th>
            			<th>上課地點</th>
            			<th>上課時間</th>
            		</tr>
            	</table>
            </div>
            
            <div id="applyCourseFrom" style="display: none;">
				<form id="formData" method="post" enctype="multipart/form-data" action="<c:url value="/startClass.clazz"/>">
					<label>課程分類：</label><input type="text" name="category"><br>
					<label>課程名稱：</label><input type="text" name="courseName"><br>
					<label>課程地點：</label><input type="text" name="location"><br>
				 	<label>課程價位：</label><input type="number" name="price"><br>
				 	<label>最低開課人數：</label><input type="number" name="numberOfStudents"><br>
				 	<label>報名截止時間：</label><input id="endDate" type="text" name="endDate"><br>
				 	<label>課程簡介：</label>
				 	<textarea name="introduction" id="introduction"></textarea><br>
				 	<script src="<c:url value="/ckeditorbasic/ckeditor.js"/>"></script> 
					<script>
						CKEDITOR.replace("introduction", {
							width : 500
						});
					</script>
					<input id="btnSubmit" type="submit" value="確定上架" class="btn btn-success">
					<input type="reset" value="重新填寫" class="btn btn-warning">
					<br>
					<label>課程截圖：</label>
					<input type="file" id="photo" name="photo" accept="image/*"><br>
					<img id="previewPhoto" style="max-width:250px;"/><br>
				</form>
			</div>
			
          </div>
          <div class="clearfix"></div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
<%@ include file="footer.jsp" %>
        <!-- /footer content -->
      </div>
    </div>

    <div id="custom_notifications" class="custom-notifications dsp_none">
      <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
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
    <script src="../vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- iCheck -->
    <script src="../vendors/iCheck/icheck.min.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>
	
  </body>
 
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<c:url value="/jQuery-Timepicker-Addon-master/src/jquery-ui-sliderAccess.js"/>"></script>
<script src="<c:url value="/jQuery-Timepicker-Addon-master/src/jquery-ui-timepicker-addon.js"/>"></script>

<script>
	var clicked = {color:'red',fontSize:'20px'}; 
	var unclicked = {color:'',fontSize:'18px'};
	
	function init(){
		$('#showCurrent').css(clicked);
		$.getJSON('${pageContext.request.contextPath}/showAllClazzSimple.clazz',function(data){
			$('tr:gt(0)').remove(); 
			$.each(data,function(i,v){
				var td1 = $('<td></td>').text(v.category);
				var a = $('<a></a>').text(v.courseName).attr('href','${pageContext.request.contextPath}/clazzDetail.clazz?detail=' + v.classId);
				var td2 = $('<td></td>').css('font-size','18px').append(a);
				var td3 = $('<td></td>');
				if(v.status == 0){
					td3.text('尚缺' + (v.numberOfStudents - v.currentStudents) + '人方可開課');
				}else{
					td3.text('即將開課');
				}
				var td4 = $('<td></td>').text(v.location);
				var td5 = $('<td></td>').text(v.endDate);
				var tr = $('<tr></tr>').append(td1,td2,td3,td4,td5);
				$('#currentCourseTable').append(tr); 
			})
			
		})
	}

	$(function(){
		
		init();
		
		$('#actions > span').click(function(){
			$('#actions > span').css(unclicked);
			$(this).css(clicked);
		})
		
		$('#showCurrent').click(function(){
			init();
			$('#applyCourseFrom').css('display','none');
			$('#currentCourseArea').css('display','block');
		})
		
		$('#applyCourse').click(function(){
			$('#currentCourseArea').css('display','none');
			$('#applyCourseFrom').css('display','block'); 
		})
		
		$('input[type="reset"]').click(function(){
			CKEDITOR.instances.introduction.setData('');
		})
		
		$('#endDate').datetimepicker({
			numberOfMonths : 2,
			minDate : 0,
			dateFormat : "yy/mm/dd",
			showSecond: false,
            timeFormat: 'HH:mm',
            controlType: 'select',
            stepMinute: 30
		});
		
		$('#photo').change(function(){
	        if (this.files && this.files[0]) {
	            var reader = new FileReader();
	            reader.onload = function (e) {
	                $('#previewPhoto').attr('src', e.target.result);
	            }
	            reader.readAsDataURL(this.files[0]);
	        }
		})
		
		$("#btnSubmit").click(function (event) {
	        event.preventDefault();
	        var form = $('#formData')[0];
	        var data = new FormData(form);
			data.append('introduction',CKEDITOR.instances.introduction.getData());
	        $("#btnSubmit").prop("disabled", true);
	        $.ajax({
	            type: "POST",
	            enctype: 'multipart/form-data',
	            url: "/PCC/startClass.clazz",
	            data: data,
	            processData: false,
	            contentType: false,
	            cache: false,
	            success: function (data) {
	            	alert(data);
	                $("#btnSubmit").prop("disabled", false);
	                location.reload();
	            },
	            error: function (e) {
	                console.log("ERROR : ", e);
	                $("#btnSubmit").prop("disabled", false);
	            }
	        });
	    });
	})
</script>
</html>
