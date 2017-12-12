<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改文章</title>
<script src="<c:url value="/ckeditor/ckeditor.js"/>"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(function(){
		$('#postButton').click(function(){
			var contents = CKEDITOR.instances.contents.getData();
			if(contents.length == 0){
				$('#contentsSpan').text('請輸入內容');
			}else{
				$('#postForm').submit();
			}
		})
	})
</script>
</head>
<body>
		主題:${detail.post.topic}
		<hr>
		分類:${detail.post.category}
		<hr>
		<form id="postForm" action="<c:url value="/modify.forum"/>" method="post" enctype="multipart/form-data">
		內容:<textarea name="contents" id="contents">${detail.post.contents}</textarea><span id="contentsSpan"></span><br>
		<script>
			CKEDITOR.replace("contents", {
				width : 600
			});
		</script>
		<br><input id="postButton" type="button" value="送出"/><a href="<c:url value="/forumjsp/articleDetail.jsp"/>"><input type="button" value="取消"/></a>
	</form>
</body>
</html>