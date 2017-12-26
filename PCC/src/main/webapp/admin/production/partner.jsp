<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Contact Form | Gentelella Alela! by Colorlib</title>

    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <style>
	table {
	    font-family: arial, sans-serif;
 	    border-collapse: collapse; 
	    width: 100%;
	}
	
	td, th {
	    border: 2px solid #c6d1cb;
	    padding: 8px;
	    text-align: center;
	} 
	
	.apTr{
	    background-color: #dddddd;
	}
	
	button{
		margin:0px 20px;
	}
	</style>
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">

         <%@ include file="leftAndTop.jsp"%>

        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>配對審核系統</h3>
                <hr>
              </div>
            </div>

            <div class="clearfix"></div>

			<div id="matchingArea">
				<table>
				<c:forEach var="matching" items="${listOfMatchingDetails}">
				<tr class="apTr">
						<th rowspan="2">申請人：</th>
						<th>姓名</th>
						<th>電話</th>
						<th>預產期</th>
						<th>生產方式</th>
						<th>信箱</th>
						<th>地址</th>
						<th>需求</th>
						<th>住家型態</th>
						<th>天數</th>
					</tr>
					<tr class="apTr">
						<td>${matching[0].name}</td>
						<td>${matching[0].phone}</td>
						<td><fmt:formatDate value="${matching[0].expectedday}" pattern="yyyy-MM-dd"/></td>
						<td>${matching[0].way}</td>
						<td>${matching[0].email}</td>
						<td>${matching[0].address}</td>
						<td>${matching[0].demand}</td>
						<td>${matching[0].house}</td>
						<td>${matching[0].time}</td>
					</tr>
					<tr>
						<th rowspan="2">服務員：</th>
						<th>姓名</th>
						<th>服務區域</th>
						<th>服務類型</th>
						<th>經驗</th>
						<th rowspan="2" colspan="5">
							<span style="margin: 0px 200px 0px 0px;">申請時間：<fmt:formatDate value="${matching[2].date}" pattern="yyyy-MM-dd HH:mm"/></span>
							<button>審核通過</button><button>拒絕申請</button>
						</th>
					</tr>
					<tr>
						<td>${matching[1].name}</td>
						<td>${matching[1].area}</td>
						<td>${matching[1].type}</td>
						<td>${matching[1].experience}年</td>  
					</tr>
					<tr>
						<td colspan="10" style="border:	none;"></td> 
					</tr>
					</c:forEach>
				</table>
			</div>

          </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <%@ include file="footer.jsp" %>
        <!-- /footer content -->
      </div>
    </div>

    <!-- jQuery -->
    <script src="../vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="../vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="../vendors/nprogress/nprogress.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>
  </body>
</html>