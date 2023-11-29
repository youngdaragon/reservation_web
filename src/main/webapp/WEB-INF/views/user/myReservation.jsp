<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="/resources/header.jspf" %>
<style>
h1{
	text-align:center;
	color:#696969;
	margin-top:100px;
}
.wrap{
	background-color: #fff;
	max-width: 1000px;
	border : 1px solid #f5f5f5;
	margin: 0 auto;
	border-radius:10px;
	padding : 15px 15px;
	margin-bottom : 20px;
}
.status{
	margin-botton:5px;
	display:inline-block;
	line-height:25px;
	height:27px;
	width:70px;
	background-color:#EAEAEA;
	text-align:center;
	border-radius:20px;
	font-size : 12px;
	margin-bottom:10px;
}
.name{
	font-size: 18px;
	font-weight: bold;
	text-decoration: none; 
	color:#000;
}
.name:hover{
	color:#787878;
}
.content_wrap{
	display:flex;
	margin : 10px 0;
}
.text{  
	width:100px;
	color : #808080
}
.btn{
	display: inline-block;
	line-height:25px;
    height:27px;
    width: 80px;
    background-color: #FF7100;
    color: #fff;
    font-size: 14px;
    border:none;
    border-radius:5px;
    text-align:center;
    text-decoration: none;
}
.btn:hover{
	background-color:#FFA964;
	cursor:pointer;
}
.btn_wrap{
	margin-left : 30px;
}
</style>
<h1>예약 내역</h1>
<div style="border-top:1px solid #ddd; width:1000px; margin:0 auto 100px auto; "></div>
<c:forEach var="res" items="${list }">
<jsp:useBean id="now" class="java.util.Date"/>
	<fmt:setTimeZone value="Asia/Seoul"/>
<fmt:parseDate var="resTime" value="${res.reservation_time}" pattern="yyyy-MM-dd HH:mm:ss"/>

<fmt:parseNumber value="${(resTime.time - now.time) / (1000*60*60) }" var="def" scope="request"/>
<script>
	function reservationDel(){
		if(confirm("예약을 취소하시겠습니까 ?")){
			location.href = "reservationDel?no=${res.seq}";
		}}

</script>
<div class="wrap">
	<div class="status">${res.reservation_status }</div>
	<div class="content_wrap">
		<a href="/restaurant/${res.store_seq}" class="name">${res.store_name } ></a>
		<div class="btn_wrap">
			<c:if test="${res.reservation_status != '예약 취소' }">
				<c:if test="${def < -1 }"> <!-- 예약 시간 1시간 후 리뷰 쓰기 가능 -->
					<a href="reviewWrite?no=${res.seq }" class="btn">리뷰 쓰기</a>
				</c:if>
				<c:if test="${def > 1 }"> <!-- 예약 시간 1시간 전까지 취소 가능 -->
					<a href="javascript:reservationDel()" class="btn">예약 취소</a>
				</c:if>
			</c:if>
		</div>
	</div>
	
	<div class="content_wrap">
		<div class="text">예약시간</div>
		<div class="content"><fmt:formatDate value="${resTime}" pattern="yyyy년 M월 d일(E) a HH시" /></div>
	</div>
	<div class="content_wrap">
		<div class="text">인원  </div>
		<div class="content">${res.number_of_people }명</div>
	</div>
	<div class="content_wrap">
		<div class="text">예약자 </div>
		<div class="content">${res.user_name}(${res.phone_number })</div>
	</div>
	<div class="content_wrap">
		<div class="text">요청사항</div>
		<div class="content">${res.reservation_comment }</div>
	</div>

</div>
</c:forEach>
<%@ include file="/resources/footer.jspf" %>
