//document.addEventListener("DOMContentLoaded", function() {
//	$('#center-change-1').show();
//});
function hide() {
	for (var j = 1; j <= $('div[id^="center-change-"]').size(); j++) {
		var t = "#center-change-";
		j = String(j);
		var i = document.querySelector(t + j);
		if (i.style.display !== "none") {
			i.style.display = "none";
		}
	}
};

hide();
//系統訊息
$('#center-message').click(function() {
	hide();
	$('#center-change-1').fadeIn("slow", function() {
		$('#center-change-1').show();
	});
});
// 個人資料
$('#personal-information').click(function() {
	hide();
	$('#center-change-2').fadeIn("slow", function() {
		$('#center-change-2').show();
	});
});

// 會員點數
$('#member-point').click(function() {
	hide();
	$('#center-change-3').fadeIn("slow", function() {
		$('#center-change-3').show();
	});
});
// 更改密碼
$('#change-password').click(function() {
	hide();
	$('#center-change-4').fadeIn("slow", function() {
		$('#center-change-4').show();
	});
});
// 收藏商品
$('#favorite-product').click(function() {
	hide();
	$('#center-change-5').fadeIn("slow", function() {
		$('#center-change-5').show();
		// 12/27瑋晨新增
		
		// 12/27瑋晨新增底部
	
	});
});
// 購物車
$('#shopping-cart').click(function() {
	hide();
	$('#center-change-6').fadeIn("slow", function() {
		$('#center-change-6').show();
	});
});
// 訂單明細
$('#order-list').click(function() {
	hide();
	$('#center-change-7').fadeIn("slow", function() {
		$('#center-change-7').show();
	});
});
// 我的文章
$('#my-article').click(function() {
	hide();
	$('#center-change-8').fadeIn("slow", function() {
		$('#center-change-8').show();
	});
});
// 文章收藏
$('#favorite-article').click(function() {
	hide();
	$('#center-change-9').fadeIn("slow", function() {
		$('#center-change-9').show();
	});
});
//我的回文
$('#reply-article').click(function(){
	hide();
	$('#center-change-10').fadeIn("slow", function() {
		$('#center-change-10').show();
	});
})
//我的檢舉
$('#reported-article').click(function(){
	hide();
	$('#center-change-11').fadeIn("slow", function() {
		$('#center-change-11').show();
	});
})
//我的課程
$('#course-list').click(function(){
	hide();
	$('#center-change-12').fadeIn("slow", function() {
		$('#center-change-12').show();
	}); 
})

$('#matchingInfo').click(function(){
	hide();
	$('#center-change-13').fadeIn("slow", function() {
		$('#center-change-13').show();
	}); 
})

//function() {
//hide();
// $('#center-change-4').append($("<div></div>").html('<p>'+'123'+'</p>'));
//$('#center-change-4').html('<h3 class="center-title">更改密碼</h3>')
//		.fadeIn(1000);
// $('#center-change-4').show();
//}


//修改個人資料
$(document).ready(function(){
	var A=$('select[name="area"]').attr("id");
	$('option[value="'+A+'"]').attr("SELECTED",'SELECTED');
});

$('#personal-updatebtn').click(function(){
	$.post("/PCC/personal.update.login",$('#personal-update').serialize(),function(data){
		console.log(data);
		if(data!=null){
			alert("修改成功");
			$('#nameEl').text(data.name);
			$('#emailEl').text(data.email);
			$('#phoneEl').text(data.phone);
			$('#areaEl').text(data.area);
			$('#addressEl').text(data.address);
		}else{
			alert("修改失敗");
		}
	});
	
});


//更改密碼
$('#send-newpassword').click(function(){
//	console.log("開始");
	$.post("/PCC/changePassword.login",{"oldPassword":$('#old-password').val() ,"newPassword":$('#r-password').val() },function(data){
		if(data=="更改密碼成功"){
			alert("修改成功");
			window.location.reload();
//			hide();
//			$('#center-change-1').fadeIn("slow", function() {
//				$('#center-change-1').show();
//			});
		}else if(data=="密碼不正確"){
			alert("密碼不正確，修改失敗");
		}
	});
	
});


//忘記密碼
//$('#send-forget').click(function(){
//	console.log("hi");
//	$.post("/PCC/forget.login",$('#emailchange').val(),function(data){
//		console.log("oo");
//	})
//});


//page
//$('#page').pagination({
//    dataSource: [1, 2, 3, 4, 5, 6, 7, 8],
//    pageSize: 5,
//    showGoInput: true,
//    showGoButton: true,
//    callback: function(data, pagination) {
//        // template method of yourself
//        var html = template(data);
//        dataContainer.html(html);
//    }
//})


//---------------------------------瑋晨工作區----------------------------------

$(document).ready(function(){
	//一開始就生成畫面
	$.ajax({
		url:"/PCC/ShowFavoriteProduct.shopping",
		type:"GET",
		success:function(data){
			var i=0
			var table=$("#FPtable");
			
			$.each(data,function(index,value){
				var img=$("<img/>").attr("src",value.pictureAscii);
				img.attr("width","150px");
				img.attr("height","120px");
				
				var a1=$("<a></a>").text(value.productId);
				var a2=$("<a></a>").text(value.productName);
				var a3=$("<a></a>").append(img);
				var a4=$("<a></a>").text(value.price);
				
				
				
				
				var tr=$("<tr></tr>").addClass("tr"+value.productId);
					tr.attr("id",value.productId);
					
				var th1=$("<td></td>");
					th1.addClass("td");
					th1.append(a1);
					
				var th2=$("<td></td>");
					th2.addClass("td");
					th2.append(a2);
				var th3=$("<td></td>");
					th3.addClass("td");
					th3.append(a3);
				var th4=$("<td></td>");
					th4.addClass("td");
					th4.append(a4);
					
				var th5=$("<td></td>");
				var button=$("<input/>").attr("type","button");

				button.val("刪除");
				button.addClass("eButton");
				button.attr("id",value.productId);
				th5.append(button);
				tr.append([th1,th2,th3,th4,th5]);
				
				
				table.append(tr);
				i=i+1;
			});
			$("#FP-quanity").text("("+i+")");
			
		}
	});
	//點刪除就會刪除收藏商品
	$("body").on("click",".eButton",function() {
		
		var productId=$(this).attr("id");
		
		$.ajax({
			url:"/PCC/DeleteFavoriteProduct.shopping",
			type:"GET",
			data:{"productId":productId},
			success:function(data){
				
				if(data=="已刪除!"){
					$(".tr"+productId).css("display","none");
					
				}else if(data=="刪除失敗!"){
					
					alert("不知道哪裡出問題，刪除失敗!");
				}
			}
			
		});
		
		
	});
	
	//點擊商品會跳回商品區
	$("body").on("click",".td",function() {
		
		var productId=$(this).parent("tr").attr("id");

		$.ajax({
			url:"/PCC/center.shopping",
			type:"GET",
			data:{"productId":productId},
			success:function(data){
				
				if(data=="請前往"){
					location.replace("/PCC/shoppingMall/productContext.jsp");
					
				}
			}
			
		});
		
		
	});
	
});

//-------------------------會員中心下拉選單--------------------------------

$(function(){
	
	$('#member-bar').click(function(){
		$('#member-ul').slideToggle(1000);
	});
	
	$('#transaction-bar').click(function(){
		$('#transaction-ul').slideToggle(1000);
	});
	
	$('#article-bar').click(function(){
		$('#article-ul').slideToggle(1000);
	});
	
})




