<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/header.jspf" %>
<style>
	*{
		padding:0;
		margin:0;
		border:none;
	}
	.all{
		font-size:15px;
		margin-top:100px;
	}
	.login{
		width:400px;
		height:350px;
		padding:50px;
		box-sizing:border-box;
		margin:0 auto;
	}
	h1{
		text-align:center;
		font-size:20px;
		color:#FF9139;
		margin-bottom:20px;
	}
	#logFrm>input{
		width:100%;
		height:50px;
		padding: 0 10px;
		box-sizing:border-box;
		margin-bottom:15px;
		border-bottom:#FF7100 solid 2px;
	}
	#logFrm>input::placeholder{
		color:#FFA964;
	}
	#logFrm>input[type="submit"]{
		color:#fff;
		background-color:#FF7100;
		font-size:15px;
		margin-top:20px;
	}
	#find{
		text-align:center;
	}
	#find a, span{
		color:#FFA964;
		text-decoration:none;
	}
	input:focus{
		outline:none;
	}
	#login_btn:hover{
		background-color:#FFA964;
		cursor:pointer;
	}
</style>

<div class="all">
<div class="login">
	<h1>로그인</h1>
	<form method="post" action="loginOk" id="logFrm">
			<input type="text" name="user_id" id="user_id" placeholder="아이디"/>
			<input type="password" name="user_password" id="user_password" placeholder="비밀번호"/>
			<input type="submit" id="login_btn" value="로그인"/>
	</form>
	<div style="margin:0 auto; padding:0;" id="find">
		<a href="/register/idSearchForm">아이디찾기</a>
		<span>/</span>
		<a href="/register/passwordSearchForm">비밀번호찾기</a>
		<span>/</span>
		<a href="/register/joinForm">회원가입</a>
	</div>
</div>
</div>
<footer>
	<div id="footer" style="width:100%; height:25%; background:rgb(49,55,63); bottom:0; margin-top:100px; font-size:14px; position: absolute">
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
	
</body>
</html>