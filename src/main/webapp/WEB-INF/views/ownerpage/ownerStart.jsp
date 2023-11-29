<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/header.jspf" %>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>가게선택페이지</title>
<style>
	.store_select_div{
		max-width: 800px;
    	margin:50px auto 10px auto;
    	padding: 20px;
    	background-color: #fff;
    	border-radius: 10px;
	}
	.store_select_div .register-select{
		color: #FF7100; 
	}
	.store_select_div .register-select:hover{
		color: #C65800; 
	}
	#store_select{
	text-align:center;
    color:#696969;
    margin-top:1px;
	}
	.store_detail{
		max-width: 800px;
		padding: 30px;
		background-color: #fff;
		border-radius: 10px;
		box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.3);
		overflow: hidden;
    	cursor: pointer;
	}
	.store_detail ul {
			list-style:none;
			padding-left: 0px;
		}
	.store_detail .link-select {
			color: #FF7100; 
		}
	.store_detail .link-select:hover {
			color: #C65800; 
		}
	#space-work{
		margin-top:30px;
	}
	a {
        text-decoration: none;
    }
    .store_select_div .store_name{
    	font-weight: bold;
    	font-size: 20px;
    }
    .store_detail .store-picture{
    	float: right;
    	width: 120px;
    	height: auto;
    }

</style>
<script>
$(document).ready(function() {
	  $(".store_detail").click(function() {
	    var storeSeq = $(this).data("seq"); // Retrieve the value of data-seq attribute
	    var editPageUrl = "ownerMyPage?no=" + storeSeq; // Construct the URL for the edit page
	    window.location.href = editPageUrl; // Redirect to the edit page
	  });
	});
</script>
</head>
<body>
	<div class="store_select_div">
	<h1 id="store_select">나의 가게 목록</h1>
	<c:if test="${store!=null }">
	<c:forEach var="store" items="${store }">
	<div class="store_detail" data-seq=${store.seq }>
		<img class="store-picture" src="${store.picture_location }">
	<ul>
	<li class="store_name">가게이름: ${store.store_name}</li>
	<li>지역: ${store.location }</li>
	<li><a class="link-select" href="ownerMyPage?no=${store.seq}">가게 선택</a></li>
	</ul>
	</div>
	<div id="space-work"></div>
	</c:forEach>
	</c:if>
	
	<a class="register-select" href="/ownerpage/storeRegister">가게등록 바로가기</a>
	</div>
	<%@ include file="/resources/footer.jspf" %>
</body>
</html>