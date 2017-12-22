$(function(){
	$.getJSON('/PCC/showMyArticles.forum',function(data){
		console.log(data);
		
		var myPost = data.listOfMyPost;
		$.each(myPost, function(i,v){
			var a11 = $('<a></a>').attr('href','/PCC/showAll.forum?category='+v.category).text(v.category);
			var td11 = $('<td></td>').append(a11);
			var a12 = $('<a></a>').attr('href','/PCC/showDetial.forum?messageId='+v.messageId).text(v.topic);
			var td12 = $('<td></td>').append(a12).css('font-size','20px');
			var td13 = $('<td></td>').text(v.date);
			var td14 = $('<td></td>').text(v.likes);
			var td15 = $('<td></td>');
			if(v.status == 0){
				td15.text('正常');
			}else if(v.status == 1){
				td15.text('本文章已被檢舉');
			}else if(v.status == 2){
				td15.text('本文章已被封鎖');
				td12.empty().text(v.topic);
			}
			var tr1 = $('<tr></tr>').append(td11,td12,td13,td14,td15);
			$('#postArticleTable').append(tr1);
		})
		
		var myCollect = data.listOfMyCollect;
		$.each(myCollect, function(i,v){
			var td21 = $('<td></td>').text(v.memberId);
			var a21 = $('<a></a>').attr('href','/PCC/showAll.forum?category='+v.category).text(v.category);
			var td22 = $('<td></td>').append(a21);
			var a22 = $('<a></a>').attr('href','/PCC/showDetial.forum?messageId='+v.messageId).text(v.topic);
			var td23 = $('<td></td>').append(a22).css('font-size','20px');
			var td24 = $('<td></td>').text(v.date);
			var td25 = $('<td></td>');
			if(v.status == 0){
				td25.text('正常');
			}else if(v.status == 1){
				td25.text('本文章已被檢舉');
			}else if(v.status == 2){
				td25.text('本文章已被封鎖');
				td23.empty().text(v.topic);
			}
			var tr2 = $('<tr></tr>').append(td21,td22,td23,td24,td25);
			$('#collectArticleTable').append(tr2);
		})
		
		var myReply = data.listOfMyReply;
		$.each(myReply, function(i,v){
			var td31 = $('<td></td>').text(v.memberId);
			var a31 = $('<a></a>').attr('href','/PCC/showAll.forum?category='+v.category).text(v.category);
			var td32 = $('<td></td>').append(a31);
			var a32 = $('<a></a>').attr('href','/PCC/showDetial.forum?messageId='+v.messageId).text(v.topic);
			var td33 = $('<td></td>').append(a32).css('font-size','20px');
			var td34 = $('<td></td>').text(v.date);
			var td35 = $('<td></td>');
			if(v.status == 0){
				td35.text('正常');
			}else if(v.status == 1){
				td35.text('本文章已被檢舉');
			}else if(v.status == 2){
				td35.text('本文章已被封鎖');
				td33.empty().text(v.topic);
			}
			var tr3 = $('<tr></tr>').append(td31,td32,td33,td34,td35);
			$('#replyArticleTable').append(tr3);
		})
		
		var myReported = data.listOfMyReported;
		$.each(myReported,function(i,v){
			
		})
		
		
	})
})