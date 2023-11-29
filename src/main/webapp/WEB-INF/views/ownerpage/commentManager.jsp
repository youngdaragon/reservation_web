<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="/resources/header.jspf" %>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>댓글관리페이지</title>
    <style>
   .owner_comment
   {
    width: 95%;
    padding: 10px;
    border: 1px;
    border-radius: 5px;
    margin-bottom: 20px;
    /*background-color: #f5f5f5;*/
    border-style:solid;
  }
  .owner_comment_submit {
  display: block;
  margin: 0 auto;
  width: 300px;
  height: 30px;
  background-color: #FF7100;
  color: white;
  font-size: 16px;
  border: none;
  border-radius: 5px;
}
.coupon-submit {
	display: inline-block;
	margin-top: 10px;
	margin-right: 10px;
	background-color: #FF7100;
	color: white;
	font-size: 16px;
	border: none;
	border-radius: 5px;
	padding: 5px 10px;
	margin-bottom: 10px;
}

.coupon-submit:hover {
	background-color: #C65800;
	cursor: pointer;
}

.owner_comment_submit:hover {
  background-color: #C65800;
  cursor: pointer;
}
    h1 {
   		    text-align:center;
    		color:#696969;
    		margin-top:100px;
 		}
    .container {
            max-width: 960px;
            margin: 0 auto;
        }
        .review-container {
            border: 1px solid black;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 10px;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.3);
            margin-top: 15px;
        }
        .review-author {
            font-weight: bold;
        }
        .review-time {
            color: gray;
            font-size: 12px;
        }
        .review-rating {
			
		}	
        .review-content {

            white-space: pre-line;
        }
        .space-work{
        	margin: 10px;
        }
        .review-owner {
            margin-top: 10px;
            margin-bottom: 10px;
            font-weight: bold;
        }
        .review-owner-comment {
        border-style:dashed;
		border-radius: 10px;
		border-width: 1px;
		border-color: #808080;
        white-space: pre-line;
        }
        .review-boss-comment {
            margin-top: 10px;
            color: gray;
            font-size: 12px;
            white-space: pre-line;
        }
        .review-container .review_picture{
            float: right;
    		width: 200px;
    		height: auto;
        }
        #riveiwSearch{
        	margin:0 auto;
			max-width:960px;
			overflow: hidden;
        }
        #searchbutton{
        margin: 0 auto;
	 	background-color: #FF9139;
		color: #fff;
    	border: none;
		border-radius: 5px;
		cursor: pointer;
		font-size: 18px;
        }
        #searchbutton:hover{
        background-color: #C65800;
        }
        #storeavgScore{
        	font-style: bold;
        	font-size: 14px;
        	float: left;
        }
        #searchForm{
       		float: right;
        }
    </style>
</head>
<body>
	<h1>가게 리뷰 확인</h1>
	<div id="riveiwSearch">
	<div id="storeavgScore">가게 총 평점: <span style="color: #FF7100;">&#9733; </span>${storeScore }</div>
	<div id="searchForm">
	<form method="get" id="searchtagForm" action="commentManager">
	&#8251 아직 처리하지 않은 작업 선택 :
		<select name="searchKey">
			<option value="oc">사장님댓글</option>
			<option value="cg">쿠폰여부</option>
		</select>
		<input type="checkbox" id="use" name="use"/>
		<input type="submit" id="searchbutton" value="search"/>
	</form>
	</div>
	</div>
<div class="container">
	<c:if test="${empty review }">
	<h1>리뷰내역이 없습니다.</h1>
	</c:if>
    <c:forEach var="comment" items="${review}">
        <div class="review-container">
        	<img class="review_picture" src="${comment.file_location }">
            <div class="review-author">
                작성자 ID: ${comment.user_id}
            </div>
            <div class="review-time">
                Comment time: ${comment.review_time}
            </div>
			<div class="review-rating">
				<span style="color: #FF7100;">&#9733; </span>${comment.score }
			</div>
			<c:if test="${comment.coupon_status==0 }">
			<form id="coupon-form" ModelAttribute="CouponDTO" action="couponGift" method="post">
				<input type="hidden" name="user_id" value="${comment.user_id }">
				<input type="hidden" name="store_seq" value="${comment.store_seq }">
				<input type="hidden" name="review_seq" value="${comment.seq}">
				<button class="coupon-submit" type="submit">쿠폰 선물하기</button>
			</form>
			</c:if>			
            <div class="review-content">
                ${comment.review}
                
            </div>
            <div class="space-work"></div>
            <div class="review-owner">
                사장님 코멘트:
            </div>
            <c:if test="${comment.owner_comment!=null }">
	            <form action="ownerCommentAdd"  ModelAttribute="ReviewDTO" method="post">
		        	<textarea class="owner_comment" name="owner_comment" rows="5">${comment.owner_comment}</textarea>
		        	<input type="hidden" name="seq" value="${comment.seq}">
		        	<input type="submit" value="수정" class="owner_comment_submit">
		    	</form>
	            <div class="review-boss-comment">
	               사장님 comment time: ${comment.comment_time}
	            </div>
            </c:if>
            <c:if test="${comment.owner_comment==null }">
            <form action="ownerCommentAdd"  ModelAttribute="ReviewDTO" method="post">
		        <textarea class="owner_comment" name="owner_comment" rows="5">${comment.owner_comment}</textarea>
		        <input type="hidden" name="seq" value="${comment.seq}">
		        <input type="submit" value="등록" class="owner_comment_submit">
		    </form>
            </c:if>
        </div>
    </c:forEach>
</div>
	<%@ include file="/resources/footer.jspf" %>
</body>
</html>
<!-- <li><a href="reviewContent?no=${comment.seq}">상세보기</a></li> -->