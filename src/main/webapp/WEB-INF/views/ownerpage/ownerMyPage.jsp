<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/header.jspf" %>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>사장님 마이페이지</title>
<style>
body{
        padding: 0;
        margin: 0;
      }
      div{
        box-sizing: border-box;
      }
 
      /* 오렌지 텍스트 */
      .orange{
        color: #FF7100;
      }
      
      .all-menu{
      	background-color: #F8F8F8;
        max-width: 1500px;
        margin: 0 auto; 
      }
      .wrap{
        background-color: #F8F8F8; 
        margin-top: 5px;
      }
      /*이름있는박스*/
      .topContainer{  
        height: 132px;
        background-color: #fff;    
        display: flex;
        align-items: flex-end;
        padding: 16px;
      }
      
      .topContainer .name{
        font-size: 30px;
        font-weight: bold;
        color: #FF7100;
      }
      
      .topContainer .text{
      	font-size: 30px;
      	font-weight: bold;
      	color: #000;
      } 
      .topContainer .modify{
        margin-left: 20px;
        font-size:17px;
        font-weight:bold;
        color:#FF9139;
        text-decoration:none;
      }
      .delete{
      	text-decoration: none;
      }
      
       /* ================== 주문/배송조회 박스 시작 ==================== */
    .shippingStatusContainer{
      padding: 21px 16px;
      background-color: white;
      margin-bottom: 10px;
    }

    /* 주문/배송조회 타이틀 */
    .shippingStatusContainer .title{
      font-size: 16px;
      font-weight: bold;
      margin-bottom: 15px;
    }

    /* 장바구니 결제완료 배송중 구매확정 [로우] */
    .shippingStatusContainer .status{
      display: flex;
      justify-content: space-between;
      margin-bottom: 21px;
    }
    /* 장바구니 결제완료 배송중 구매확정 [아이템]  */
    .shippingStatusContainer .item{
      display: flex;
    }

    .shippingStatusContainer .number{
      font-size: 15px;
      font-weight: 500;
      text-align: center;
    }
    .shippingStatusContainer .text{
      font-size: 12px;
      font-weight: normal;
      color: #c2c2c2;
      text-align: center;
    }
    .shippingStatusContainer .v-line{
    border-left : thin solid #000;
     height : 45px;
     margin-right:10px;
	}
      /* 단골상점 , 상품후기 , 적립금 박스 */
    .summaryContainer{
    background-color: #FF7100;  
    display: flex; 
    padding: 21px 16px;  
    height: 80px;
    margin-bottom: 10px;
    }
    /* 단골상점 , 상품후기 , 적립금 */
    .summaryContainer .item{
    flex-grow: 1;
    }
    /* 녹색 숫자 */
    .summaryContainer .number{
    font-size: 19px;
    font-weight: bold;
    color: #fff;
    }
     .summaryContainer .reservationCheck{
    font-size: 19px;
    font-weight: bold;
    color: #fff;
    }
    /* 텍스트 */
    .summaryContainer .item > div:nth-child(1){
  		font-size: 13px;
  		color:white;
	}
    .summaryContainer .v-line{
    border-left : thin solid #fff;
     height : 45px;
     margin-right:10px;
	}
      
      /*=================== 주문목록 ~ 찜한상품 리스트 ==================*/
      .listContainer{  
        padding: 0;
        background-color: #ffffff;
        margin-bottom: 10px;
      }
      .listContainer .item{  
        display: flex;
        align-items: center;
        padding: 16px;
        color: black;
        text-decoration: none;  
        height: 56px;
        box-sizing: border-box;
      }
      .listContainer .text{
        font-size: 16px;
        position: relative;
      }
      .listContainer .right{
        margin-left: auto;
      }
      
      /*  */
      .listContainer .item:hover{
        background-color: #f8f8f8; 
      }
      .infoContainer .item:hover{
         background-color: #f8f8f8; 
      }
</style>
</head>
<body>	
  <div class="all-menu">
    <div class="wrap">
        <div class="topContainer">
            <div class="name">${logName }</div><div class="text">님 안녕하세요!</div>
            <div class="modify"><a href="/ownerpage/userInfoEdit">정보 수정 ></a></div>   
        </div>
        <div class="shippingStatusContainer">
          <div class="title">
            가게선택
          </div>
          <div class="status">
	          	<c:if test="${store!=null }">
	          	<c:forEach var="store" items="${store }">
	            <div class="item">
	              <div>
	                <div class="green number"><a href="ownerMyPage?no=${store.seq }">${store.store_name}</a></div>
	                <div class="text">${store.district }</div>
	              </div>
	            </div>
	            <div class="v-line"></div>
	            </c:forEach>
	            </c:if> 
            </div>
            </div>
        <div class="summaryContainer">
            <div class="item">
            	<div>예약미확인 ></div>
                <div class="number"><a class="reservationCheck" href="/ownerpage/reservation">${reservationNoCheck }</a></div>
              </div>
              <div class="v-line"></div>
              <div class="item">
                <div>방문미확인 ></div>
                <div class="number"><a class="reservationCheck" href="/ownerpage/reservation">${noShowCheckNum }</a></div>
              </div>
          </div>  
          
        </div>  
        <div class="listContainer">
          <a href="/ownerpage/storeRegister" class="item">
              <div class="text">가게등록</div>
              <div class="right"> > </div>
          </a>
          <a href="/ownerpage/storeInfoEdit" class="item">
              <div class="text">가게정보수정</div>
              <div class="right"> > </div>
          </a>
          <a href="/ownerpage/menuRegister" class="item">
              <div class="text">메뉴등록</div>
              <div class="right"> > </div>
          </a>
          <a href="/ownerpage/menuSelect" class="item">
              <div class="text">메뉴정보수정</div>
              <div class="right"> > </div>
          </a>
          <a href="/restaurant/${storeSeq }" class="item">
              <div class="text">가게정보보기</div>
              <div class="right"> > </div>
          </a>
          <a href="/ownerpage/reservation" class="item">
              <div class="text">예약확인</div>
              <div class="right"> > </div>
          </a>
          <a href="/ownerpage/commentManager" class="item">
              <div class="text">댓글관리 및 쿠폰증정</div>
              <div class="right"> > </div>
          </a>
          <a href="/ownerpage/advApply" class="item">
            <div class="text">광고리스트 신청</div>
            <div class="right"> > </div>
        </a>
        <a href="/ownerpage/advList" class="item">
              <div class="text">광고리스트 확인</div>
              <div class="right"> > </div>
          </a>
        </div>
        <div class="listContainer">
          <a href="/ownerpage/storeDelete" class="item">
              <div class="text">가게삭제</div>
              <div class="right"> > </div>
          </a>    
        </div>        
      </div>
  <%@ include file="/resources/footer.jspf" %>
</body>
</html>
