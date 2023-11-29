<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/header.jspf" %>
<style>
	.inquiry_all{
		width:1200px;
		display:flex;
		margin:0 auto;
		justify-content:center;
	}
	.inquiryList{
		overflow: auto;
    	text-align: center;
    	width: 70%;
    	margin: 0 auto;
    	padding-top: 30px;
	}
	.inquiryList li{
		float:left;
		width:33%;
		height:50px;
		line-height:50px;
		border-bottom:1px solid #ddd;
	}
	h1{
		color:#696969;
		text-align:center;
		margin-top:100px;
	}
	#title_a{
		color:black;
	}
	#title_a:hover{
		color:#FF7100;
		cursor:pointer;
	}
</style>
<h1>나의 1:1문의목록</h1>
	<c:if test="${empty list}">
		<img src="/img/mark.png" style="width:100px; height:100px; display:block; margin:0 auto; padding-top:30px;">
		<h2 style="text-align:center; padding-top:15px;">등록된 문의가 없습니다.</h2>
	</c:if>
	
	<c:if test="${not empty list}">
		<div class="inquiry_all">
				<ul class="inquiryList">
					<li>제목</li>
					<li>등록일</li>
					<li>진행상태</li>
					
					
					<c:forEach var="inquiry" items="${list}">
						<li><a href="/board/inquiryView/${inquiry.seq }" id="title_a">${inquiry.question_title}</a></li>
						<li>${inquiry.question_time}</li>
						<c:if test="${empty inquiry.answer}">
							<li style="color:gray;">답변대기</li>
						</c:if>
						<c:if test="${not empty inquiry.answer}">
							<li style="color:red;">답변완료</li>
						</c:if>
					</c:forEach>
				</ul>
		</div>
	</c:if>

<%@ include file="/resources/footer.jspf" %>
</body>
</html>