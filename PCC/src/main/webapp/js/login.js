//Loder
//$(function(){
//	$("#site-loader").remove();
//});

//Google Login
function onSuccess(googleUser) {
	var profile = googleUser.getBasicProfile();
	var id_token = googleUser.getAuthResponse().id_token;
	console.log("ID Token: " + id_token);
	// 傳去給service (Tomcat)
//	 var xhr = new XMLHttpRequest();
//	 xhr.open('POST', 'https://yourbackend.example.com/tokensignin');
//	 xhr.setRequestHeader('Content-Type',
//	 'application/x-www-form-urlencoded');
//	 xhr.send('idtoken=' + id_token);
//	 xhr.onload = function() {
//	 console.log('Signed in as: ' + xhr.responseText);
//	 };
	// 傳去給controller
	$.ajax({
		url : "/PCC/google.login",
		type : "POST",
		data : {
			"idtoken" : id_token,
		},
		success : function(data) {
			if (data == "正在註冊") {
				location.replace("/PCC/pages/quickRegisty.jsp");
			} else if (data == "已註冊") {
				console.log("ok");
				$('#log-log').css("display", "none");
				$('#log-reg').css("display", "none");
				$('#log-cen').css("display", "block");
				$('#log-out').css("display", "block");
				if (!window.location.hash) {
					window.location = window.location + '#loaded';
					window.location.reload();
				}

			} else {
				console.log("no");
				if (!window.location.hash) {
					window.location = window.location + '#loaded';
					window.location.replace("/PCC/pages/quickRegisty.jsp");
				}
			}
		}
	});
}

function onFailure(error) {
	console.log(error);
}
function renderButton() {
	gapi.signin2.render('my-signin2', {
		'scope' : 'profile email',
		'width' : 240,
		'height' : 50,
		'longtitle' : true,
		'theme' : 'dark',
		'onsuccess' : onSuccess, 
		'onfailure' : onFailure
	});
}

// 快速註冊
$(function() {
	$('#quick-registy-btn').click(
			function() {
				$.post("/PCC/quickRegisty.update.login", $(
						'#quick-registy-form').serialize(), function(data) {
					location.replace('/PCC/index.jsp');
				});
			});
});

// 登出
$(function() {
	$('#log-out').click(function() {
		$('#my-signin2').remove();
		var _iframe = $('<iframe src="https://accounts.google.com/logout" style="display:none;"></iframe>');
		$("#out").append(_iframe);
		$.ajax({
			url : "/PCC/logout.login",
			type : "POST",
			success : function(data) {
				if (data == "登出") {
					var thesave=$("#save").val();
					console.log(thesave);
					setTimeout("location.replace('/PCC/index.jsp');", 500);
				}
			}
		});
	})
});

// JQ 成功的 登入
$(function() {
	$('#sub').click(function() {
		$.ajax({
			url : "/PCC/login.login",
			type : "POST",
			data : $('#formid').serialize(),
			success : function(data) {
				if (data == "會員" || data == "管理員") {
					if (data == "管理員") {
						location.replace('/PCC/admin/production/admin.jsp');
					} else {
						$('#log-log').css("display", "none");
						$('#log-reg').css("display", "none");
						$('#log-cen').css("display", "block");
						$('#log-out').css("display", "block");
						window.location.reload();
					}
				} else if (data == "登入失敗") {
					$('#log-log').css("display", "block");
					$('#log-reg').css("display", "block");
					$('#log-cen').css("display", "none");
					$('#log-out').css("display", "none");
					location.replace('/PCC/pages/registy.jsp');
				}
			}
		});
	});
});

$(document).ready(function() {
	var save = $("#save").val();
	console.log(save);
	if (save === '1' || save === '2') {
		$('#log-log').css("display", "none");
		$('#log-reg').css("display", "none");
		$('#log-cen').css("display", "block");
		$('#log-out').css("display", "block");
	} else {
		$('#log-log').css("display", "block");
		$('#log-reg').css("display", "block");
		$('#log-cen').css("display", "none");
		$('#log-out').css("display", "none");
	}
});

// JQ 註冊
$(function() {
	$('#registy-btn').click(
			function() {
				if ($('#account').val() != "") {
					$.post("/PCC/registy.insert.login", $('#registy-form')
							.serialize(), function(data) {
						// 12/15沒有跳出歡迎
						if (data == "成功註冊") {
							alert("註冊成功，歡迎加入會員");
							location.replace('/PCC/index.jsp');
						} else if (data == "註冊失敗") {
							alert("註冊失敗");
						}

					});

				}

			});
});

// JQ 註冊的 blur 帳號可以使用檢查
$(function() {
	// 帳號判斷
	$('#account').blur(function() {
		$.post("/PCC/registy.login", {
			"memberId" : $('#account').val()
		}, function(data) {
			if (data == "可以註冊") {
				$('#ac-span').text(" 可以使用此帳號").css("color", "green");
				$('#account').css({
					"border" : "1px solid #d1d1d1"
				});
			} else if (data == "不可空白") {
				$('#ac-span').text(" 請輸入").css({
					"color" : "red"
				});
				$('#account').css({
					"border" : "2px solid #EB7C81"
				});
			} else if (data == "8~19個英文或數字") {
				$('#ac-span').text(" 輸入8~19個英文或數字").css("color", "red");
				$('#account').css({
					"border" : "2px solid #EB7C81"
				});
			} else if (data == "不可使用的帳號") {
				$('#ac-span').text(" 此帳號已被使用").css("color", "red");
				$('#account').css({
					"border" : "2px solid #EB7C81"
				});
			}
		});
	});
});

// JS 判斷有寫名字
function nameCheck() {
	var name = document.querySelector('input[name="name"]');
	var nameLength = name.value.trim().length;
	var nameStyle = document.querySelector("#name-span");

	if (nameLength == null || nameLength == 0) {
		nameStyle.innerHTML = " 請輸入";
		nameStyle.style['color'] = 'red';
		document.querySelector('#name').style['border'] = '2px solid #EB7C81';
	} else {
		nameStyle.innerHTML = " ";
		nameStyle.style['color'] = 'green';
		document.querySelector('#name').style['border'] = '1px solid #d1d1d1';
	}
}

// JS 判斷有寫密碼
function psw() {
	var password = document.querySelector('input[id="r-password"]');
	var pswLength = password.value.trim().length;
	var ps = document.querySelector("#ps-span");

	if (pswLength == null || pswLength == 0) {
		ps.innerHTML = " 請輸入";
		ps.style['color'] = 'red';
		document.querySelector('#r-password').style['border'] = '2px solid #EB7C81';
	} else if (pswLength < 8 || pswLength > 20) {
		ps.innerHTML = " 輸入8~20個英文或數字";
		ps.style['color'] = 'red';
		document.querySelector('#r-password').style['border'] = '2px solid #EB7C81';
	} else {
		ps.innerHTML = " ";
		ps.style['color'] = 'green';
		document.querySelector('#r-password').style['border'] = '1px solid #d1d1d1';
	}
}

// JS 密碼重複 的判斷
function match() {
	var p1 = document.getElementById("r-password").value;
	var p2 = document.getElementById("passwordMatch").value;
	var ps2 = document.querySelector("#ps2-span");

	if (p1 == p2) {
		ps2.innerHTML = " ";
		ps2.style['color'] = 'green';
		document.querySelector('#passwordMatch').style['border'] = '1px solid #d1d1d1';
	} else if (p2.trim().length == 0) {
		ps2.innerHTML = " 請輸入";
		ps2.style['color'] = 'red';
		document.querySelector('#passwordMatch').style['border'] = '2px solid #EB7C81';
	} else {
		ps2.innerHTML = " 請輸入相同的密碼";
		ps2.style['color'] = 'red';
		document.querySelector('#passwordMatch').style['border'] = '2px solid #EB7C81';
	}
}

// JS 判斷 註冊 有寫email
function emailCheck() {
	var email = document.querySelector('input[name="email"]').value;
	emailRule = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;
	var em = document.querySelector("#email-span");

	if (email.search(emailRule) != -1) {
		em.innerHTML = " ";
		em.style['color'] = 'green';
		document.querySelector('#r-email').style['border'] = '1px solid #d1d1d1';
	} else {
		em.innerHTML = " 請輸入正確email格式";
		em.style['color'] = 'red';
		document.querySelector('#r-email').style['border'] = '2px solid #EB7C81';
	}
}

// JS 判斷 忘記密碼 有寫email
function emailChangeCheck() {
	var emailchange = document.querySelector('input[name="emailchange"]').value;
	emailRule = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;
	var emc = document.querySelector("#emailchange-span");

	if (emailchange.search(emailRule) != -1) {
		emc.innerHTML = " ";
		emc.style['color'] = 'green';
		document.querySelector('#emailchange').style['border'] = '1px solid #d1d1d1';
	} else {
		emc.innerHTML = " 請輸入正確email格式";
		emc.style['color'] = 'red';
		document.querySelector('#emailchange').style['border'] = '2px solid #EB7C81';
	}
}

// JS 判斷有寫手機
function phoneCheck() {
	var phone = document.querySelector('input[name="phone"]');
	var phoneLength = phone.value.trim().length;
	var ph = document.querySelector("#phone-span");

	if (phoneLength == null || phoneLength == 0) {
		ph.innerHTML = " 請輸入";
		ph.style['color'] = 'red';
		document.querySelector('#phone').style['border'] = '2px solid #EB7C81';
	} else if (phoneLength != 10) {
		ph.innerHTML = " 請輸入正確手機格式";
		ph.style['color'] = 'red';
		document.querySelector('#phone').style['border'] = '2px solid #EB7C81';
	} else {
		ph.innerHTML = " ";
		ph.style['color'] = 'green';
		document.querySelector('#phone').style['border'] = '1px solid #d1d1d1';
	}
}

// JS 判斷有寫address
function addressCheck() {
	var address = document.querySelector('input[name="address"]');
	var addressLength = address.value.trim().length;
	var ad = document.querySelector("#address-span");

	if (addressLength == null || addressLength == 0) {
		ad.innerHTML = " 請輸入";
		ad.style['color'] = 'red';
		document.querySelector('#address').style['border'] = '2px solid #EB7C81';
	} else if (addressLength < 3 || addressLength > 25) {
		ad.innerHTML = " 請輸入正確地址";
		ad.style['color'] = 'red';
		document.querySelector('#address').style['border'] = '2px solid #EB7C81';
	} else {
		ad.innerHTML = " ";
		ad.style['color'] = 'green';
		document.querySelector('#address').style['border'] = '1px solid #d1d1d1';
	}
}
