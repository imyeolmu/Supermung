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
								<label for="reg-fn">이름</label> <input class="form-control user_input"
									type="text" name="name" required>
									<span class="final_name_ck">이름을 입력해주세요</span>
							</div>
						</div>

						<div class="col-sm-6">
							<div class="form-group">
								<div>

									<label for="reg-fn">아이디</label> 
										<input class="form-control id_input" type="text" name=id> 
										<span class="id_input_re_1">사용 가능한 아이디 입니다</span> 
										<span class="id_input_re_2">아이디가 이미 존재합니다</span>
										<span class="final_id_ck">아이디를 입력해주세요</span>
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label for="reg-pass">비밀번호</label>
								 <input class="form-control pw_input "type="password" name="pw" id="pw" onchange="check_pw()"autocomplete="off" required>
								 <span class="final_pw_ck">비밀번호를 입력해주세요</span>
							</div>
						</div>

						<div class="col-sm-6">
							<div class="form-group">
								<label for="reg-pass-confirm">비밀번호 확인</label> 
								<input class="form-control pwck_input" type="password"   id="pw2" onchange="check_pw()">&nbsp;<span id="check"></span>
								<span class="final_pwck_ck">비밀번호 확인을 입력해주세요</span>
								<span class="pwck_input_re_1">비밀번호가 일치합니다</span>
								<span class="pwck_input_re_2">비밀번호가 일치하지 않습니다</span>
							</div>
						</div>

						<div class="col-sm-6">
							<div class="form-group">
								<label for="reg-pass-confirm">생년월일</label> 
								<input class="form-control" type="text" name="birth" placeholder="ex)1997-03-31">
							</div>
						</div>



						<div class="col-sm-6 ">
							<div class="form-group">
								<label for="reg-pass-confirm ">성별</label> 
								<div class="d-flex mt-3">
								<label><input type="radio" name="gender" value="여자">여자</label>								
								 <label><input type="radio" name="gender" value="남자">남자</label>
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
								<span class="final_mail_ck">이메일을 입력해주세요</span>
							   <span class="mail_input_box_warn"  style= "color:red;"></span>
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
								<input class="form-control address_input_3"  name="addr3" placeholder="상세주소를 입력하세요" >
								<span class="final_addr_ck">상세주소를 입력해주세요</span>
							</div>
						</div >
						<div class="button">
						<input  type ="button" class="join_btn btn" value="가입하기">
						</div>
						<!-- <div class="button">
							<button id="join_btn" class="btn">가입 완료</button>
						</div> -->
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
    
    //유효성 검사 통과 유무
    var idCheck = false; //아이디
    var idckCheck = false; //아이디 중복검사
    var pwCheck = false; //비밀번호
    var pwckCheck = false;//비밀번호확인
    var pwckcorCheck = false; //비밀번호일치확인
    var nameCheck = false; //이름
    var mailCheck = false;//이메일
    var mailnumCheck = false;//이메일 인증번호 확인
    var addressCheck = false;//주소
    
    
    $(document).ready(function(){
    	
    	$(".join_btn").click(function(){
    		
    		//입력값 변수
    		
    		var id = $('.id_input').val();
    		var pw = $('.pw_input').val();
    		var pwck = $('.pwck_input').val();
    		var name = $('.user_input').val();
    		var mail = $('.mail_input').val();
    		var addr = $('.address_input_3').val();
    		
    		
    		/*아이디 유효성 검사  */
    		
    		if(id ==""){
    			$('.final_id_ck').css('display','inline-block');
    			idCheck = false;
    		}else{
    			$('.final_id_ck').css('display','none');
    			idCheck = true;
    			
    		}
    		/* 비밀번호 유효성 */
    		
    		if(pw ==""){
    			$('.final_pw_ck').css('display','inline-block');
    			pwCheck = false;
    		}else{
    			$('.final_pw_ck').css('display','none');
    			pwCheck = true;
    			
    		}
    		
  		/* 비밀번호확인 유효성 */
    		
    		if(pw ==""){
    			$('.final_pwck_ck').css('display','inline-block');
    			pwckCheck = false;
    		}else{
    			$('.final_pwck_ck').css('display','none');
    			pwckCheck = true;
    			
    		} 
 		
  		/*이름 유효성 검사  */
  		
    		 if(name ==""){
    			$('.final_name_ck').css('display','inline-block');
    			nameCheck = false;
    		}else{
    			$('.final_name_ck').css('display','none');
    			nameCheck = true;
    			
    		} 
  		/*이메일 유효성 검사  */
	  		
    		 if(mail ==""){
     			$('.final_mail_ck').css('display','inline-block');
     			mailCheck = false;
     		}else{
     			$('.final_mail_ck').css('display','none');
     			mailCheck = true;
     			
     		} 
  		
  		
  		/* 주소 유효성 검사 */
  		
    		 if(addr ==""){
      			$('.final_addr_ck').css('display','inline-block');
      			addressCheck = false;
      		}else{
      			$('.final_addr_ck').css('display','none');
      			addressCheck = true;
      			
      		} 
  		
  	     if(idCheck&&idckCheck&&pwCheck&&pwckCheck&&pwckcorCheck&&nameCheck&&mailCheck&&addressCheck){
  	    	 
  	    	 $("#joinForm").attr("action","/client-register");
  	    	$("#joinForm").submit();
  	     }
  		 
  		return false;
    		
    	});
    	
    });
    
    // 아이디 중복검사
    
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
			    		idckCheck = true;
				} else {
						$('.id_input_re_2').css("display", "inline-block");
						$('.id_input_re_1').css("display", "none");		
						idckCheck = false;
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
        
       /*   if(document.getElementById('pw').value !='' && document.getElementById('pw2').value!=''){
            if(document.getElementById('pw').value==document.getElementById('pw2').value){
                document.getElementById('check').innerHTML='';
                document.getElementById('check').style.color='';
            }
            else{
                document.getElementById('check').innerHTML='';
                document.getElementById('check').style.color='';
            } */
        }
    } 
    /* 이메일 인증번호 */
    
	 $(".mail_check_button").click(function(){
	     
	     var email = $(".mail_input").val();        //입력한 이메일
	     var ceBox  = $(".mail_check_input"); //인증번호 입력란
	     var boxWrap = $(".mail_check_input_box"); //인증번호 입력란 박스
	     var warnMsg = $(".mail_input_box_warn"); // 이메일 입력 경고글
	     
	     
	     if(mailFormCheck(email)){
	         warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
	         warnMsg.css("display", "inline-block");
	      
	     } else {
	         warnMsg.html("올바르지 못한 이메일 형식입니다.");
	         warnMsg.css("display", "inline-block");
	         return false;
	     }    
	  
	  
	     
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
	         mailnumCheck = true;
	     } else {                                            // 일치하지 않을 경우
	         checkResult.html("인증번호를 다시 확인해주세요.");
	         checkResult.attr("class", "incorrect");
	         mailnumCheck = false;
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
	
		  
			 /* 비밀번호 확인 일치 유효성 검사 */
			  $('.pwck_input').on("propertychange change keyup paste input", function(){
				 
				 var pw = $('.pw_input').val();
				 var pwck = $('.pwck_input').val();
				 $('.final_pwck_ck').css('display', 'none');
				
			 if(pw == pwck){				 
					$('.pwck_input_re_1').css("display", "block");
		    		$('.pwck_input_re_2').css("display", "none");		
		    		pwckcorCheck = true;
			} else {
					$('.pwck_input_re_1').css("display", "none");
					$('.pwck_input_re_2').css("display", "block");		
					pwckcorCheck = false;
				 }
				 
				 
				 
			 });  
			 

			  function mailFormCheck(email){
				    var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
				    return form.test(email);
				}
				 
	  
			
		  
     
</script>


<%@ include file="../inc/footer.jsp"%>