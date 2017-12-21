<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    
    <link rel="stylesheet" 
    href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
	<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
	<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" type="text/css" href="../css/login.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <title>PCC Admin</title>

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
    <!-- JQVMap -->
    <link href="../vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="../vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
    
    
    <script>
    $(function() {
    	init()
    	
    	$("body").on('click','.delete',function(){
    			var roomReserverId=$(this).attr("id")
    			
    			$.post('${pageContext.request.contextPath}/deleteReservation.room','roomReserverId='+roomReserverId,function(data){
    				alert(data)   				   			
    			})
   			   	
    			$(this).parents('tr').remove()
    	})
  	
    	function init(){ 	   	   		
    		$.get('${pageContext.request.contextPath}/selectAllReservation.room',function(data){    	 
    		var tbody=$('<tbody></tbody>')
    			
    		$('#datatable-responsive').append(tbody)
    		
    		$.each(data,function(i,roomReservation){
    			   var tr1=$('<tr></tr>').addClass("odd")
				                         .attr('role',"row") 
    				   		
    			   var td1=$('<td></td>').attr('tabindex',"0")
    			   						 .addClass('tabindex',"sorting_1")
    			   						 .text(roomReservation.roomReserverId)  
    			   						 
    			   var td2=$('<td></td>').text(roomReservation.memberId)
    			   var td3=$('<td></td>').text(roomReservation.name)
    			   var td4=$('<td></td>').text(roomReservation.phone)
    			   var td5=$('<td></td>').text(roomReservation.email)
    			   var td6=$('<td></td>').text(roomReservation.roomId)
    			   var td7=$('<td></td>').text(roomReservation.beginDate)
    			   var td8=$('<td></td>').text(roomReservation.endDate)
    			   var td9=$('<td></td>').text(roomReservation.totalPrice)
    			   var td10=$('<td></td>') 
    			   var button=$('<button>刪除</button>').addClass("delete")
    			                                       .attr("id",roomReservation.roomReserverId)
    			   td10.html(button)                                
    			       			       	       			   
    			   tr1.append([td1,td2,td3,td4,td5,td6,td7,td8,td9,td10])
    			   tbody.append(tr1)                     
    			})	
    			
    		})
    		
    		
    		$.get('${pageContext.request.contextPath}/selectAllRoom.room',function(data){
        		console.log(data)
        			var tbody=$('<tbody></tbody>')
        			$('#datatable-responsive2').append(tbody)
        			
        			$.each(data,function(i,room){
        			var tr1=$('<tr></tr>').addClass("odd")
                                          .attr('role',"row") 
    	   		
     				var td1=$('<td></td>').attr('tabindex',"0")
     						 			  .addClass('tabindex',"sorting_1")
     						 			  .text(room.roomId)  
     						 
     				var td2=$('<td></td>').text(room.roomName)
     				var td3=$('<td></td>').text(room.area)
     				var td4=$('<td></td>').text(room.roomType)
     				var td5=$('<td></td>').text(room.price)
     				var td6=$('<td></td>').text(room.info)
     			    tr1.append([td1,td2,td3,td4,td5,td6])
    			    tbody.append(tr1)  
     				
        			})
        			   			
        		}) 		
    	 }
   		
    }); 	  		   	    	             
  </script>
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">

         <%@ include file="leftAndTop.jsp"%>
         
        <!-- page content -->
        <div class="right_col" role="main"> 
        
               
          <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>訂單一覽</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                        </a>                     
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <p class="text-muted font-13 m-b-30"></p>
			
                 
                    <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer dtr-inline collapsed" cellspacing="0" width="100%" role="grid" aria-describedby="datatable-responsive_info" style="width: 100%;">
              
                      <thead>                     
                        <tr role="row">
                        <th class="sorting_asc" tabindex="0" aria-controls="datatable-responsive" rowspan="1" colspan="1" style="width: 50px;">訂單編號</th>
                        <th class="sorting" tabindex="0" aria-controls="datatable-responsive" rowspan="1" colspan="1" style="width: 50px;" >會員編號</th>
                        <th class="sorting" tabindex="0" aria-controls="datatable-responsive" rowspan="1" colspan="1" style="width: 50px;" >入住人</th>
                        <th class="sorting" tabindex="0" aria-controls="datatable-responsive" rowspan="1" colspan="1" style="width: 60px;" >連絡電話</th>
                        <th class="sorting" tabindex="0" aria-controls="datatable-responsive" rowspan="1" colspan="1" style="width: 60px;" >EMAIL</th>
                        <th class="sorting" tabindex="0" aria-controls="datatable-responsive" rowspan="1" colspan="1" style="width: 50px;" >房間編號</th>
                        <th class="sorting" tabindex="0" aria-controls="datatable-responsive" rowspan="1" colspan="1" style="width: 50px; " >入住日</th>
                        <th class="sorting" tabindex="0" aria-controls="datatable-responsive" rowspan="1" colspan="1" style="width: 50px; " >退房日</th>
                        <th class="sorting" tabindex="0" aria-controls="datatable-responsive" rowspan="1" colspan="1" style="width: 50px; " >總價</th>
                        <th class="sorting" tabindex="0" aria-controls="datatable-responsive" rowspan="1" colspan="1" style="width: 20px; " >刪除訂單</th>                       
                        </tr>
                      </thead>
                 
                    </table>
										
                  </div>
                </div>
              </div>
      
      
      
            <div class="col-md-8 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>房間一覽</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"></a>
                       
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <p class="text-muted font-13 m-b-30"></p>
			
                 
                    <table id="datatable-responsive2" class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer dtr-inline collapsed" cellspacing="0" width="100%" role="grid" aria-describedby="datatable-responsive_info" style="width: 100%;">
              
                      <thead>                      
                        <tr role="row">
                        <th class="sorting_asc" tabindex="0" aria-controls="datatable-responsive" rowspan="1" colspan="1" style="width: 50px;">房間編號</th>
                        <th class="sorting" tabindex="0" aria-controls="datatable-responsive" rowspan="1" colspan="1" style="width: 50px;" >房間名稱</th>
                        <th class="sorting" tabindex="0" aria-controls="datatable-responsive" rowspan="1" colspan="1" style="width: 50px;" >地區</th>
                        <th class="sorting" tabindex="0" aria-controls="datatable-responsive" rowspan="1" colspan="1" style="width: 60px;" >房型</th>
                        <th class="sorting" tabindex="0" aria-controls="datatable-responsive" rowspan="1" colspan="1" style="width: 60px;" >每晚房價</th>
                        <th class="sorting" tabindex="0" aria-controls="datatable-responsive" rowspan="1" colspan="1" style="width: 50px;" >介紹</th>                     
                        </tr>
                      </thead>
                 
                    </table>
										
                  </div>
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
    <!-- Chart.js -->
    <script src="../vendors/Chart.js/dist/Chart.min.js"></script>
    <!-- gauge.js -->
    <script src="../vendors/gauge.js/dist/gauge.min.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="../vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- iCheck -->
    <script src="../vendors/iCheck/icheck.min.js"></script>
    <!-- Skycons -->
    <script src="../vendors/skycons/skycons.js"></script>
    <!-- Flot -->
    <script src="../vendors/Flot/jquery.flot.js"></script>
    <script src="../vendors/Flot/jquery.flot.pie.js"></script>
    <script src="../vendors/Flot/jquery.flot.time.js"></script>
    <script src="../vendors/Flot/jquery.flot.stack.js"></script>
    <script src="../vendors/Flot/jquery.flot.resize.js"></script>
    <!-- Flot plugins -->
    <script src="../vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
    <script src="../vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
    <script src="../vendors/flot.curvedlines/curvedLines.js"></script>
    <!-- DateJS -->
    <script src="../vendors/DateJS/build/date.js"></script>
    <script src="../vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <!-- JQVMap -->
    <script src="../vendors/jqvmap/dist/jquery.vmap.js"></script>
    <script src="../vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
    <script src="../vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="../vendors/moment/min/moment.min.js"></script>
    <script src="../vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>
	
  </body>
</html>
