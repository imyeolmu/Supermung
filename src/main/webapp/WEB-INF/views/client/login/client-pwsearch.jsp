<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../inc/client-header.jsp"%>

<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


    
       
  <div class="account-login section">
    <div class="container">
        <div class="row">
            <div class="col-lg-5 offset-lg-3 col-md-10 offset-md-1 col-11">
                <div class="register-form">
                   <div class="title"> 
                        <h3 class="ms-4"> 아이디 혹은 비밀번호를 잊어버리셨나요?</h3>
                       
                    </div>
                    <form class="row" id="join_form" method="post">

						<div class="col-sm-12">
							<div>

								<input class="form-control" type="text" name="name" required
									placeholder="회원가입시 입력한 이메일을 입력해주세요">
							</div>
						</div>
						
                    <div class="col-sm-4">

                    </div>
                    <div class="button">
                        <button type="button" class="btn " onclick="join_daum_address();">패스워드재설정받기</button>
                    </div>
             
                     
            
                </div>
            </div>
        </div>
    </div>
</div>
    
    
  <%@ include file="../inc/footer.jsp"%>