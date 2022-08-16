<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../inc/client-header.jsp"%>

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="${ctx}/resources/css/join.css" />



<div class="account-login section">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
				<div class="register-form">
					<div class="title">
						<h3 class="text-center">회원가입</h3>
					</div>
					<form class="row" id="joinForm" method="post">
						<div class="col-sm-6">
							<div class="form-group">
								<label for="reg-fn">이름</label> <input class="form-control"
									type="text" name="name" required>
							</div>
						</div>

						<div class="col-sm-6">
							<div class="form-group">
								<div>
									<label for="reg-fn">아이디</label> 
									<input class="form-control id_input" type="text" name=id> 
									<span class="id_input_re_1">사용 가능한 아이디 입니다</span> 
									<span class="id_input_re_2">아이디가 이미 존재합니다</span>
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label for="reg-pass">비밀번호</label>
								 <input class="form-control "type="password" name="pw" id="pw" onchange="check_pw()"autocomplete="off" required>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label for="reg-pass-confirm">비밀번호 확인</label> 
								<input class="form-control" type="password"   id="pw2" onchange="check_pw()">&nbsp;<span id="check"></span> 
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label for="reg-pass-confirm">생년월일</label> 
								<input class="form-control" type="text" name="birth" placeholder="ex)1997-03-31">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label for="reg-pass-confirm">성별</label>
								<div class="d-flex mt-3">
								<label><input class="form-check-input me-2" type="radio" name="gender" value="여자">여자</label>								
								 <label><input class="form-check-input me-2" type="radio" name="gender" value="남자">남자</label>
								</div>
							</div>
						</div>
						<div class="col-sm-12">
							<div class="form-group">
								<label for="reg-pass">전화번호</label> <input class="form-control"
									type="tel" name="phone" required
									placeholder="ex) 010-1234-5678">
							</div>
						</div>
						<div class="col-sm-12">
							<div class="form-group mail_input_box">
								 <label for="reg-pass">이메일</label> 
								<input class=" form-control mail_input"  name="email" required placeholder="ex)supermung123@gmail.com">
							 <span id="mail_input_box_warn"></span>
							</div>
						</div>
						<div class="col-sm-8 mt-2" > 
						<div class="form-group mail_check_wrap">
							<div class="mail_check_input_box"  id ="mail_check_input_box_false">
								 <input class="form-control mail_check_input"  disabled="disabled">
							 </div>
							  <span id="mail_check_input_box_warn"></span>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="button mail_check_button">
								<a class="btn ms-3">인증번호</a>
							</div>
						</div>
						<div class="col-sm-8">
							<div class="form-group">
							<label for="reg-pass">주소 </label> 
							<input class="form-control" name="addr1" readonly="readonly">
							</div>
						</div>
						<div class="col-sm-3">
							<div class="button">
								<button type="button" class="btn m-3"
									onclick="join_daum_address();">주소 찾기</button>
							</div>
						</div>
						<div class="col-sm-12 ">
							<div class="form-group">
								<div>
									<label for="reg-pass"></label>
									 <input class="form-control address2" name="addr2" readonly="readonly">
								</div>
							</div>
						</div>
						<div class="col-sm-12">
							<div class="form-group">
								<label for="reg-pass"></label>
								<input class="form-control address3"  name="addr3" placeholder="상세주소를 입력하세요" >
							</div>
						</div>
						<div class="button">
							<button id="join_btn" class="btn">가입 완료</button>
						</div>
						<p class="outer-link">
							로그인이 이미 되어 있으신가요? <a href="client-login">로그인 하기</a>
						</p>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

	<script type="text/javascript">
	
    var code= "";
    
    
	$('.id_input').on('input propertychange paste', function(){
	 		
	    
	    	
		   var id = $('.id_input').val();
		    var data = {id : id}
												
			 $.ajax({
				type : "post",
				url : "/memberIdChk",
				data: data,
				
				success:function(result){
													    		
					if(result != 'fail'){
						$('.id_input_re_1').css("display", "inline-block");
			    		$('.id_input_re_2').css("display", "none");				
				} else {
						$('.id_input_re_2').css("display", "inline-block");
						$('.id_input_re_1').css("display", "none");				
				}
										  
		}
											    	
	   }); 
											    
	 });
	  

    /*비밀번호 유효성  */
    
    function check_pw(){
		 
        var pw = document.getElementById('pw').value;
        var SC = ["!","@","#","$","%"];
        var check_SC = 0;

        if(pw.length < 6 || pw.length>16){
            window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
            document.getElementById('pw').value='';
        }
        for(var i=0;i<SC.length;i++){
            if(pw.indexOf(SC[i]) != -1){
                check_SC = 1;
            }
        }
        if(check_SC == 0){
            window.alert('!,@,#,$,% 의 특수문자가 들어가 있지 않습니다.')
            document.getElementById('pw').value='';
        }
        if(document.getElementById('pw').value !='' && document.getElementById('pw2').value!=''){
            if(document.getElementById('pw').value==document.getElementById('pw2').value){
                document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
                document.getElementById('check').style.color='blue';
            }
            else{
                document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
                document.getElementById('check').style.color='red';
            }
        }
    }
    /* 이메일 인증번호 */
    
	 $(".mail_check_button").click(function(){
	     
	     var email = $(".mail_input").val();        //입력한 이메일
	     var ceBox  = $(".mail_check_input"); //인증번호 입력란
	     var boxWrap = $(".mail_check_input_box"); //인증번호 입력란 박스
	  
	  
	     
	     $.ajax({
	         
	         type:"GET",
	         url:"mailCheck?email=" + email,
	         success:function(data){
	             
	        
	        	 
	             //console.log("data : " + data);
	           
	       		 ceBox .attr("disabled",false);
	             boxWrap.attr("id", "mail_check_input_box_true");
	             code = data;
	         }
	                 
	     });
	     
	 });
	    	 
	 
	 /* 인증번호 비교 */
	 $(".mail_check_input").blur(function(){
	     
	     var inputCode = $(".mail_check_input").val();        // 입력코드    
	     var checkResult = $("#mail_check_input_box_warn");    // 비교 결과     
	     
	     if(inputCode == code){                            // 일치할 경우
	         checkResult.html("인증번호가 일치합니다.");
	         checkResult.attr("class", "correct");        
	     } else {                                            // 일치하지 않을 경우
	         checkResult.html("인증번호를 다시 확인해주세요.");
	         checkResult.attr("class", "incorrect");
	     }    
	     
	 });
	
		    	 
	
		 
		  /*카카오 api  */
		  function join_daum_address(){
			   
			   new daum.Postcode({
			        oncomplete: function(data) {


			       	
		  	    		var addr = ''; // 주소 변수
		                 var extraAddr = ''; // 참고항목 변수

		            
		                 if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                     addr = data.roadAddress;
		                 } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                     addr = data.jibunAddress;
		                 }

		                 // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		                 if(data.userSelectedType === 'R'){
		                     // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                     // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                     if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                         extraAddr += data.bname;
		                     }
		                     // 건물명이 있고, 공동주택일 경우 추가한다.
		                     if(data.buildingName !== '' && data.apartment === 'Y'){
		                         extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                     }
		                     // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                     if(extraAddr !== ''){
		                         extraAddr = ' (' + extraAddr + ')';
		                     }
		                     // 주소변수 문자열 과 참고항목 문자열 합치기 
		                    addr += extraAddr;
		                 
		                 } else {
		                     addr += ' ';
		                 }

		                 // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                 $("[name=addr1]").val(data.zonecode);
		                 $("[name=addr2]").val(addr);
		                 
		                 // 커서를 상세주소 필드로 이동한다.
		          		$("[name=addr3]").attr("readonly",false);
		          		$("[name=addr3]").focus();  
			        	
		
			        	
			       }
		     }).open();
		 }
	
		  
     
</script>


<%@ include file="../inc/footer.jsp"%>