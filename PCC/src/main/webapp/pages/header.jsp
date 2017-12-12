<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Header -->
		<header class="header-section header-section-1 container-fluid no-padding">
			
			<!-- Middel Header -->
			<div class="middel-header">
				<!-- Container -->
				<div class="container">
					<!-- Logo Block -->
					<div class="col-md-4 col-sm-6 col-xs-12 logo-block">
						<a href="index.html" class="navbar-brand">PCC <span>logo</span></a>
					</div><!-- Logo Block /- -->
					<!-- Search Block -->
					<div class="col-md-5 col-sm-6 col-xs-6 search-block">
						<div class="input-group">
							<input class="form-control" placeholder="Search You Wants Here . . ." type="text">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button"><i class="icon icon-Search"></i></button>
							</span>
						</div>
					</div><!-- Search Block /- -->
					<!-- Menu Icon -->
					<div class="col-md-3 col-sm-6 col-xs-6 menu-icon">
						<ul class="cart">
							<li>
								<a aria-expanded="true" aria-haspopup="true" data-toggle="dropdown" id="cart" class="btn dropdown-toggle" title="Add To Cart" href="#"><i class="icon icon-ShoppingCart"></i></a>
								<ul class="dropdown-menu no-padding">
									<li class="mini_cart_item">
										<a title="Remove this item" class="remove" href="#">&#215;</a>
										<a href="#" class="shop-thumbnail">
											<img alt="poster_2_up" class="attachment-shop_thumbnail" src="images/product-wishlist-1.jpg">Flying Ninja
										</a>
										<span class="quantity">2 &#215; <span class="amount">Rs.12.00</span></span>
									</li>
									<li class="mini_cart_item">
										<a title="Remove this item" class="remove" href="#">&#215;</a>
										<a href="#" class="shop-thumbnail">
											<img alt="poster_2_up" class="attachment-shop_thumbnail" src="../images/product-wishlist-2.jpg">Flying Ninja
										</a>
										<span class="quantity">2 &#215; <span class="amount">Rs.12.00</span></span>
									</li>
									<li class="button">
										<a href="#" title="View Cart">View Cart</a>
										<a href="#" title="Check Out">Check out</a>
									</li>
								</ul>
							</li>
							<li><a href="#" title="Like"><i class="icon icon-Heart"></i></a></li>
							<li><a href="#" title="User"><i class="icon icon-User"></i></a></li>
						</ul>
					</div><!-- Menu Icon /- -->
				</div><!-- Container /- -->
			</div><!-- Middel Header /- -->
			
			<!-- Menu Block -->
			<div class="container-fluid no-padding menu-block">
				<!-- Container -->
				<div class="container">
					<!-- nav -->
					<nav class="navbar navbar-default ow-navigation">
						<div class="navbar-collapse collapse" id="navbar">
							<ul class="nav navbar-nav">
								<li class="dropdown">
									<a href="../index.html" title="Home" class="dropdown-toggle" role="button" aria-haspopup="true" aria-expanded="false">首頁</a>
								</li>
								<li><a href="../pages/reservation.html" title="Reservation">線上預約</a></li>
								<li><a href="../pages/partner.html" title="Partner">服務夥伴</a></li>
								<li class="dropdown">
                                        <a href="../pages/shop.html" title="Shop" class="dropdown-toggle" role="button" aria-haspopup="true" aria-expanded="false">購物商城 </a>
                                        <i class="ddl-switch fa fa-angle-down"></i>
                                        <ul class="dropdown-menu">
                                            <li><a href="#" title="">商品類</a></li>
                                            <li><a href="#" title="">商品類</a></li>
                                            <li><a href="#" title="">商品類</a></li>
                                        </ul>
                                    </li>
								<li class="dropdown">
                                        <a href="../pages/room.html" title="Room" class="dropdown-toggle" role="button" aria-haspopup="true" aria-expanded="false">預約訂房</a>
                                    </li>
                                    <li class="dropdown">
                                        <a href="../pages/course.html" title="Course" class="dropdown-toggle" role="button" aria-haspopup="true" aria-expanded="false">線上課程</a>
                                        <i class="ddl-switch fa fa-angle-down"></i>
                                        <ul class="dropdown-menu">
                                            <li><a href="#" title="">教學類</a></li>
                                            <li><a href="#" title="">教學類</a></li>
                                        </ul>
                                    </li>
                                    <li class="dropdown">
                                        <a href="<c:url value="/showByOrder.forum?order=date"/>" title="Forum" class="dropdown-toggle" role="button" aria-haspopup="true" aria-expanded="false">文章/討論</a>
                                        <i class="ddl-switch fa fa-angle-down"></i>
                                        <ul class="dropdown-menu">
                                        	<li><a href="<c:url value="/showByOrder.forum?order=likes"/>">熱門文章</a></li>
                                            <li><a href="<c:url value="/showAll.forum?category=懷孕討論"/>">懷孕討論</a></li>
                                            <li><a href="<c:url value="/showAll.forum?category=育兒討論"/>">育兒討論</a></li>
                                            <li><a href="<c:url value="/showAll.forum?category=心情分享"/>">心情分享</a></li>
                                        </ul>
                                    </li>
								<li><a href="../pages/contact-us.html" title="Contact Us">聯絡資訊</a></li>
							</ul>
						</div><!--/.nav-collapse -->
					</nav><!-- nav /- -->
				</div><!-- Container /- -->
			</div><!-- Menu Block /- -->
		</header><!-- Header /- -->>