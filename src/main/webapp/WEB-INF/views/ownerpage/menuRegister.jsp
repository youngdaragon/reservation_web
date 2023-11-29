<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/header.jspf" %>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>메뉴예약 페이지</title>
<style>
		body {
			background-color: #f2f2f2;
			font-family: Arial, sans-serif;
			font-size: 16px;
			color: #333;
		}
		h1 {
   			 text-align:center;
    color:#696969;
    margin-top:100px;
 			 }
		form {
			max-width: 800px;
			margin: 0 auto;
			padding: 20px;
			background-color: #fff;
			border-radius: 10px;
			box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.3);
		}
		form ul {
			list-style:none;
			padding-left: 0px;
		}
		form li {
			margin-bottom: 10px;
		}
		form label {
			display: block;
			margin-bottom: 5px;
			font-weight: bold;
		}
		form input[type="text"], form input[type="number"], form input[type="file"] {
			display: block;
			width: 95%;
			padding: 10px;
			border: 1px solid #ccc;
			border-radius: 5px;
			background-color: #f9f9f9;
		}
		form input[type="button"], form input[type="submit"] {
			display: inline-block;
			padding: 10px;
			border: none;
			border-radius: 5px;
			background-color: #f9f9f9;
			color: #000;
			cursor: pointer;
		}
		form input[type="button"]:hover, form input[type="submit"]:hover {
			background-color: #f9f9f9;
		}
		form input[type="button"][value=" - "] {
			background-color: #f9f9f9;
		}
		form input[type="button"][value=" - "]:hover {
			background-color: #f9f9f9;
		}
		form ul ul {
			margin-left: 20px;
			background-color: #f2f2f2;
			border-radius: 5px;
			padding: 10px;
		}
		form input[type="submit"] {
			background-color: #FF9139;
			color: #fff;
    		padding: 10px 20px;
    		border: none;
		    border-radius: 5px;
		    cursor: pointer;
		    font-size: 18px;
		}
		form input[type="submit"]:hover {
    		background-color: #C65800;
  		}
</style>
<script>
		$(document).on('click', '#menuForm input[value=" + "]', function(){
		    $(this).parent().parent().after('<div><ul><li>메뉴 이름:</li><li><input type="text" name="menu_name" id="menu_name"></li><li>가격</li><li><input type="number" name="price" id="price" step="100"></li><li>카테고리</li><li><input type="text" name="category" id="category"></li><li>음식 정보</li><li><input type="text" name="information" id="information"></li><li><label for="filename">메뉴 사진:</label></li><li><input type="file" id="filename" name="filename"></li><li><input type="button" value=" + "></li></ul></div>');
		    $(this).val(" - ");
		});
		
 	    $(document).on('click', '#menuForm input[value=" - "]',function(){
		    $(this).parent().parent().remove();
		});
</script>
</head>
<body>
	<div id="menu_title"><h1>메뉴등록</h1></div>
	<form action="menuRegisterOk" ModelAttribute="MenuDTO" id="menuForm" method="post" enctype="multipart/form-data">
	<div>
	<ul>
		<li>메뉴 이름:</li>
		<li><input type="text" name="menu_name" id="menu_name" required></li>
		<li>가격</li>
		<li><input type="number" name="price" id="price" step="100" required></li>
		<li>카테고리</li>
		<li><input type="text" name="category" id="category"></li>
		<li>음식 정보</li>
		<li><input type="text" name="information" id="information"></li>
		<li><label for="filename">메뉴 사진:</label></li>
		<li>
			<input type="file" id="filename" name="filename">
		</li>
		</ul>
		</div>
	 <input type="submit" value="메뉴 등록">
	 </form>
	<%@ include file="/resources/footer.jspf" %>
</body>
</html>
