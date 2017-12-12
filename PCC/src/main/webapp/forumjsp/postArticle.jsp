<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<<<<<<< HEAD
<title>發文</title>
</head>
<body>
	<h1>發文</h1>
	<script src="//cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>
	<textarea name="editor1"></textarea>
	<script>CKEDITOR.replace("editor1");</script>
	<form action="<c:url value="/post.forum"/>" method="post"
		enctype="multipart/form-data">
		topic:<input type="text" name="topic" /><br> category:<input
			type="text" name="category" /><br> contents:
		<textarea rows="10" cols="30" name="contents"></textarea>
		<br> photo:<input type="file" name="photo" /><br> <input
			type="submit" />
=======
<script src="<c:url value="/ckeditor/ckeditor.js"/>"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(function(){
		$('#postButton').click(function(){
			var topic = $('#topic').val();
			var contents = CKEDITOR.instances.contents.getData();
			var isSubmit = true;
			if(topic.trim().length == 0){
				$('#topicSpan').text('請輸入主題');
				isSubmit = false;
			}else{
				$('#topicSpan').text('');
			}
			if(contents.length == 0){
				$('#contentsSpan').text('請輸入內容');
				isSubmit = false;
			}else{
				$('#contentsSpan').text('');
			}
			if(isSubmit){
				$('#postForm').submit();
			}
		})
	})
</script>

</head>
<body>
	<h1>發文</h1>
	<form id="postForm" action="<c:url value="/post.forum"/>" method="post" enctype="multipart/form-data">
		category: <select name="category">
			<option value="懷孕討論">懷孕討論</option>
			<option value="育兒討論">育兒討論</option>
			<option value="心情分享">心情分享</option>
				</select><br>
		topic: <input type="text" name="topic" id="topic"/><span id="topicSpan"></span><br> 
		contents: <textarea name="contents" id="contents"></textarea><span id="contentsSpan"></span><br>
		<script>
			CKEDITOR.replace("contents", {
				width : 600,
				height : 300
			});
		</script>
			<br><input id="postButton" type="button" value="發文"/><a href="<c:url value="/forumjsp/showArticle.jsp"/>"><input type="button" value="取消"/></a>
>>>>>>> branch 'master' of https://github.com/EEIT98Team05/RemoteRepository1127.git
	</form>
<<<<<<< HEAD

=======
>>>>>>> branch 'master' of https://github.com/EEIT98Team05/RemoteRepository1127.git
</body>
</html>