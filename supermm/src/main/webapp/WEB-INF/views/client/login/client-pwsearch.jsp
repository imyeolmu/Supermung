<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ include file="../inc/client-header.jsp"%>

<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="crossorigin="anonymous"></script>
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
                  <h3 class="text-center">비밀번호를 까먹었멍?</h3>
               </div>
               <form class="row" id="updateForm" method="post">
                  <div class="col-sm-12">
                     <div class="form-group mail_input_box">
                        <label for="reg-pass">이메일</label> <input
                           class=" form-control mail_input" name="email" required
                           placeholder="ex)supermung123@gmail.com"> <span
                           id="mail_input_box_warn"></span>
                     <span class="mail_input_re_1"  style="display:none; color:red;">가입시 입력하신 이메일이 없습니다</span>
                     <span class="mail_input_re_2" style="display:none; color:green;">이메일을 확인했습니다 인증번호를 인증해주세요</span>
                     <span class="final_mail_ck" style="display:none;">이메일을 입력해주세요.</span>
                     </div>
                  </div>
                  <div class="col-sm-8 mt-2">
                     <div class="form-group mail_check_wrap">
                        <div class="mail_check_input_box"
                           id="mail_check_input_box_false">
                           <input class="form-control mail_check_input"
                              disabled="disabled">
                        </div>
                        <span id="mail_check_input_box_warn"></span>
                     </div>
                  </div>

                  <div class="col-sm-3">
                     <div class="button mail_check_button">
                        <a class="btn ms-2 ">인증번호</a>
                     </div>
                  </div>

                  <div class="col-sm-6">
                     <div class="form-group">
                        <label for="reg-pass">새비밀번호</label> <input class="form-control "
                           type="password" name="pw" id="pw" onchange="check_pw()"
                           autocomplete="off" required>

                     </div>
                  </div>
                  <div class="col-sm-6">
                     <div class="form-group">
                        <label for="reg-pass-confirm">비밀번호 확인</label> <input
                           class="form-control" type="password" id="pw2"
                           onchange="check_pw()">&nbsp;<span id="check"></span>
                     </div>
                  </div>


                  <div class="button">
                     <button class="btn" >로그인하러가기</button>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </div>
</div>

<script type="text/javascript">
   
    var code= "";

  
   $('.mail_input').on('input propertychange paste', function(){
          
       
          
         var email = $('.mail_input').val();
          var data = {email : email}
                                    
          $.ajax({
            type : "post",
            url : "/membereChk",
            data: data,
            
            success:function(result){
                                                 
               if(result != 'fail'){
                   $('.mail_input_re_1').css("display", "inline-block");
                    $('.mail_input_re_2').css("display", "none");         
            } else {
               
                  $('.mail_input_re_2').css("display", "inline-block");
                  $('.mail_input_re_1').css("display", "none");   
            }
                                
      }
                                        
      }); 
                                     
    });
    

    /*비밀번호 유효성  */
    
    function check_pw(){
       
        var pw = document.getElementById('pw').value;
        var SC = ["!","@","#","$","%"];
        var check_SC = 0;
        var login

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
   
    
   
    

 
       
</script>


<%@ include file="../inc/footer.jsp"%>