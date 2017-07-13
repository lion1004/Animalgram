<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog" style="margin-top: 100px">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header" style="padding: 35px 50px;">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4>
							<span class="glyphicon glyphicon-lock"></span> Login
						</h4>
					</div>
					<div class="modal-body" style="padding: 40px 50px;">
						<form role="form" name="login_form">
							<div class="form-group">
								<label for="usrname"><span
									class="glyphicon glyphicon-user"></span> Username</label>
									<input type="text" class="form-control" id="usrname" name="idmail"
									placeholder="Enter email">
							</div>
							<div class="form-group">
								<label for="psw"><span
									class="glyphicon glyphicon-eye-open"></span> Password</label>
									<input type="password" class="form-control" id="psw" name="pass"
									placeholder="Enter password">
							</div>
							<button type="button" class="btn btn-success btn-block" id="loginB">
								<span class="glyphicon glyphicon-off"></span> Login
							</button>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger btn-default pull-left"
							data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span> Cancel
						</button>
						<p>
							Not a member? <a href="member_join">Sign Up</a>
						</p>
						<p>
							Forgot <a href="id">Id?  </a> Forgot<a href="pass">Password?</a>
						</p>
					</div>
				</div>

			</div>
		</div>


		<!-- 로그인창 오픈 -->
		<script type="text/javascript">
		
				
			$(document).ready(function() {
				
				
				$("#myBtn").click(function() {
					$("#myModal").modal();
				});
				
				
				$("#loginB").click(function(){
					
					var idmail = $('#usrname').val();
					var pass = $('#psw').val();

					$.ajax({
						url : '/login',
						type : 'post',
						data : 'idmail='+idmail+'&pass='+pass,
						success : function(data){
							location.href="/member/main";
						},
						error : function(data){
							alert("등록되지 않은 회원입니다.");
							
						}
					});
				})
			});
			
			</script>