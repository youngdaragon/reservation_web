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

/* 가게 이름 */
.name{
	margin-top : 4px;
	font-size: 18px;
	font-weight: bold;
	text-decoration: none; 
	color:#000;
}
.name:hover{
	color:#787878;
}
/* 내용 부분 */
.content_wrap{
	display:flex;
	margin : 10px 10px;
}
.content2_wrap{
	display:flex;
	margin : 20px 20px;
}
.content{
	margin-top : 5px;
	margin-right : 15px;
}
.btn_wrap{
	margin-left:auto;
}
.image{
	margin-left:auto;
	margin-top:10px;
	width:300px;
	height:300px;
}
.star{
	font-size:20px;
	margin-left:10px;
    color: transparent;
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
/* 버튼 */
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
</style>
<h1>리뷰 내역</h1>
<div style="border-top:1px solid #ddd; width:1000px; margin:0 auto 100px auto; "></div>
<c:forEach var="rev" items="${list }">
<fmt:parseDate var="revTime" value="${rev.review_time }" pattern="yyyy-MM-dd HH:mm:ss"/>
<script>
	function reviewDel(){
		if(confirm("해당글을 삭제하시겠습니까?")){
			location.href = "reviewDel?no=${rev.seq}";
		}
	}
	
</script>

<div class="wrap">
	<div class="content_wrap">
		<a href="/restaurant/${rev.store_seq}" class="name">${rev.store_name } ></a>
		<div class="star">★</div>
		<div class="content">${rev.score }</div>
		<div class="content"><fmt:formatDate value="${revTime}" pattern="yyyy년 M월 d일" /></div>
		<div class="btn_wrap">
			<c:if test="${rev.coupon_status == 0 }">
				<a href="reviewEdit?no=${rev.seq }" class="btn">수정</a>
			</c:if>
			<a href="javascript:reviewDel()" class="btn">삭제</a>
		</div>
	</div>
	<div class="content2_wrap">
		
		<div class="content">${rev.review}</div>
		<c:if test="${not empty rev.file_location }">
			<img src="${rev.file_location}" class="image">
			
		</c:if>
	</div>
	
</div>
</c:forEach>
	 <!--  
	<li>사장님 댓글</li>
	<li>${rev.owner_comment }</li>
	<li>${rev.comment_time }</li>
	<li>${rev.seq }</li>
	-->

<%@ include file="/resources/footer.jspf" %>
