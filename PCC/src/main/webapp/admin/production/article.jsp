<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Gentelella Alela! | </title>

    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <!-- bootstrap-progressbar -->
    <link href="../vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- PNotify -->
    <link href="../vendors/pnotify/dist/pnotify.css" rel="stylesheet">
    <link href="../vendors/pnotify/dist/pnotify.buttons.css" rel="stylesheet">
    <link href="../vendors/pnotify/dist/pnotify.nonblock.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
    table{
		width: 100%;
		margin: auto;
	}
	
	th,td{
		padding: 10px;
	}
</style>
<script>
	$(function(){
	
		$('.showReasonBtn').click(function(){
			var messageId = $(this).val();
			var reportId = $(this).parents('tr').attr('id').substr(2);
			
			$.getJSON('${pageContext.request.contextPath}/showReason.admin'
						,'messageId='+messageId+'&reportId='+reportId,function(data){
				var h1 = $('<h1></h1>').text(data.postArticle.topic);
				var h2 = $('<h2></h2>').text(data.postArticle.memberId + '　　發文日期: ' + data.postArticle.date);
				var span1 = $('<span></span>').html(data.postArticle.contents);
				var span2 = $('<span></span>').html('<h3>檢舉原因:</h3>' + data.reason);
				$('#reportedArticleDetail').empty().append(h1, h2, span1, '<hr>', span2);
			})
			
			$(this).parents('tr').children('td:eq(4)').text('已查看');
		})
		
		$('.showReasonsBtn').click(function(){
			var messageId = $(this).val();

			$.getJSON('${pageContext.request.contextPath}/showReasons.admin','messageId='+messageId,function(data){
				var h1 = $('<h1></h1>').text(data.postArticle.topic);
				var h2 = $('<h2></h2>').text(data.postArticle.memberId + '　　發文日期: ' + data.postArticle.date);
				var span1 = $('<span></span>').html(data.postArticle.contents);
				var span2 = $('<span></span>').html('<h3>檢舉原因:</h3>');
				$.each(data.reasons, function(i,v){
					span2.append((i+1) + ' : '+ v,'<br>'); 
				})
				
				$('#reportedArticleDetails').empty().append(h1,h2,span1,'<hr>',span2);
			})
		})
		
		$('body').on('click','.showReasonsBtn2',function(){
			var messageId = $(this).val();

			$.getJSON('${pageContext.request.contextPath}/showReasons.admin','messageId='+messageId,function(data){
				var h1 = $('<h1></h1>').text(data.postArticle.topic);
				var h2 = $('<h2></h2>').text(data.postArticle.memberId + '　　發文日期: ' + data.postArticle.date);
				var span1 = $('<span></span>').html(data.postArticle.contents);
				var span2 = $('<span></span>').html('<h3>檢舉原因:</h3>');
				$.each(data.reasons, function(i,v){
					span2.append((i+1) + ' : '+ v,'<br>'); 
				})
				
				$('#reportedArticleDetails2').empty().append(h1,h2,span1,'<hr>',span2);
			})
		})
		
		$('.blackArticleBtn').click(function(){
			var messageId = $(this).val();
			var memberId =$(this).parents('tr').children('td:eq(0)').text();
			var topic =$(this).parents('tr').children('td:eq(1)').text();
			
			$.post('${pageContext.request.contextPath}/blackArticle.admin',
					'messageId='+messageId,function(data){
				alert(data);
				if(data.indexOf('已被加入黑名單') != -1){
					var span = $('<span></span>').text(memberId + '　');
					$('#blackTable').append(span);
				}
			})
			$(this).parents('tr').remove();
			var td1 = $('<td></td>').text(memberId);
			var td2 = $('<td></td>').text(topic);
			var btn = $('<button></button>').addClass('showReasonsBtn2').val(messageId).text('查看文章與檢舉歷史');
			var td3 = $('<td></td>').append(btn);
			var tr = $('<tr></tr>').append(td1,td2,td3);
			$('#blackArticles').append(tr);
			
		})
		
	})
</script>
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">

        <%@ include file="leftAndTop.jsp" %>

        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>討論區管理系統</h3>
              </div>
            </div>

            <div class="clearfix"></div>

            <div class="">
            
            <div class="col-md-6 col-sm-6 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>最新檢舉訊息</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
						<table>
							<tr>
								<th>作者</th>
								<th>標題</th>
								<th>檢舉人</th>
								<th>檢舉日期</th>
								<th>狀態</th>
							</tr>
							<c:forEach var="article" items="${all.listOfDetail}">
								<tr id="tr${article[1].reportId}">
									<td>${article[0].memberId}</td>
									<td>${article[0].topic}</td>
									<td>${article[1].memberId}</td>
									<td><fmt:formatDate value="${article[1].date}" pattern="yyyy-MM-dd HH:mm" /></td>
									<td>尚未查看</td>
									<td><button class="showReasonBtn" value="${article[0].messageId}">查看文章與檢舉原因</button></td>
								</tr>
							</c:forEach>
						</table>
                  </div>
                </div>
              </div> 
              <div id="reportedArticleDetail" style="width: 50%;float: right;"></div> 
             <div class="clearfix"> </div>
            
              <div class="col-md-6 col-sm-6 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>檢舉紀錄</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
					<table>
						<tr>
							<th>作者</th>
							<th>標題</th>
							<th>被檢舉總數</th>
						</tr>
						<c:forEach var="article" items="${all.listOfReportedInfo}">
							<tr>
								<td>${article[0].memberId}</td>
								<td>${article[0].topic}</td>
								<td>${article[1]}</td>
								<td><button class="showReasonsBtn" value="${article[0].messageId}">查看文章與檢舉歷史</button></td>
								<td><button class="blackArticleBtn" value="${article[0].messageId}">封鎖本文章</button></td>
							</tr>
						</c:forEach>
						</table>
                  </div>
                </div>
              </div>
              <div id="reportedArticleDetails" style="width: 50%;float: right;"></div> 
              <div class="clearfix"></div>

			  <div class="col-md-6 col-sm-6 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>已封鎖文章</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
					<table id="blackArticles">
						<tr>
							<th>作者</th>
							<th>標題</th>
						</tr>
						<c:forEach var="article" items="${all.listOfBlackArticles}">
							<tr>
								<td>${article.memberId}</td>
								<td>${article.topic}</td>
								<td><button class="showReasonsBtn2" value="${article.messageId}">查看文章與檢舉歷史</button></td>
							</tr>
						</c:forEach>
						</table>
	                  </div>
	                </div>
	              </div>
				 <div id="reportedArticleDetails2" style="width: 50%;float: right;"></div> 
				<div class="clearfix"></div>

            <div class="col-md-6 col-sm-6 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2>討論區黑名單</h2>
                  <ul class="nav navbar-right panel_toolbox">
                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                    </li>
                    <li><a class="close-link"><i class="fa fa-close"></i></a>
                    </li>
                  </ul>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <div id="blackTable">
					<c:forEach var="blackMember" items="${all.listOfBlackMembers}">
						<span>${blackMember.memberId}&nbsp;</span>
					</c:forEach>
               	 </div>
              </div>
            </div>

            </div>
            <div class="clearfix"></div>
            </div>
          </div>
          <div class="clearfix"></div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
<%@ include file="footer.jsp" %>
        <!-- /footer content -->
      </div>
    </div>

    <div id="custom_notifications" class="custom-notifications dsp_none">
      <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
      </ul>
      <div class="clearfix"></div>
      <div id="notif-group" class="tabbed_notifications"></div>
    </div>

    <!-- jQuery -->
    <script src="../vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="../vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="../vendors/nprogress/nprogress.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="../vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- iCheck -->
    <script src="../vendors/iCheck/icheck.min.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>
	
  </body>
</html>