$(function(){
	
	$.getJSON('/PCC/showMyCourses.clazz', function(data){
		$('#course-list > span').text('(' + data.length + ')');
		console.log(data);
		
		$.each(data, function(i,v){
			var a1 = $('<a></a>').css('font-size','20px').attr('href','/PCC/clazzDetail.clazz?detail=' + v[0].classId).text(v[0].courseName);
			var td1 = $('<td></td>').append(a1);
			var td2 = $('<td></td>').text(v[0].location);
			var td3 = $('<td></td>').text(v[0].endDate);
			var td4 = $('<td></td>').text(v[0].price);
			var td5 = $('<td></td>');
			var td6 = $('<td></td>');
			if(v[0].status == 0){
				var diff = v[0].numberOfStudents - v[0].currentStudents;
				td5.text('尚缺'+ diff +'人方可開課');
				td6.text('尚未開課');
			}else if(v[0].status == 1){ 
				td5.text('已達開課人數，即將開課。');
				if(v[1].status == 0){
					td6.text('尚未繳費');
				}else if(v[1].status == 1){
					td6.text('已繳費');
				}
			}
			var tr = $('<tr></tr>').append(td1,td2,td3,td4,td5,td6);
			$('#myCoursesTable').append(tr);
		})
	})
	
	$.getJSON('/PCC/showMySystemMsg.sysMsg', function(data){
		$('#center-message > span').text('(' + data.length + ')');
		
		$.each(data,function(i,v){
			var td1 = $('<td></td>').text(v.title).css({cursor:'pointer',fontSize:'20px',color:'red'}).click(function(){
				$.get('/PCC/alreadyRead.sysMsg?systemMessageId=' + v.systemMessageId, function(data){
					td1.next().next().text(data);
				})
				var contentsTr = $(this).parent('tr').next();
				if(contentsTr.css('display') == 'none'){
					contentsTr.fadeIn("slow", function() {
						$(this).show();
					});
				}else{
					contentsTr.fadeOut("slow"), function(){
						$(this).hide();
					}
				}
			});
			var td2 = $('<td></td>').text(v.date);
			var td3 = $('<td></td>');
			if(v.status == 0){
				td3.text('未讀');
			}else if(v.status == 1){
				td3.text('已讀');
			}
			var td4 = $('<td></td>').attr('colspan','3').text(v.contents);
			var tr1 = $('<tr></tr>').append(td1,td2,td3);
			var tr2 = $('<tr></tr>').css('display','none').append(td4);
			$('#mySystemMsgTable').append(tr1,tr2);
		})
		
		
	})
	
	$.getJSON('/PCC/showMyArticles.forum',function(data){
		$('#my-article > span').text('(' + data.listOfMyPost.length + ')');
		$('#favorite-article > span').text('(' + data.listOfMyCollect.length + ')');
		$('#reply-article > span').text('(' + data.listOfMyReply.length + ')');
		$('#reported-article > span').text('(' + data.listOfMyReported.length + ')');
		
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
				td15.text('檢舉審核中');
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
				td25.text('檢舉審核中');
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
				td35.text('檢舉審核中');
			}else if(v.status == 2){
				td35.text('本文章已被封鎖');
				td33.empty().text(v.topic);
			}
			var tr3 = $('<tr></tr>').append(td31,td32,td33,td34,td35);
			$('#replyArticleTable').append(tr3);
		})
		
		var myReported = data.listOfMyReported;
		$.each(myReported,function(i,v){
			var td41 = $('<td></td>').text(v[0].memberId);
			var a41 = $('<a></a>').attr('href','/PCC/showDetial.forum?messageId='+v[0].messageId).text(v[0].topic);
			var td42 = $('<td></td>').append(a41).css('font-size','20px');;
			var td43 = $('<td></td>').text(v[0].date);
			var td44 = $('<td></td>');
			if(v[0].status == 0){
				td44.text('正常');
			}else if(v[0].status == 1){
				td44.text('檢舉審核中');
			}else if(v[0].status == 2){
				td44.text('本文章已被封鎖');
				td42.empty().text(v[0].topic);
			}
			var td45 = $('<td></td>').text(v[1].reason);
			var td46 = $('<td></td>').text(v[1].date);
			var td47 = $('<td></td>');
			if(v[1].status == 0){
				td47.text('管理員尚未看到檢舉');
			}else if(v[1].status == 1){
				td47.text('管理員已看過檢舉');
			}
			var tr4 = $('<tr></tr>').append(td41,td42,td43,td44,td45,td46,td47);
			$('#reportedArticleTable').append(tr4);
		})
		
	})
})