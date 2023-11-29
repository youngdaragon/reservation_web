<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/header.jspf" %>

<style>
	.inquiryView li{
		padding:20px;
		border-bottom:1px solid #ddd;
		width:80%;
		margin:auto;
	}
	h1{
		margin-top:100px;
		text-align:center;
		color:#696969;
	}
	li>a{
		padding:20px;
	}
	#file_name>a{
		padding:0;
	}
</style>
<script>
	function inquiryDelCheck(seq){
		if(confirm("1:1문의 글을 삭제하시겠습니까?")){
			location.href = "/board/inquiryDelete?seq="+seq;
		}
	}
</script>
<h1>나의 1:1문의</h1>
<div style="margin:50px auto 0 auto; width:1200px; display:flex;">
	<div style="margin:0 auto; width:100%;">
		<ul class="inquiryView" style="width:80%; margin:auto;">
			<li style="border-top:1px solid #ddd;">${dto.question_time}</li>
			<li>Q. ${dto.question_title}</li>
			<li><div>&nbsp;&nbsp;&nbsp;&nbsp;${dto.question}</div></li>
			<c:if test="${empty dto.answer}">
				<li>A. 등록된 답변이 없습니다.</li>
			</c:if>
			<c:if test="${not empty dto.answer}">
				<li>A. ${dto.answer}</li>
			</c:if>
			<c:if test="${not empty filename}">
				<li id="file_name"><a href="/uploadfile/${filename}" download >첨부파일 : ${filename}</a></li>
			</c:if>
			<c:if test="${empty filename}">
				<li>첨부된 파일이 없습니다.</li>
			</c:if>
			<li style="text-align:center;">
				<a href="/board/inquiryEdit/${dto.seq }">수정</a>
				<a href="javascript:inquiryDelCheck(${dto.seq})">삭제</a>
				<a href="/board/inquiryList">목록으로</a>
			</li>
		</ul>
	</div>
</div>

<%@ include file="/resources/footer.jspf" %>
</body>
</html>