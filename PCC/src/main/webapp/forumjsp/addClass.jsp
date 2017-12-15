<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增課程測試</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<c:url value="/ckeditorbasic/ckeditor.js"/>"></script>
<script>
	$(function(){
		
		$('#endDate').datepicker({
			numberOfMonths : 2,
			minDate : 0,
			dateFormat : "yy/mm/dd"
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
			data.append('introduction', CKEDITOR.instances.introduction.getData());
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
</head>
<body>

	<form id="formData" method="post" enctype="multipart/form-data" action="<c:url value="/startClass.clazz"/>">
		<label>課程分類</label><select name="category">
								<option value="產後瘦身">產後瘦身</option>
								<option value="孕期調理">孕期調理</option>
								<option value="新手媽咪">新手媽咪</option>
							</select><br>
		<label>課程名稱</label><input type="text" name="courseName"><br>
		<label>課程地點</label><input type="text" name="location"><br>
	 	<label>課程價位</label><input type="number" name="price"><br>
	 	<label>最低開課人數</label><input type="number" name="numberOfStudents"><br>
	 	<label>報名截止時間</label><input id="endDate" type="text" name="endDate"><br>
	 	<label>課程簡介</label>
	 	<textarea name="introduction" id="introduction"></textarea><br>
		<script>
			CKEDITOR.replace("introduction", {
				width : 500
			});
		</script>
		<label>課程截圖</label><input type="file" id="photo" name="photo" accept="image/*"><br>
		<img id="previewPhoto" style="max-width:250px;"/><br>
		<input id="btnSubmit" type="submit" value="申請開課">
	</form>
	
</body>
</html>