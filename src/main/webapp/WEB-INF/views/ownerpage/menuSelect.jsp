<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/header.jspf" %>

<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>메뉴확인페이지</title>
<style>
	body {
    margin: 0;
  }
	h1 {
	    text-align:center;
    	color:#696969;
    	margin-top:100px;
	}
  .all-box {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
  }
  .menu-box {
    border: 1px solid #ccc;
    border-radius: 10px;
    padding: 10px;
    margin-bottom: 10px;
    overflow: hidden;
    cursor: pointer;
  }

  .menu-info {
    float: left;
    width: 60%;
  }

  .menu-info:after {
    content: "";
    display: table;
    clear: both;
  }

  .menu-name {
    font-size: 18px;
    font-weight: bold;
    margin: 0 0 5px 0;
  }

  .menu-price {
    font-size: 14px;
    font-weight: bold;
    margin: 0;
  }

  .menu-box .menu-picture {
    float: right;
    width: 200px;
    height: auto;
  }
</style>
<script>
$(document).ready(function() {
  $(".menu-box").click(function() {
    var menuSeq = $(this).data("seq"); // Retrieve the value of data-seq attribute
    var editPageUrl = "/ownerpage/menuEdit?no=" + menuSeq; // Construct the URL for the edit page
    window.location.href = editPageUrl; // Redirect to the edit page
  });
});
</script>
</head>
<body>
	<div class="all-box">
	<h1>가게 메뉴 수정</h1>
	<c:forEach var="menuList" items="${menuList }">
        <div class="menu-box" data-seq="${menuList.seq}">
  			<div class="menu-info">
    			<p class="menu-name">${menuList.menu_name}</p>
    			<p class="menu-price">${menuList.price}원</p>
  			</div>
  			<c:if test="${!empty menuList.picture_location }">
  			<img class="menu-picture" src="${menuList.picture_location}" alt="${menuList.menu_name}">
  			</c:if>
  			<c:if test="${empty menuList.picture_location}">
  			<img class="menu-picture" src="/imgbin/balloons.png" alt="빈사진">
  			</c:if>
		</div>
    </c:forEach>
    </div>
	<%@ include file="/resources/footer.jspf" %>
</body>
</html>