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

.history{
	width: 1000px;
	margin: 0 auto;
}
.countBalloon{
	height:30px;
	width:900px;
	border : 1px solid #d7d5d5;
	background-color:#fbfafa;
	border-radius:5px;
	padding : 20px 30px;
	margin : 50px auto;
	display:flex;
}
.text1{
	margin-top:3px;
}
.count{
	font-size : 23px;
	margin-right:10px;
}
.unit{
	margin-top:3px;
}
.left{
	display:flex;
}
.right{
	display:flex;
	margin-left:auto;
}
li{
	list-style-type:none;
}
.history table{
	width:1000px;
	border-collapse: collapse;
	border:1px solid #d7d5d5; 
	color:#353535; 
	line-height:1.5;
}
.history th{
	padding:11px 0 9px; 
	border-left:1px solid #e9e9e9; 
	vertical-align:middle; 
	background:#fbfafa;
}
.history td{
	/*font-family: 나눔고딕,NanumGothic,돋움,Dotum;*/
	font-size : 15px;
	padding:10px 10px; 
	border-top:1px solid #e9e9e9; 
	text-align:center;  
	vertical-align:middle; 
}

.plus{
	color:#FF7100;
}
.num{
	font-weight:bold;
}
.text{
	font-weight: bold;
	margin : 20px 5px 5px auto;
}


</style>
<h1>먹풍선 내역</h1>
<div style="border-top:1px solid #ddd; width:1000px; margin:0 auto 100px auto; "></div>
<div class="countBalloon">
	<div class="left">
		<img src="/img/balloons.png" style="width:30px; height:30px; margin-right:10px;"/>
		<div class="text1">보유 먹풍선</div>
	</div>
	<div class="right">
		<div class="count">${dto.balloon }</div>
		<div class="unit">개</div> 
	</div>
</div>

<div class="history">
<table border="1" summary="">
	<colgroup>
		<col style="width:15%" />
		<col style="width:70%" />
		<col style="width:auto" />
	</colgroup>
	<thead>
	<tr>
		<th scope="col">적립 날짜</th>
		<th scope="col">적립 내용</th>
		<th scope="col">먹풍선</th>
	</tr>
	</thead>
	<c:forEach var="b" items="${list }">
	<fmt:parseDate var="useTime" value="${b.use_get_time }" pattern="yyyy-MM-dd HH:mm:ss"/>
	<tbody>
		<tr>
			<td><fmt:formatDate value="${useTime }" pattern="yyyy.MM.dd"/></td>
			<td>${b.content }</td>
			<td class="num">
				<c:if test="${b.balloon > 0 }">
					<div class="plus">+${b.balloon } 개</div>
				</c:if>
				<c:if test="${b.balloon < 0 }">
					<div class="minus">${b.balloon } 개</div>
				</c:if>
			</td>
		</tr>
	</tbody>
	</c:forEach>
</table>
</div>
<%@ include file="/resources/footer.jspf" %>
