//JQ 成功的 登入
$(function(){
    $('#sub').click(function(){
        $.ajax({url: "/PCC/login.login",type:"POST",
        	data:$('#formid').serialize(),
        	success: function(data){
			if(data=="會員" || data=="管理員"){
				location.replace('/PCC/index.jsp');
			}else if(data=="登入失敗"){
				alert("無此帳號");
				location.replace('/PCC/pages/registy.jsp');
			}
        }});
    });
});


//JQ 註冊
$(function(){
	$('#registy-btn').click(function(){
//		alert($('#account').val());
		if($('#account').val()!="" ){
//			alert($('#account').val()+"back");
			$.post("/PCC/registy.insert.login",$('#registy-form').serialize(),function(data){
// 12/15沒有跳出歡迎
//					alert(data);
					if(data=="成功註冊"){
						alert("歡迎");
					}else if(data=="註冊失敗"){
						alert("掰掰");
					}

			});
		}
		
		
	});
});



//JQ 註冊的 blur 帳號可以使用檢查
$(function(){
	// 帳號判斷
	$('#account').blur(function(){
		$.post("/PCC/registy.login",{"memberId":$('#account').val()},function(data){
			if(data=="可以註冊"){
				$('#ac-span').text(" 可以使用此帳號").css("color", "green");
				$('#account').css({"border": "1px solid #d1d1d1"});
			}else if(data=="不可空白"){
				$('#ac-span').text(" 請輸入").css({"color":"red"});
				$('#account').css({"border":"2px solid #EB7C81"});
			}else if(data=="8~19個英文或數字"){
				$('#ac-span').text(" 輸入8~19個英文或數字").css("color", "red");
				$('#account').css({"border":"2px solid #EB7C81"});
			}else if(data=="不可使用的帳號"){
				$('#ac-span').text(" 此帳號已被使用").css("color", "red");
				$('#account').css({"border":"2px solid #EB7C81"});
			}
		});
	});	
});


//JS 判斷有寫名字
function nameCheck(){
	var name=document.querySelector('input[name="name"]');
	var nameLength=name.value.trim().length;
	var nameStyle=document.querySelector("#name-span");
	
	if(nameLength==null || nameLength==0){
		nameStyle.innerHTML=" 請輸入";
		nameStyle.style['color']='red';
		document.querySelector('#name').style['border']='2px solid #EB7C81';
	}else{
		nameStyle.innerHTML=" ";
		nameStyle.style['color']='green';
		document.querySelector('#name').style['border']='1px solid #d1d1d1';
	}
}

//JS 判斷有寫密碼
function psw(){
	var password=document.querySelector('input[id="r-password"]');
	var pswLength=password.value.trim().length;
	var ps=document.querySelector("#ps-span");

	if(pswLength==null || pswLength==0){
		ps.innerHTML=" 請輸入";
		ps.style['color']='red';
		document.querySelector('#r-password').style['border']='2px solid #EB7C81';
	}else if(pswLength<8 || pswLength>20){
		ps.innerHTML=" 輸入8~20個英文或數字";
		ps.style['color']='red';
		document.querySelector('#r-password').style['border']='2px solid #EB7C81';
	}else{
		ps.innerHTML=" ";
		ps.style['color']='green';
		document.querySelector('#r-password').style['border']='1px solid #d1d1d1';
	}
}


//JS 密碼重複 的判斷
function match(){
	var p1=document.getElementById("r-password").value;
	var p2=document.getElementById("passwordMatch").value;
	var ps2=document.querySelector("#ps2-span");
	
	if(p1==p2){
		ps2.innerHTML = " ";
		ps2.style['color'] = 'green';
		document.querySelector('#passwordMatch').style['border'] = '1px solid #d1d1d1';
	}else if(p2.trim().length==0){
		ps2.innerHTML = " 請輸入";
		ps2.style['color'] = 'red';
		document.querySelector('#passwordMatch').style['border'] = '2px solid #EB7C81';
	}else{
		ps2.innerHTML = " 請輸入相同的密碼";
		ps2.style['color'] = 'red';
		document.querySelector('#passwordMatch').style['border'] = '2px solid #EB7C81';
	}
}


//JS 判斷有寫手機
function phoneCheck(){
	var phone=document.querySelector('input[name="phone"]');
	var phoneLength=phone.value.trim().length;
	var ph=document.querySelector("#phone-span");
	
	if(phoneLength==null || phoneLength==0){
		ph.innerHTML=" 請輸入";
		ph.style['color']='red';
		document.querySelector('#phone').style['border']='2px solid #EB7C81';
	}else if(phoneLength!=10){
		ph.innerHTML=" 請輸入正確手機格式";
		ph.style['color']='red';
		document.querySelector('#phone').style['border']='2px solid #EB7C81';
	}else{
		ph.innerHTML=" ";
		ph.style['color']='green';
		document.querySelector('#phone').style['border']='1px solid #d1d1d1';
	}
}


//JS 判斷有寫address
function addressCheck(){
	var address=document.querySelector('input[name="address"]');
	var addressLength=address.value.trim().length;
	var ad=document.querySelector("#address-span");
	
	if(addressLength==null || addressLength==0){
		ad.innerHTML=" 請輸入";
		ad.style['color']='red';
		document.querySelector('#address').style['border']='2px solid #EB7C81';
	}else if(addressLength<3 || addressLength>25){
		ad.innerHTML=" 請輸入正確地址";
		ad.style['color']='red';
		document.querySelector('#address').style['border']='2px solid #EB7C81';
	}else{
		ad.innerHTML=" ";
		ad.style['color']='green';
		document.querySelector('#address').style['border']='1px solid #d1d1d1';
	}
}

		
		