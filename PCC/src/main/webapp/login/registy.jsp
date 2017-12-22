<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PCC-Registy</title>
<style type="text/css">
#MyForm {
	width: 400px;
	color: #888;
	background: #eee;
	border: 1px solid #fff;
	padding: 10px; box-shadow : 0px 0px 3px #888;
	-moz-box-shadow: 0px 0px 3px #888;
	-webkit-box-shadow: 0px 0px 3px #888;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	border-radius: 4px;
	-khtml-border-radius: 4px;
	text-shadow: 0px 1px 0px #fff;
	box-shadow: 0px 0px 3px #888;
}

.style1 {
	width: 350px;
	padding: 10px;
	/* 	border-bottom: 1px solid #c8c8c8; */
}

.style3 {
	width: 100px;
	float: left;
	margin: 10px;
	text-align: right;
}

.btn-registy {
	background: pink;
	padding: 5px 15px;
}
</style>
</head>
<body>

	<form id="MyForm" width="300px" action="<c:url value="/registy.login"/>" method="POST">
		<div class="style1">
			<label for="account" class="style3">帳號:</label> <input type="text"
				id="account" name="memberId" place="帳號" value="${param.account }" autocomplete="off" autofocus
				required />${errors.accountError} 
		</div>
		<div class="style1">
			<label for="password" class="style3">密碼:</label> <input
				type="password" id="password" name="password" place="密碼"
				autocomplete="off" autofocus required />${errors.passwordError}
		</div>
		<div class="style1">
			<label for="passwordMatch" class="style3">重複密碼:</label> <input
				type="password" id="passwordMatch" match="Password"
				place="重複密碼" autocomplete="off" autofocus required />
		</div>
		<div class="style1">
			<label for="username" class="style3">姓名:</label> <input type="text"
				id="account" name="name" placeholder="guest" autocomplete="off"
				autofocus required />
		</div>
		<div class="style1">
			<label for="mail" class="style3">Email:</label><input type="email"
				id="mail" name="email" autofocus required />
		</div>
		<div class="style1">
			<label for="phone" class="style3">手機:</label> <input type="text"
				id="phone" name="phone" place="手機" autofocus required />${errors.phoneError}
		</div>
		<div class="style1">
			<label class="style3">縣市:</label> <select name="area">
				<option value="TPE">台北市</option>
				<option value="TPH" selected>新北市</option>
				<option value="TYC">桃園市</option>
				<option value="HSC">新竹市</option>
			</select>
		</div>
		<div class="style1">
			<label for="address" class="style3" style="clear:both;">地址:</label> <input type="text" id="address" name="address"
				size="30" autofocus required/>
		</div>
		<input class="btn-registy" type="submit" name="btnRegisty" value="註冊">
		<!-- 			<div class="style1"> -->
		<!-- 				<label class="style3">性別:</label> <input type="radio" name="gender" -->
		<!-- 					value="male" id="m1" required /><label for="m1">男</label> <input -->
		<!-- 					type="radio" name="gender" value="male" id="f1" /><label for="f1">女</label> -->
		<!-- 			</div> -->
		<!-- 			<div class="style1"> -->
		<!-- 				<label for="birth" class="style3">Birthday:</label><input -->
		<!-- 					type="date" id="birth" name="birth" /> -->
		<!-- 			</div> -->
		<!-- 			<div class="style1"> -->
		<!-- 				<label for="" class="style3">身分證:</label><input type="text" -->
		<!-- 					pattern="[a-zA-Z]{1}[1-2]{1}\d{8}" required /> -->
		<!-- 			</div> -->
	</form>
</body>
</html>