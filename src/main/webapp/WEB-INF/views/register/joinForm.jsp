<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/header.jspf" %>
<link type="text/css" rel="stylesheet" href="/style/joinFormStyle.css"/>

<script>
	// 정규표현식
	var reg_id = /^[A-Za-z]{1}\w{7,14}$/;
	var reg_pass = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!^%#?&])[A-Za-z\d$@$!%^*#?&]{8,}$/; // 최소 8 자, 최소 하나의 문자, 하나의 숫자 및 하나의 특수 문자 
	var reg_name = /^[가-힣]{2,5}$/;
	var reg_email = /^([0-9a-zA-Z_-]+){3,20}@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/; // 이메일 형식 + @ 앞에 길이제한 3,20
	var reg_phone = /^\d{3}-\d{4}-\d{4}$/;
	var reg_nickname = /^[가-힣\dA-Za-z\d$@$!%^*#?&]{2,20}$/;

	var chk_num = 0;
	
	function keyevent(){
		
		const id_element = document.getElementById('login_param_check_txt_id');
	    const pass_element = document.getElementById('login_param_check_txt_pass');
	    const pass_chk_element = document.getElementById('login_param_check_txt_pass_chk');
	    const name_element = document.getElementById('login_param_check_txt_name');
	    const email_element = document.getElementById('login_param_check_txt_email');
	    const phone_element = document.getElementById('login_param_check_txt_phone');
	    const login_otp_element = document.getElementById('otp_request');
	    const value_element = document.getElementById('login_param_check_txt_value');
	    
		
		// 아이디
		$('#user_id').keyup(function(){
	       var txt_val = $('#user_id').val();
	       $("#idStatus").val("N");
	       
	       if(!reg_id.test(txt_val)){
	          id_element.style.color="red";
	          id_element.innerHTML= "아이디의 첫번째 문자는 영어대소문자로 작성해야하며,\n영대소문자, 숫자, _ 가 포함가능하고 길이는 8~15글자이어야 해요 .";
	       }else{
	          id_element.style.color="blue";
	          id_element.innerHTML= '아이디를 올바르게 입력 했어요 !';
	       }
	    });
		
		// 비밀번호
		$('#user_password').keyup(function(){
	         var txt_val = $('#user_password').val();
	         var txt_val_chk = $('#user_password_chk').val();
	         
	         if(!reg_pass.test(txt_val)){
	            pass_element.style.color="red";
	            pass_element.innerHTML= "비밀번호는 최소 8 자, 최소 하나의 문자,숫자,특수문자가 포함 되어야해요 !";
	         }else{
	            if(txt_val_chk.length > 0 && (!(txt_val == txt_val_chk))){
	               pass_element.style.color="red";
	               pass_element.innerHTML= "비밀번호와 재확인 비밀번호와 값이 달라요 .";
	            }else{
	               pass_element.style.color="blue";
	               pass_element.innerHTML= '비밀번호를 올바르게 입력 했어요 !';
	            }
	         }
	      });
	      
	      // 비밀번호 재확인
	      $('#user_password_chk').keyup(function(){
	         var txt_val = $('#user_password').val();
	         var txt_val_chk = $('#user_password_chk').val();
	         
	         if(txt_val.length > 0 && (!(txt_val == txt_val_chk))){
	            pass_chk_element.style.color="red";
	            pass_chk_element.innerHTML= "비밀번호와 재확인 비밀번호와 값이 달라요 .";
	         }else{
	            if(txt_val.length > 0){
	               pass_chk_element.style.color="blue";
	               pass_chk_element.innerHTML= '비밀번호 재확인 되었어요 !';
	            }else{
	               pass_chk_element.style.color="red";
	               pass_chk_element.innerHTML= "비밀번호를 먼저 입력해주세요 .";
	            }
	         }
	      });
	      
	      // 이름
	      $('#user_name').keyup(function(){
	          var txt_val = $('#user_name').val();
	          
	          if(!reg_name.test(txt_val)){
	             name_element.style.color="red";
	             name_element.innerHTML= "이름은 한글 2~5글자만 입력 가능해요 !";
	          }else{
	             name_element.style.color="blue";
	             name_element.innerHTML= '이름을 올바르게 입력 했어요 !';
	          }
	       });
	      
	      // 닉네임
	      $('#nickname').keyup(function(){
	    	  $("#nicknameStatus").val("N");
	      });
	      
	      // 이메일
	      $('#email').keyup(function(){
	          var txt_val = $('#email').val();
	          
	          if(!reg_email.test(txt_val)){
	             email_element.style.color="red";
	             email_element.innerHTML= "이메일 형식으로 @ 앞에 3~20글자만 가능해요 !";
	          }else{
	             email_element.style.color="blue";
	             email_element.innerHTML= '이메일을 올바르게 입력 했어요 !';
	          }
	       });	 
	      
	      // 전화번호
	      $('#phone_number').keyup(function(){
	         var txt_val = $('#phone_number').val().replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
	         var txt_sub = txt_val.substr(0,3);
	         $("#phoneStatus").val("N");
	         
	         if(!reg_phone.test(txt_val) || txt_sub !='010'){
	            phone_element.style.color="red";
	            phone_element.innerHTML='010부터 하이폰 (-) 없이 입력 해야해요 !';
	         }else{
	            phone_element.style.color="blue";
	            phone_element.innerHTML=  '전화번호를 올바르게 입력했어요 !    ';
	         }
	      });
	}
	
    // 아이디 중복검사
   	function id_double_chk(){
		if($("#user_id").val()!=""){
			window.open("/register/idCheck?user_id="+$("#user_id").val(), "chk", "width=400, height=300") ;
		}else{
			alert("아이디를 입력 후 중복검사하세요.");
		}
	}
	// 닉네임 중복검사
	function nickname_double_chk(){
		if($("#nickname").val()!=""){
			window.open("/register/nicknameCheck?nickname="+$("#nickname").val(), "chk", "width=400, height=300");
		}else{
			alert("닉네임을 입력 후 중복검사하세요.");
		}
	}

	// 전화번호 인증번호 요청
	var randomNum;
	
	function phone_chk(){
		
		var t = $('#phone_number').val().replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1$2$3`);
		
		
		if(t.length != 11 || $("#phone_number").val()==""){
			alert('전화번호를 확인해주세요 ! ');
		}else{
			if(!randomNum){
				randomNum = Math.floor(Math.random() * 900000) + 100000;
				
				var url = "smssend";
			   
		       $.ajax({
		         type: "POST",
		         url: url,
		         dataType: "text",
		         data : {
		             "phone_number" : t,
		             "randomNum" : randomNum
		         },
		         success: function(response) {    /* ajax 요청 Success 시 , 발생되는 func */
		        	 alert(response);	 
		        	 $('#create_timer').css("display" , 'block');
		         	 $("#otp").css("display", "block");
		         	 $("#login_otp").attr("disabled", true);
		         	 
		         	var time = 180;
		            var min = "";
		            var sec = "";
		            
		            var timer = setInterval(function(){
		                min = parseInt(time/60);
		                sec = time%60;
		                
		                document.getElementById('create_timer').innerHTML = min + "분 " + sec + "초";
		                time --;
		                
		                if( time < 0 ){
		                    clearInterval(timer);
		                    alert('인증 시간이 초과되었어요');
		                    $('#otp').css('display','none');
		                    $('#create_timer').css("display" , 'none');
		                    $('#login_otp').attr("disabled" , false);
		                    $("#otp").val('');
		                    $("#otp").focus();
		                    randomNum = "";
		                    return false;
		                 }
		              }, 1000);
		         	 
		            $('#otp').off('keyup');
		            
		            if(randomNum !== ""){
			         	 $('#otp').on('keyup', function(){
			         		 
			         		 var otpNum = $("#otp").val();
			         		 
				         	 if(otpNum.length == 6 && otpNum == randomNum){
				         		 alert("인증에 성공했어요 ! ");
				         		 $("#otp").attr("readonly", true); 
				         		 $("#phoneStatus").attr("value", "Y");
				         		 clearInterval(timer);
				         		 $('#create_timer').css("display" , 'none');
				         	 }else if(otpNum.length == 6 && otpNum != randomNum ){

				         		 chk_num++;
				       			 
				       			 if(chk_num  > 4){
				       				 alert('인증번호 5회 이상 인증에 실패했습니다.');
				       				 window.location.reload();
				       			 }else{
				         		 	 alert("인증번호가 일치하지 않습니다.");				       				 
				       			 }
				       			 
				         	 }
			         		 
			         	 });
		            }
		         },
		         beforeSend:function(response){ /* ajax send 시 , 발생되는 func || mask처리 */
		         },
		         complete:function(response){ /* ajax send 시 , 실행 완료 후 발생되는  func || mask처리 */
		         },
		         error: function(response) { /* ajax 요청 Fail 시 , 발생되는 func */
		            alert('통신 과정에서 오류가 발생하였습니다.\n다시 시도해주세요 !');
		         }
		      }); 
		    }
		}
	}
	
	
	
	      // 회원가입
	      function new_face_event(){
	          
	          var id_val = $('#user_id').val();
	          var pass_val = $('#user_password').val();
	          var pass_chk_val = $('#user_password_chk').val();
	          var name_val = $('#user_name').val();
	          var nickname_val = $('#nickname').val();
	          var email_val = $('#email').val();
	          var phone_val = $('#phone_number').val().replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
	         

	          if(id_val=="" || pass_val=="" || pass_chk_val=="" || name_val=="" || nickname_val=="" || 
	        		  email_val=="" || phone_val=="" ){
	        	  alert("모든 항목을 입력해주세요.");
	        	  return;
	          }
	          if(pass_val != pass_chk_val){
	        	  alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
	        	  return;
	          }
	          if(!reg_email.test(email_val)){
	        	  alert("이메일 형식이 올바르지 않습니다.");
	        	  return;
	          }
	          
	          if($("#idStatus").val()=="N"){
					alert("아이디 중복검사를 하세요");
					return;
			  }
	          if($("#nicknameStatus").val()=="N"){
					alert("닉네임 중복검사를 하세요");
					return;
			  }
	          if($("#phoneStatus").val()=="N"){
					alert("전화번호 인증번호 요청 버튼을 눌러주세요");
					return;
			  }
	          
	          
	          $("#joinForm").attr("action", "joinOk");
	          $("#joinForm").submit();
	       }
	    

	      // 작성 취소
		   function cancel() {
			   // alert 창 띄우기
			   alert("작성을 취소하시겠습니까?");
			   // 이전 페이지로 돌아가기
			   window.location.href="/register/joinForm";
		   }
</script>
<div class="all">
<div class="join">
	<h1>회원가입</h1>
	<form method="post" id="joinForm">
		<ul>
			<li>
				<input type="text" id="user_id" name="user_id" class="" placeholder="아이디" onkeyup="keyevent(this)" autocomplete='off'/>
				<input type="button" value="아이디중복검사" onclick="id_double_chk()"/>
				<input type="hidden" id="idStatus" value="N"/>
				<div class="login_param_check" id="login_pass_param_check">
                	<span id="login_param_check_txt_id" class="login_param_check_txt" ></span>
                </div>
			</li>
			<li>
				<input type="password" id="user_password" name="user_password" class="" placeholder="비밀번호" onkeyup="keyevent(this)"  autocomplete='off'/>
			    <div class="login_param_check" id="login_pass_param_check">
                	<span id="login_param_check_txt_pass" class="login_param_check_txt" ></span>
                </div>
			</li>
			<li>
				<input type="password" id="user_password_chk" name="user_password_chk" class="" placeholder="비밀번호확인" onkeyup="keyevent(this)" autocomplete='off'/>
				<div class="login_param_check" id="login_pass_param_check">
                	<span id="login_param_check_txt_pass_chk" class="login_param_check_txt" ></span>
                </div>
			</li>
			<li>
				<input type="text" id="user_name" name="user_name" class="" placeholder="이름" onkeyup="keyevent(this)" autocomplete='off'/>
			 	<div class="login_param_check" id="login_pass_param_check">
                	<span id="login_param_check_txt_name" class="login_param_check_txt" ></span>
                </div>
			</li>
			<li>
				<input type="text" id="nickname" name="nickname" class="" placeholder="닉네임" onkeyup="keyevent(this)" autocomplete='off'/>
				<input type="button" value="닉네임중복검사" onclick="nickname_double_chk()"/>
				<input type="hidden" id="nicknameStatus" value="N"/>
			</li>
			<li>
				<input type="text" id="email" name="email" class="" placeholder="이메일" onkeyup="keyevent(this)" autocomplete='off'/>
			    <div class="login_param_check" id="login_pass_param_check">
                	<span id="login_param_check_txt_email" class="login_param_check_txt" ></span>
                </div>
			</li>
			<li>
				<input type="text" id="phone_number" name="phone_number" class="" placeholder="휴대폰번호( - 없이 입력)" onkeyup="keyevent(this)" autocomplete='off'/>
				<input type="button" id="login_otp" class="login_otp" value="인증번호요청" onclick="phone_chk()"/>
				<input type="hidden" id="phoneStatus" value="N"/>
				<div class="login_param_check" id="login_pass_param_check">
                	<span id="login_param_check_txt_phone" class="login_param_check_txt" ></span>
                </div>
                <input type="text" id="otp" name="otp" placeholder="인증번호 입력" onkeyup="otpCheck(this)" autocomplete='off' style="display:none;"/>
				<div class="timer" id="timer" style="padding-bottom:30px;">
                	<div id="create_timer" class="timer"></div>
                </div>
			</li>
			<li>성별</li>
			<li style="margin-top:10px; margin-bottom:30px;">
				<input type="radio" name="gender" value="1"/>남
				<input type="radio" name="gender" value="0"/>여
			</li>
			<li>계정 유형 선택</li>
			<li style="margin-top:10px; margin-bottom:10px;">
				<input type="radio" name="is_owner" value="1"/>사장님
				<input type="radio" name="is_owner" value="0"/>고객
			</li>
		</ul>
	</form>
	<div class="btn">
    	<input type="button" value="취소하기" class="btn1" onclick="cancel()" style="height:40px;"/>
		<input type="submit" id="new_face" class="new_face_btn" value="회원가입" onclick="new_face_event()"/> 
	</div>	
</div>
</div>

<%@ include file="/resources/footer.jspf" %>
</body>
</html>