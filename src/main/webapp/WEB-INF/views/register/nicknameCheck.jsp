<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	header{
		display:none;
	}
</style>
<script>
	function setNickname(nickname){
		opener.document.getElementById("nickname").value = nickname;
		opener.document.getElementById("nicknameStatus").value = "Y";

		window.close(); 
	}
</script>
<div class="container">
	<div>
		<c:if test="${result==0 }">
			<b>${nickname }</b>은(는) 사용가능한 닉네임입니다.
			<input type="button" value="사용하기" onclick="setNickname('${nickname}')"/>
		</c:if>
		
		<c:if test="${result>0 }">
			<b>${nickname}</b>은(는) 사용불가능한 닉네임입니다.
		</c:if>
	</div>
	<hr/>
	<div>
		<form>
			닉네임 입력: <input type="text" name="nickname" id="nickname"/>
			<input type="submit" value="중복검사"/>
		</form>
	</div>
</div>
</body>
</html>