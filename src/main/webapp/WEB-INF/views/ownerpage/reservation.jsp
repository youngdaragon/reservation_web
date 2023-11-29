<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/header.jspf" %>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>예약확인페이지</title>
    <style>
    h1{
        text-align:center;
    	color:#696969;
    	margin-top:100px;
    }
    .container{
    max-width: 800px;
    	margin:0 auto;
    }
    .reservation-container {
border: 1px solid #ccc;
padding: 10px;
border-radius: 10px;
margin-top:25px;
box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.3);
}
#dateSearch{
	margin:0 auto;
	max-width:800px;
}
input[type="date"] {
			margin: 0 auto;
			padding: 8px;
			border-radius: 4px;
			border: 1px solid #ccc;
			font-size: 16px;
		}
	#datebutton {
		margin: 0 auto;
	 	background-color: #FF9139;
		color: #fff;
    	border: none;
		border-radius: 5px;
		cursor: pointer;
		font-size: 18px;
	}
	#datebutton:hover {
  		background-color: #C65800;
	}

.reservation-button {
  background-color: #FF7100;
  color: #fff;
  border: none;
  padding: 5px 10px;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.2s ease-in-out;
}

.reservation-button:hover {
  background-color: #C65800;
}
.highlight {
  font-weight: bold;
  font-size: 1.2em;
  color: #000;
}
.coupon{
	font-weight: bold;
	font-size: 1.1em;
	color: #000;
}
.phone, .email {
  font-style: italic;
  color: gray;
  font-size: 0.8em;
}
.reservation_comment{
	border-style:dashed;
	border-radius: 10px;
	border-width: 1px;
	border-color: #808080;
}

    </style>
</head>
<body>
	<h1>가게예약내역 확인</h1>
	<div id="dateSearch">
	<form method="get" id="searchForm" action="reservation">
		<input type="date" name="date" id="date"/>
		<input type="submit" id="datebutton" value="search"/>
	</form>
	</div>
	<c:if test="${empty reservation }">
	<h1>예약내역이 없습니다.</h1>
	</c:if>
	<c:if test="${reservation!=null }">
	<div class="container">
	<c:forEach var="reservation" items="${reservation }">
			<div class="reservation-container">
			<h3>예약 정보</h3>
			<p class="highlight">예약자: ${reservation.user_name } | 예약시간: ${reservation.reservation_time } | 예약인원: ${reservation.number_of_people }명</p>
			<p class="phone">전화번호: ${reservation.phone_number }</p>
			<p class="email">이메일: ${reservation.email }</p>
			<c:if test="${reservation.reservation_status eq '예약 대기' }">
			<form id="reservationCheck-form" ModelAttribute="ReservationDTO" action="reservationCheckOk" method="post">
				<input type="hidden" name="user_id" value="${reservation.user_id }">
				<input type="hidden" name="seq" value="${reservation.seq}">
				<input type="hidden" name="reservation_status" value="예약 완료">
				<button class="reservation-button" type="submit">예약 확정</button>
			</form>
			<div>
			-------------------------------
			</div>
			<form id="reservationCheck-form" ModelAttribute="ReservationDTO" action="reservationFailOk" method="post">
				<input type="hidden" name="seq" value="${reservation.seq }">
				<input type="hidden" name="reservation_status" value="예약 취소">
				<button class="reservation-button" type="submit">예약 취소</button>
			</form>
			</c:if>
			<c:if test="${reservation.reservation_status eq '예약 완료'}">
				<form id="reservationCheck-form" ModelAttribute="ReservationDTO" action="showCheckOk" method="post">
						<input type="hidden" name="seq" value="${reservation.seq }">
						<input type="hidden" name="user_id" value="${reservation.user_id }">
						<input type="hidden" name="reservation_status" value="방문 확인">
						<button class="reservation-button" type="submit">방문 확인</button>
				</form>
				<div>
				-------------------------------
				</div>
				<form id="reservationCheck-form" ModelAttribute="ReservationDTO" action="noShowCheckOk" method="post">
						<input type="hidden" name="seq" value="${reservation.seq }">
						<input type="hidden" name="user_id" value="${reservation.user_id }">
						<input type="hidden" name="reservation_status" value="노쇼">
						<button class="reservation-button" type="submit">노쇼</button>
				</form>
			</c:if>
			<c:if test="${reservation.coupon!=null }">
			<div class="coupon">
			쿠폰사용: ${reservation.coupon}%
			</div>
			</c:if>
			<div class="reservation_status">
			예약상태: ${reservation.reservation_status}
			</div>	
			<div>
			예약코멘트:
			</div>
			<div class="reservation_comment">
			${reservation.reservation_comment}
			</div>
		</div>
	</c:forEach>
	</div>
	</c:if>
	<%@ include file="/resources/footer.jspf" %>
</body>
</html>