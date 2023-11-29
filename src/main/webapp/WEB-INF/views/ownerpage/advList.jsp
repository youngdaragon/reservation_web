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
        h3{
            color: #FF7100;
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
<h1>광고내역 확인</h1>
<c:if test="${empty promotion }">
    <h1>광고내역이 없습니다.</h1>
</c:if>

<div class="container">
    <c:forEach var="promotion" items="${promotion }">
        <div class="reservation-container">
            <h3>광고 정보</h3>
            <p class="highlight">광고일자: ${promotion.list_date }</p>
            <div class="reservation_status">
                광고 지역: ${promotion.district}
            </div>
        </div>
    </c:forEach>
</div>
<%@ include file="/resources/footer.jspf" %>
</body>
</html>