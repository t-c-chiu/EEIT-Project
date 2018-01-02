$(function() {
		//一開始就打開商品搜尋區區	
		init();
		$('#productSearchAndUpdata').css("color", "red");
		$('#productSelectAndUpdataArea').css("display", "block");
		$('#productSelectAndUpdataQQ').css("display", "block");
		
		var pageOrder=$("#pageOrder").val()
		if(pageOrder=="上架商品"){
			$('#productInsert').css("color", "red");
			$('#productInsertArea').css("display", "block");
			$('#productInsertQQ').css("display", "block");
			alert("新增成功!!");
			
		}
		
		
		//訂單搜尋
		$(".submitOrder").click(function(){
			var searchType = $(this).val();
			var orderId = $("#orderId").val();
			var memberId = $("#orderMemberId").val();
			var status = $("#statusOrderRadio:checked").val();
			
		
			$.ajax({
				url : "/PCC/adminOrder.shopping",
				type : "GET",
				data : {
					"orderId" : orderId,
					"memberId" : memberId,
					"status" : status,
					"searchType" : searchType
				},
				success : function(data) {
					console.log(data);
					var tbody=$('#tbodyForOrder');
					tbody.empty();
					$.each(data,function(i,v){
						var tr1=$("<tr></tr>").html("<form><td><a class='orderLink' style='cursor: pointer;'>"+v.orderId+"</a><input type='text' name='orderId' size='2' value="+v.orderId+" hidden /></td><td><input type='text' name='memberId' size='4'value="+v.memberId+" /></td><td><input type='number' name='totalPrice' size='2' min='1' value="+v.totalPrice+" /></td><td><input type='text' name='date' size='3' value="+v.date+" /></td><td><input type='number' name='status' size='2' min='0' max='1' value="+v.status+" /></td><td><input type='text' name='recipient' size='4'value="+v.recipient+" /></td><td><input type='text' name='location' size='10' value="+v.location+" /></td><td><input type='text' name='recipientPhone' size='10'value="+v.recipientPhone+" /></td><td><input type='button' name='orderButton' value='修改' /><input type='button' name='orderButton' value='刪除' /></td></form>");
						var tr2=$("<tr></tr>").html("<td colspan='8'></td><td><input class='slideUpForOD' type='button' value='收起' /></td>");
						tr2.attr("id",v.orderId+'a');
						tbody.append(tr1);
						tbody.append(tr2);
						tr2.slideUp(0);
					});

						
						slideDownTable(100);
						$("#originalArea").css("display","none");
					
					
				}})
			
			
		});
		
		//訂單刪除和修改
		$("body").on('click',"input[name='orderButton']",function() {
			var actionType=$(this).val();
			var parent=$(this).parents("tr");
			var orderId= parent.find("input[name='orderId']").val();
			var memberId= parent.find("input[name='memberId']").val();
			var totalPrice= parent.find("input[name='totalPrice']").val();
			var date=parent.find("input[name='date']").val();
			var status= parent.find("input[name='status']").val();
			var location= parent.find("input[name='location']").val();
			var recipient= parent.find("input[name='recipient']").val();
			var recipientPhone= parent.find("input[name='recipientPhone']").val();
			
			
			$.ajax({
				url:"/PCC/adminOrderDU.shopping",
				type:"get",
				data:{
					"actionType":actionType,
					'orderId':orderId,
					'memberId':memberId,
					'date':date,
					'totalPrice':totalPrice,
					'status':status,
					'location':location,
					'recipient':recipient,
					'recipientPhone':recipientPhone

				},
				success:function(data){
					if(data=="刪除成功!"){
						
						parent.css("display","none");

						var id=parent.find('a').text();
						$('#'+id+'a').css("display","none");

					}
					
					alert(data);
				}
				
			});
			
			
		})
		
		
	
		
		//按訂單編號，可以展開
		$("body").on('click',".orderLink",function() {

			var id=$(this).text();
			
			var tr=$("#"+id+"a");
				tr.slideDown(800);
			$.ajax({
				url:"/PCC/adminOrderDetail.shopping",
				type:"get",
				data:{"orderId":id},
				success:function(data){
					console.log(data);
					var td=tr.find("td[colspan='8']");
					td.empty();
					var table=$("<table></table>").html("<thead><tr><th>產品編號</th><th>產品名稱</th><th>產品價錢</th><th>購買數量</th></tr></thead>");
					var tbody=$("<tbody></tbldy>");
					$.each(data,function(i,o){
						var context=$("<tr></tr>").html("<td>"+o.productId+"</td><td>"+o.productName+"</td><td>"+o.price+"</td><td>"+o.quantity+"</td>");
						tbody.append(context);
						
					});
					
					table.append(tbody);
					td.append(table);
				}
				
			});
		});
		//按訂單收起，可以收起
		$("body").on('click',".slideUpForOD",function() {
		
		
		$(this).parents("tr").slideUp(800);
			
		});
		
		
		
		//商品搜尋區class=sumbit
		$(".submit").click(function() {
			var searchType = $(this).val();
			var productId = $("#productId").val();
			var productName = $("#productName").val();
			var category = $("#category").val();
			var status = $("input[name='status']:checked").val();
		
			$.ajax({
				url : "/PCC/adminSearchProduct.shopping",
				type : "GET",
				data : {
					"productId" : productId,
					"productName" : productName,
					"category" : category,
					"status" : status,
					"searchType" : searchType
				},
				success : function(data) {
					var tbody=$("#tbodyForProductSearch");
					tbody.empty();
					
					$.each(data,function(i,v){

					var tr=$("<tr></tr>").html("<form id='form"+v.productId+"form' name='updataForm' method='post' action='/PCC/adminUpdata.shopping' enctype='multipart/form-data'><td><input type='text' size='2' value="+v.productId+" readonly style='background-color: pink;' name='productId'/></td><td><input name='productName' type='text' size='5' value="+v.productName+" /></td><td><input name='category' type='text' value="+v.category+" size='2' /></td><td><input type='text' value="+v.price+" size='2' name='price'/></td><td><input type='text' value="+v.stock+" size='1' name='stock'/></td><td><input type='text' value="+v.status+" size='1' name='status'/></td><td><img class='preview' src="+v.pictureAscii+" width='100px' height='75px' /><input class='upl' type='file' accept='image/*' name='photo' /></td><td><input type='textarea' value="+v.context+" size='5' name='context'/></td><td><input class='updataButton btn btn-danger' type='button' value='修改' /></td></form>");

					tr.addClass("tr");
					tbody.append(tr);
				
						
					});
					slideDownTable(500);
					$("#originalArea").css("display","none");
					
				}

			});

		});
		
		//上傳圖片，可以馬上預覽
 	    $("body").on("change", ".upl", function (){
 	    	var img=$(this).parent("td").find("img");
    	    preview(this,img);
    	})
		
		
		
		//按下按鈕更新產品class='updataButton'
		$("body").on('click','.updataButton',function(event) {
			event.preventDefault();
			var id=$(this).parents('tr').find('input[name="productId"]').val();
			var form=$("#form"+id+"form")[0];
 	   		var data=new FormData(form);
// 	   		data.append('info',CKEDITOR.instances.info.getData());   		
 	   		$.ajax({
 	   			type: "POST",
 	   			enctype: 'multipart/form-data',
 	   			url: '/PCC/adminUpdata.shopping',    			
 	   			data: data,
 	   			processData: false,
 	   			contentType: false,
 	   			cache: false,
 	   			success:function(data){
 	   				console.log(data);
 	   				alert(data);			
 	   			}
 	   		})

		});
		
		
	
		
		

		//點button時，把table打開
		$('.slideDown').click(function() {
			slideDownTable(500);
		})

		//點button時，把table收起來
		$(".slideUP").click(function() {
			slideUpTable(0);
			$("#originalArea").css("display","block");
		})

		//------------按title會有的反應----------
		$('#productSearchAndUpdata').click(function() {
			init();
			$(this).css("color", "red");
			$('#productSelectAndUpdataArea').css("display", "block");
			$('#productSelectAndUpdataQQ').css("display", "block");
		});

		$('#productInsert').click(function() {
			init();
			$(this).css("color", "red");
			$('#productInsertArea').css("display", "block");
			$('#productInsertQQ').css("display", "block");
		});

		$('#orderSelect').click(function() {
			init();
			$(this).css("color", "red");
			$('#orderSelectArea').css("display", "block");
			$('#orderSelectQQ').css("display", "block");
		});
		//------------/按title會有的反應----------

		//拖下功能
		function slideDownTable(seconds) {
			$('#drogTable').slideDown(seconds);

		}
		//拖上功能
		function slideUpTable(seconds) {

			$("#drogTable").slideUp(seconds);
		}

		function init() {
			$("#originalArea").css("display","block");
			//把三個區所有都藏起來
			$(".hideClass").css("display", "none");
			//把三個字給變成灰色
			$(".forntT").css("color", "gray");
			//把table給藏起來
			slideUpTable(0);

		}
		
		 //圖片預覽小幫手-2 
		    function preview(input,img) {
		 
		        if (input.files && input.files[0]) {
		            var reader = new FileReader();
		            
		            reader.onload = function (e) {
		                img.attr('src', e.target.result);

		            }
		 
		            reader.readAsDataURL(input.files[0]);
		        }
		    }

	});	