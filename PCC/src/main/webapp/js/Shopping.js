

$(document).ready(function() {
	var starInput = $('#startInput').val();

	ViewCart();

	if (starInput == "") {
		$('#startForm').submit();
	}
	// 搜尋欄搜尋商品名
	$('#serch-btn').click(function() {
		// alert("已點");
		var searchText = $('#searchText').val();
		// alert(searchText);
		if (searchText.trim().length == 0) {
			alert('請輸入搜尋條件');
			$('#filter').val('').focus();
		} else {
			$('#searchForm').submit();
		}
	})
	// 分類欄點選分類
	$(".categoryli").click(function() {
		// alert(".categoryli被點選");
		var formid = $(this).find("input").val();

		// alert(formid);
		if (formid != '') {
			$(this).find("form").submit();
		}

	});

	// 加入購物車

	$(".add-to-cart1").click(function() {
		var productId = $(this).find("p").text();
		var producIdCartLi = $("#" + productId + "SS");

		$.ajax({
			url : "/PCC/addCart.shopping",
			type : "POST",
			data : {
				"productId" : productId
			},
			success : function(data) {
				if (producIdCartLi.text() == "") {
					var item = $("#" + data.productId);
					item.css("display", "");
				}
				// 抓數量的數字
				$("#" + data.productId + "span").text(data.quantity);
				// 只要購物車內有東西，就打開View Cart 和Check Out
				ViewCart();
			}
		});

	});

	// 按下X除去購物車物件
	$(".remove").click(function() {
		var parent = $(this).parent(".mini_cart_item");
		parent.css("display", "none");
		ViewCart();
		$.ajax({
			url : "/PCC/addCart.shopping",
			type : "POST",
			data : {
				"productId" : productId
			},
			success : function(data) {
				if (producIdCartLi.text() == "") {
					var item = $("#" + data.productId);
					item.css("display", "");
				}
				// 抓數量的數字
				$("#" + data.productId + "span").text(data.quantity);
				// 只要購物車內有東西，就打開View Cart 和Check Out
				$("#cartButtonLi").css("display", "");
			}
		});

	});

});
// 是否打開 ViweCart和Check out
function ViewCart() {
	var sum = 0;
	$(".cartSpan").each(function() {
		var number = parseInt($(this).text());
		console.log(number);
		sum = sum + number;
	});
	if (sum == 0) {
		$("#cartButtonLi").css("display", "none");

	} else {
		$("#cartButtonLi").css("display", "");
	}

}