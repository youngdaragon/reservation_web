<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	header{
		display:none;
	}
</style>
<script>
	function setUser_id(user_id){
		opener.document.getElementById("user_id").value = user_id;
		opener.document.getElementById("idStatus").value = "Y";

		window.close(); 
	}
</script>
<div class="container">
	<div>
		<c:if test="${result==0 }">
			<b>${user_id }</b>은(는) 사용가능한 아이디입니다.
			<input type="button" value="사용하기" onclick="setUser_id('${user_id}')"/>
		</c:if>
		
		<c:if test="${result>0 }">
			<b>${user_id }</b>은(는) 사용불가능한 아이디입니다.
		</c:if>
	</div>
	<hr/>
	<div>
		<form>
			아이디 입력: <input type="text" name="user_id" id="user_id"/>
			<input type="submit" value="중복검사"/>
		</form>
	</div>
</div>
</body>
</html>