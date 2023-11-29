<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<%@ include file="/resources/header.jspf" %>
<style>
*{
	padding:0;
	margin:0;
	border:none;
	list-style:none;
}
.joinEdit{
	font-size:15px;
	margin-top:150px;
	margin-bottom:50px;
	width:600px;
	height:100%;
	padding:50px;
	box-sizing:border-box;
	margin:0 auto;
}
h1{
	text-align:center;
	color:#696969;
	margin-top:100px;
}
.title_wrap{
	display:flex;
}
.dot{
	margin:25px 5px 0 0;
	color:#FF7100;
	font-weight:bold;
}
.title{
	margin-top:25px;
	color:#6e6e6e;
	font-size:13px;
}
input[type="text"], input[type="password"]{
	width:100%;
	height:50px;
	padding: 0 20px;
	box-sizing:border-box;
	margin-bottom:10px;
	border-bottom:#6e6e6e solid 1px;
}
input:focus{
	outline:none;
}
input[type="button"]{
	height:30px;
	line-height:30px;
	padding:0 20px;
	margin-bottom:10px;
}
input[type="submit"]{
	border:none;
	background-color:#FF7100;
	color:white;
	width:100px;
	height:40px;
	line-height:40px;
	border-radius:10px;
	float:right;
}
.edit_btn:hover{
	background-color:#FFA964;
	cursor:pointer;
}
input[type="button"]:hover{
	cursor:pointer;
}
</style>
<script>
//정규표현식
	var reg_pass = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!^%#?&])[A-Za-z\d$@$!%^*#?&]{8,}$/; // 최소 8 자, 최소 하나의 문자, 하나의 숫자 및 하나의 특수 문자 
	var reg_phone = /^\d{3}-\d{4}-\d{4}$/;
	var reg_nickname = /^[가-힣\dA-Za-z\d$@$!%^*#?&]{2,20}$/;
	var reg_addr = /^[가-힣]{5,100}$/;
	
	function keyevent(){
		const pass_element = document.getElementById('login_param_check_txt_pass');
		const pass_chk_element = document.getElementById('login_param_check_txt_pass_chk');
	    const phone_element = document.getElementById('login_param_check_txt_phone');
	    const login_otp_element = document.getElementById('otp_request');
	    const value_element = document.getElementById('login_param_check_txt_value');
	
		 // 비밀번호
		$('#user_password').keyup(function(){
	         var txt_val = $('#user_password').val();
	         var txt_val_chk = $('#user_password_chk').val();
	         
	         if(!reg_pass.test(txt_val)){
	            pass_element.style.color="red";
	            pass_element.innerHTML= "비밀번호는 최소 8 자, 최소 하나의 문자, 숫자, 특수문자가 포함되어야 해요 !";
	         }else{
	            if(txt_val_chk.length > 0 && (!(txt_val == txt_val_chk))){
	               pass_element.style.color="red";
	               pass_element.innerHTML= "비밀번호와 재확인 비밀번호와 값이 달라요 .";
	            }else{
	               pass_element.style.color="blue";
	               pass_element.innerHTML= '비밀번호를 올바르게 입력했어요 !';
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
	               pass_chk_element.innerHTML= '비밀번호 재확인되었어요 !';
	            }else{
	               pass_chk_element.style.color="red";
	               pass_chk_element.innerHTML= "비밀번호를 먼저 입력해주세요 .";
	            }
	         }
	      });
		
	  	 // 닉네임
	      $('#nickname').keyup(function(){
	    	  $("#nicknameStatus").val("N");
	      }); 
	   	
	      // 전화번호
	      $('#phone_number').keyup(function(){
	         var txt_val = $('#phone_number').val().replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
	         var txt_sub = txt_val.substr(0,3);
	         $("#phoneStatus").val("N");
	         
	         if(!reg_phone.test(txt_val) || txt_sub !='010'){
	            phone_element.style.color="red";
	            phone_element.innerHTML='010부터 하이폰 (-) 없이 입력해야 해요 !';
	         }else{
	            phone_element.style.color="blue";
	            phone_element.innerHTML=  '인증버튼을 눌러주세요   ';
	         }
	      });
	
	}

		function edit_event(){
			
			var pass_val = $('#user_password').val();
			var pass_chk_val = $('#user_password_chk').val();
			var nickname_val = $('#nickname').val();
	        var phone_val = $('#phone_number').val().replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
	        var address_val = $('#address').val();
	        
	        if(id_val=="" || pass_val=="" || pass_chk_val=="" || name_val=="" || nickname_val=="" || 
	        		  email_val=="" || phone_val=="" || address_val==""){
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
	          
	          $("#joinEditForm").attr("action", "joinEditOk");
	          $("#joinEditForm").submit();
		}
		
		// 닉네임 중복검사
		function nickname_double_chk(){
			if($("#nickname").val()!=""){
				window.open("/register/nicknameCheck?nickname="+$("#nickname").val(), "chk", "width=400, height=300");
			}else{
				alert("닉네임을 입력 후 중복검사하세요.");
			}
		}
		// 전화번호 DB에 이미 등록되어있는지 확인
		function phone_chk(){
			if($("#phone_number").val()!=""){
				window.open("/register/phoneCheck?phone_number="+$("#phone_number").val(), "chk", "width=400, height=300");
			}else{
				alert("전화번호를 입력 후 인증버튼을 눌러주세요.");
			}
		}
	
</script>


<div class="joinEdit">
<h1>회원정보 수정</h1>
<div style="border-top:1px solid #ddd; width:500px; margin:20px auto 100px auto; "></div>
	<form method="post" id="joinEditForm" action="joinEditOk">
		<div class="title_wrap">
			<div class="dot">*</div>
			<div class="title">아이디</div>
		</div>
		<input type="text" name="user_id" id="user_id" value="${dto.user_id }" readonly/>
		<div class="title_wrap">
			<div class="dot">*</div>
			<div class="title">비밀번호</div>
		</div>
		<div>
		<input type="password" id="user_password" name="user_password" class="" onkeyup="keyevent(this)"  autocomplete='off'/>
		    <div class="login_param_check" id="login_pass_param_check">
               	<span id="login_param_check_txt_pass" class="login_param_check_txt" ></span>
               </div>
           </div>
        <div class="title_wrap">
			<div class="dot">*</div>
	        <div class="title">비밀번호 확인</div>
        </div>
           <div>
           	<input type="password" id="user_password_chk" name="user_password_chk" class="" onkeyup="keyevent(this)" autocomplete='off'/>
			<div class="login_param_check" id="login_pass_param_check">
               	<span id="login_param_check_txt_pass_chk" class="login_param_check_txt" ></span>
               </div>
           </div>
        <div class="title_wrap">
			<div class="dot">*</div>
			<div class="title">이름</div>
		</div>
		<div><input type="text" name="user_name" id="user_name" value="${dto.user_name }" readonly/></div>
		<div class="title_wrap">
			<div class="dot">*</div>
			<div class="title">닉네임</div>
		</div>
		<div>
			<input type="text" id="nickname" name="nickname" class="" placeholder="닉네임" value="${dto.nickname}" onkeyup="keyevent(this)" autocomplete='off'/>
			<input type="button" value="닉네임중복검사" onclick="nickname_double_chk()"/>
			<input type="hidden" id="nicknameStatus" value="N"/>
		
		</div>
		<div class="title_wrap">
			<div class="dot">*</div>
			<div class="title">연락처</div>
		</div>
		<div>
			<input type="text" id="phone_number" name="phone_number" class="" placeholder="휴대폰번호( - 없이 입력)" value="${dto.phone_number }" onkeyup="keyevent(this)" autocomplete='off'/>
			<input type="button" value="인증" onclick="phone_chk()"/>
			<input type="hidden" id="phoneStatus" value="N"/>
			<div class="login_param_check" id="login_pass_param_check">
               	<span id="login_param_check_txt_phone" class="login_param_check_txt" ></span>
               </div>
		</div>
		<div class="title_wrap">
			<div class="dot">*</div>
			<div class="title">이메일</div>
		</div>
		<div><input type="text" name="email" id="email" value="${dto.email }"/></div>
		<div>
		<input type="submit" class="edit_btn" value="회원정보수정" onclick="edit_event()"/>
		</div>
	</form>
</div>
<footer>
	<div id="footer" style="width:100%; height:25%; background:rgb(49,55,63); bottom:0; margin-top:300px; font-size:14px;">
		<div style="color:#fff;"><img src="/img/logo_r.png" style="width:90px; height:45px; margin-top:30px; margin-left:20px;"> | 개인정보처리방침 | 이용약관</div>
		<div style="color:#fff; margin-top:40px; margin-left:20px;">
			(주)먹스케쥴 [mukschedule@gmail.com]<br/>
			<p style="margin-bottom:5px;">Developers<br/></p>
			<a href="https://github.com/kwh1208>Kwon"> woohyun</a> |
			<a href="https://github.com/yongtae>Kim"> yongtae</a> |
			<a href="https://github.com/soomin>Cheon"> soomin</a> |
			<a href="https://github.com/wldbs98>Hyun"> Jiyoon</a>
		</div>
	</div>
</footer>
</body>
</html>