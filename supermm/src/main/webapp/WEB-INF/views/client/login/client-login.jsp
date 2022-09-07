<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/client-header.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script> 


<!-- Start Account Login Area -->
<div class="account-login section">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
				<form class="card login-form" id="login_form" method="post">
					<div class="card-body">
						<div class="title">
							<h3 class="text-center">로그인</h3>
						</div>
						<div>
							<div class="form-group input-group">
								<label>아이디</label>
								 <input class="form-control id-input"name="id" required>
							</div>
							<div class="form-group input-group">
								<label>비밀번호</label> 
								<input class="form-control" name="pw" type="password" required>
						<c:if test="${result == 0}">
							<div class="mt-3 text-danger">사용자 ID또는 비밀번호를 잘못 입력하셨습니다</div>
						</c:if>
							</div>
						</div>
						<div class="d-flex flex-wrap justify-content-between bottom-content">
							<a class="lost-pass" href="client-pwsearch">비밀번호를 잊어버렸어요</a>
						</div>
						<div class="button">
							<button class="btn login_button">로그인</button>
						</div>
						<p class="outer-link">
							회원가입이 필요하신가요? <a href="client-register">회원가입</a>
						</p>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
    $(".login_button").click(function(){
    	
    	alert("로그인 버튼 작동");
    
    	$("#login_form").attr("action","/clinet-login");
    	$("#login_form").submit();    	
    });
    

	});
});
    
		
		

    
    

</script>
    
    
    
    <!-- End Account Login Area -->
    <%@ include file="../inc/footer.jsp"%>