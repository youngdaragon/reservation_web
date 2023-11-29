<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	header{
		display:none;
	}
</style>
<script>
	function setPhone_number(phone_number){
		opener.document.getElementById("phone_number").value = phone_number;
		opener.document.getElementById("phoneStatus").value = "Y";

		window.close(); 
	}
</script>
<div class="container">
	<div>
		<c:if test="${result==0 }">
			<b>${phone_number }</b>은(는) 사용가능한 전화번호입니다.
			<input type="button" value="사용하기" onclick="setPhone_number('${phone_number}')"/>
		</c:if>
		
		<c:if test="${result>0 }">
			<b>${phone_number }</b>은(는) 이미 등록된 전화번호입니다.
		</c:if>
	</div>
	<hr/>
	<div>
		<form>
			전화번호 입력: <input type="text" name="phone_number" id="phone_number"/>
			<input type="submit" value="인증"/>
		</form>
	</div>
</div>
</body>
</html>