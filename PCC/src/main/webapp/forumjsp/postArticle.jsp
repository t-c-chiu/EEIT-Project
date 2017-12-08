<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="<c:url value="/ckeditor/ckeditor.js"/>"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<h1>發文</h1>
	<form action="<c:url value="/post.forum"/>" method="post" enctype="multipart/form-data">
		category: <select name="category">
			<option value="懷孕討論">懷孕討論</option>
			<option value="育兒討論">育兒討論</option>
			<option value="心情分享">心情分享</option>
				</select><br>
		topic: <input type="text" name="topic" id="topic"/><span id="topicSpan">${errors.topic}</span><br> 
		contents: <textarea name="contents" id="contents"></textarea>${errors.contents}<br>
		<script>
			CKEDITOR.replace("contents", {
				width : 500
			});
		</script>
			<br><input type="submit" value="發文"/><a href="<c:url value="/forumjsp/showArticle.jsp"/>"><input type="button" value="取消"/></a>
	</form>

	<script>
		$(function(){
			$('#topic').blur(function(){
				var topic = $(this).val();
				if(!topic){
					$('#topicSpan').text('請輸入主題')
				}else{
					$('#topicSpan').text('')
				}
			})
		})
	</script>

</body>
</html>