<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/header.jspf" %>

<style>

	.container{
		width:1200px;
		margin:0 auto;
		display:flex;
	}
	#search{
		width:100px;
		height:50px;
		line-height:50px;
		background-color:#FF7100;
		border:none;
		border-radius:30px;
		color:white;
		font-size:1.2em;
	}
	#search:hover{
		background-color:#FFA964;
	}
	#select_box{
		margin-top:250px;
		display:flex;
		flex-direction: row;
		margin-left:8%;
	}
	#inner_box{
		margin:0 auto;
	
	}
	#text_box{
		margin:30px auto 100px 400px;
		text-align:center;
		font-size:1.2em;
		color:gray;
	}
	select{
		appearance: none;
        -webkit-appearance: none;
        -moz-appearance: none;
        width:400px;
        height:50px;
        line-height:50px;
        border: 2px solid #FF7100;
        border-radius:20px;
        padding:0 10px;
	}
	select::-ms-expand{ 
		display: none;
    } 
    select:focus{
		outline:none;
	}
	#foodImg{
		margin-left:120px;
		padding-left:50px;
		margin-top:-140px;
	}
	.bx-wrapper {
	    -moz-box-shadow: none;
	    -webkit-box-shadow: none;
	    box-shadow: none;    
	    border: 0;            
    }
</style>
<script type="text/javascript">
	 // 검색 버튼 클릭 이벤트 처리
	 $(document).ready(function(){ 
		
		$("#search").click(function() {
			
			// 선택된 option 태그의 value 값 가져오기
			var selectBox = document.getElementById("district-select");
			var selectedDistrict = selectBox.options[selectBox.selectedIndex].value;
			
			// 서버로 선택된 district 값을 전달하여 뷰페이지로 이동
			window.location.href = '/search?district=' + selectedDistrict;
		});
	});
	 
	 $(document).ready(function(){
		$(".bxslider").bxSlider({
			auto:true,
			pause:2000,
			controls: false,
			autoHover: true,
			slideWidth: 400,
			pager:false
		});
	 });
	 
</script>
<div class="container">
	<div id="select_box">
		<div id="inner_box">
			<select id="district-select">
				<option value="#">지역 선택&nbsp;&nbsp;(&nbsp;클릭하여 지역을 선택해주세요.&nbsp;)</option>
				<option value="홍대">홍대</option>
				<option value="강남">강남</option>
				<option value="왕십리">왕십리</option>
			</select>
			<input id="search" type="button" value="검색하기"/>
			<p style="text-align:center; margin-left:-90px; margin-top:30px; color:gray;">
				Search restaurants where you want to go,<br/>
				browse menus and reviews.<br/>
				Then you can find places you like, and<br/>
				Make a reservation  with <b>MUKSCHEDULE!</b>
			</p>
		</div>
		<div id="foodImg">
			<ul class="bxslider">
				<li><img src="/img/pizza.png" style="width:400px; height:400px;"></li>
				<li><img src="/img/noodle.png" style="width:400px; height:400px;"></li>
				<li><img src="/img/pasta.png" style="width:400px; height:400px;"></li>
				<li><img src="/img/waffles.png" style="width:400px; height:400px;"></li>
				<li><img src="/img/poke.png" style="width:400px; height:400px;"></li>
				<li><img src="/img/bob.png" style="width:400px; height:400px;"></li>
				<li><img src="/img/kimchi.png" style="width:400px; height:400px;"></li>
			</ul>
		</div>
		<!-- <a href="/board/inquiryList">문의내역보기</a> -->
	</div>
</div>
</body>
</html>