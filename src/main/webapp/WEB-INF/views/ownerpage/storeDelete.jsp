<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
if (confirm("${msg}")) {
	//확인 버튼 클릭 시 동작
	alert("가게를 삭제합니다.");
	location.href = "storeDeleteOk";
	} else {
	history.back();
	}
</script>