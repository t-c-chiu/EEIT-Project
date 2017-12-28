<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<div class="col-md-3 left_col">
        <div class="left_col scroll-view">
          <div class="navbar nav_title" style="border: 0;">
      <a href="admin.jsp" class="site_title"><img class="logo-xs" src="images/pcc/pcc.png" /> <span> PCC Admin </span></a>
    </div>

    <div class="clearfix"></div>

    <!-- menu profile quick info -->
    <div class="profile clearfix">
      <div class="profile_pic">
        <img src="images/img.jpg" alt="..." class="img-circle profile_img">
      </div>
      <div class="profile_info">
        <span>Welcome,</span>
        <h2>${admin.name}</h2>
      </div>
    </div>
    <!-- /menu profile quick info -->

    <br />

    <!-- sidebar menu -->
    <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
      <div class="menu_section">
        <ul class="nav side-menu">
          <li><a href="admin.jsp"><i class="fa fa-home"></i> 首頁 </a>
          </li>
          
          <li><a href="<c:url value="/matching.admin"/>"><i class="fa fa-table"></i> 配對審核 </a>
          </li>
          <li><a><i class="fa fa-desktop"></i> 商城管理 </a>
          </li>
          <li><a href="order.jsp"><i class="fa fa-desktop"></i> 訂單管理 </a>
          </li>
          <li><a href="room.jsp"><i class="fa fa-desktop"></i> 房間管理 </a>
          </li>
          
          <li><a href="<c:url value="/article.admin"/>"><i class="fa fa-edit"></i> 討論區管理 </a>
          </li>
          <li><a href="course.jsp"><i class="fa fa-edit"></i> 課程管理 </a>
          </li>
          <li><a><i class="fa fa-bar-chart-o"></i> 報表查詢 <span class="fa fa-chevron-down"></span></a>
            <ul class="nav child_menu">
              <li><a href="#">網站</a></li>
              <li><a href="#">配對</a></li>
              <li><a href="#">房間</a></li>
              <li><a href="#">課程</a></li>
            </ul>
          </li>
        </ul>
      </div>

    </div>
    <!-- /sidebar menu -->

    <!-- /menu footer buttons -->
    <div class="sidebar-footer hidden-small">
      <a data-toggle="tooltip" data-placement="top" title="Logout" href="login.html">
        <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
      </a>
    </div>
    <!-- /menu footer buttons -->
  </div>
</div>

<!-- top navigation -->
<div class="top_nav">
  <div class="nav_menu">
    <nav>
      <div class="nav toggle">
        <a id="menu_toggle"><i class="fa fa-bars"></i></a>
      </div>

      <ul class="nav navbar-nav navbar-right">
        <li class="">
          <a class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
            <img src="images/img.jpg" alt="">${admin.name}
            <span class=" fa fa-angle-down"></span> 
          </a>
          <ul class="dropdown-menu dropdown-usermenu pull-right">
            <li><a href="<c:url value="/adminLogout.admin"/>"><i class="fa fa-sign-out pull-right"></i>登出</a></li>
          </ul>
        </li>
      </ul>
    </nav>
  </div>
</div>
<!-- /top navigation -->