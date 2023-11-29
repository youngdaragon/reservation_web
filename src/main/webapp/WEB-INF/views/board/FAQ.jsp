<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/header.jspf" %> 
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>

	#Accordion_wrap{
		width:1080px;
		margin:0 auto;
		margin-top:100px;
		margin-bottom:100px;
	}
	.que:first-child{
	    border-top: 1px solid gray;
	  }
	  
	.que{
	  position: relative;
	  padding: 17px 0;
	  cursor: pointer;
	  font-size: 16px;
	  border-bottom: 1px solid #dddddd;
	  color:gray;
	}
	  
	.que::before{
	  display: inline-block;
	  content: 'Q';
	  font-size: 15px;
	  color: #FFA964;
	  margin: 0 5px;
	}
	
	.que.on>span{
	  font-weight: bold;
	  color: #9B4500; 
	}
	  
	.anw {
	  display: none;
	  overflow: hidden;
	  font-size: 15px;
	  background-color: #f4f4f2;
	  padding: 27px 0;
	  line-height:30px;
	}
	  
	.anw::before {
	  display: inline-block;
	  content: 'A';
	  font-size: 14px;
	  font-weight: bold;
	  color: #FFA964;
	  margin: 0 5px;
	}
	
	.arrow-wrap {
	  position: absolute;
	  top:50%; right: 10px;
	  transform: translate(0, -50%);
	}
	
	.que .arrow-top {
	  display: none;
	}
	.que .arrow-bottom {
	  display: block;
	}
	.que.on .arrow-bottom {
	  display: none;
	}
	.que.on .arrow-top {
	  display: block; 
	}
	h1{
		text-align:center;
		color:#696969;
		margin-bottom:90px;
	}
</style>

<script>
	$(document).ready(function(){ 
		$(".que").click(function() {
			   $(this).next(".anw").stop().slideToggle(300);
			  $(this).toggleClass('on').siblings().removeClass('on');
			  $(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
			});
	});
</script>


<div id="Accordion_wrap">
	<h1>자주묻는질문(FAQ)</h1>
	<div style="border-top:1px solid #ddd;"></div>
     <div class="que">
      <span>[예약]&nbsp;&nbsp;예약은 어떻게 하나요?</span>
       <div class="arrow-wrap">
         <span class="arrow-top">▲</span>
        <span class="arrow-bottom">▼</span>
       </div> 
     </div>
     <div class="anw">
      <span>
      	메인페이지에서 지역을 선택하신 후 검색버튼을 눌러 나온 가게 리스트 중 하나를 선택해 클릭해 주세요.<br/>
      	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;해당 페이지에서 예약하실 날짜, 시간, 인원 수, 쿠폰사용여부를 선택 하신 후 예약하기 버튼을 눌러주세요.<br/>
      	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;예약확정이 완료된 후 마이페이지 예약내역애서 확인 가능합니다.<br/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;예약 시 먹풍선 5개를 필요로 합니다. (단, 노쇼를 하셨던 경우, 예약에 필요한 먹풍선의 갯수는 변경될 수 있습니다.)
     </span>
     </div>
     
      <div class="que">
      <span>[예약]&nbsp;&nbsp;예약내역 확인은 어떻게 하나요?</span>
       <div class="arrow-wrap">
         <span class="arrow-top">▲</span>
        <span class="arrow-bottom">▼</span>
       </div> 
     </div>
     <div class="anw">
      <span>
      	로그인 후 마이페이지 예약내역에서 확인 가능합니다.
      </span>
     </div>
     
      <div class="que">
      <span>[예약]&nbsp;&nbsp;예약취소는 어떻게 하나요?</span>
       <div class="arrow-wrap">
         <span class="arrow-top">▲</span>
        <span class="arrow-bottom">▼</span>
       </div> 
     </div>
     <div class="anw">
      <span>
      	로그인 후 마이페이지 예약내역에서 취소가능합니다.<br/>
      	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;단, 취소는 예약하신 시간 30분 전 까지만 가능합니다.<br/> 
      	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;그 이후에 사정이 생기신 경우, 가게로 직접 연결 바랍니다. 가게 전화번호는 가게정보에서 확인 가능합니다.
      </span>
     </div>
     
      <div class="que">
      <span>[예약]&nbsp;&nbsp;예약시 특정 메뉴나 좌석을 선택해 예약할 수 있나요?</span>
       <div class="arrow-wrap">
         <span class="arrow-top">▲</span>
        <span class="arrow-bottom">▼</span>
       </div> 
     </div>
     <div class="anw">
      <span>
      	예약 시 날짜, 시간, 인원 수, 쿠폰사용여부만으로 진행합니다.<br/>
      	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;원하시는 메뉴 혹은 좌석이 있으실 경우에는 예약 진행시 사장님께 전달할 메시지에 남겨주시면 됩니다.
      </span>
     </div>
     
      <div class="que">
      <span>[먹풍선]&nbsp;&nbsp;먹풍선을 얻는 방법은 무엇인가요?</span>
       <div class="arrow-wrap">
         <span class="arrow-top">▲</span>
        <span class="arrow-bottom">▼</span>
       </div> 
     </div>
     <div class="anw">
      <span>
      	예약 진행하신 후 해당 가게에 방문해 식사 하신 후 사장님께서 방문 확인해주시면 예약하실 때 사용하신 5개에<br/>
      	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;추가로 3개가 지급되고, 리뷰 작성 해주시면 추가로 2개가 지급됩니다.
      </span>
     </div>
     
      <div class="que">
      <span>[먹풍선]&nbsp;&nbsp;먹풍선은 어디서 사용하나요?</span>
       <div class="arrow-wrap">
         <span class="arrow-top">▲</span>
        <span class="arrow-bottom">▼</span>
       </div> 
     </div>
     <div class="anw">
      <span>
      	먹풍선은 가게를 예약하실 때 사용됩니다. 또한, 상점에서 쿠폰 구매 시 사용하실 수 있습니다.
      </span>
     </div>
</div>
<%@ include file="/resources/footer.jspf" %>
</body>
</html>

















