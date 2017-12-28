<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Footer Main 1 -->
		<footer id="footer-main" class="footer-main footer-main-1 services-section container-fluid">
			<!-- Container -->
                <div class="container">
                    <div class="row">
                        <div class="section-header">
                            <h3>聯絡我們</h3>
                            <p>Contact-us</p>
                        </div>
                        <!-- Widget About -->
                        <aside class="col-md-6 col-sm-6 col-xs-12 ftr-widget widget_about">

                            <a href="index.jsp" title="Postnatal Care Center">P<span >ostnatal</span> C<span>are</span> C<span>enter</span></a>
                            <div class="info">
                                <p><i class="icon icon-Pointer"></i>106台北市大安區復興南路一段390號 2樓</p>
                                <p class="phone"><i class="icon icon-Phone2"></i>(02) 6631 6666</p>
                                <p><i class="icon icon-Imbox"></i>eeit98team05@outlook.com</p>
                            </div>

                        </aside>
                        <!-- Widget About /- -->
                        <!-- Widget Newsletter -->
                        <form action="#" method="post" name="contact-form" class="col-md-6 col-sm-6 col-xs-12" id="main-contact-form ">
                            <div class="form-group">
                                <input type="email" required="" placeholder="Email" class="form-control" name="email">
                            </div>
                            <div class="form-group">
                                <textarea required="" placeholder="Message" rows="8" class="form-control" name="message"></textarea>
                            </div>
                            <button class="btn btn-default form-control footer-send " type="button"><i class="fa fa-paper-plane-o"></i> 送出</button>
                        </form>
                        <div class="copyright-section">
                            <div class="coyright-content">
                                <p>© Postnatal Care Center. all rights reserved</p>
                            </div>
                            <ul>
                                <li><a href="#" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#" title="Twitter"><i class="fa fa-twitter"></i></a></li>

                            </ul>
                        </div>
                        <!-- Widget Newsletter /- -->
                    </div>
                </div>
                <!-- Container /- -->
		</footer><!-- Footer Main 1 -->
						<!-- User Login Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">登入</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form id="formid">
									<div class="form-group">
										<label for="memberId" class="col-form-label">帳號:</label> <input
											type="text" class="login-pop" id="memberId" name="memberId">
										<div id="memberId-error"></div>
									</div>
									<div class="form-group">
										<label for="password" class="col-form-label">密碼:</label> <input
											type="password" class="form-control login-pop" id="password"
											name="password">
										<div id="password-error"></div>
										<!-- 												<textarea class="form-control" id="message-text"></textarea> -->
									</div>
								</form>
							</div>
								<!-- google -->
<!-- 								<div class="g-signin2" data-onsuccess="onSignIn"></div> -->
							<div id="pop" class="modal-footer">
							<div id="my-signin2"></div><div id="out"></div>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">取消</button>
								<button type="button" id="sub" class="btn btn-primary">登入</button>
							</div>
							<input id="save" value="${member.role}" style="display:none;"></input>
						</div>
					</div>
				</div>
<!-- google login -->		
<script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>