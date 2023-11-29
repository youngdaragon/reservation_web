<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/header2.jspf" %>

<style>

	.container{
		width:1200px;
		margin:0 auto;
	}
	#search{
		width: 21.6%;
    	height: 40px;
	    background-color: #fff;
	    border: none;
	    border-left: px solid black;
	    border-radius: 50px;
	    color: white;
	    background: #ff7100;
	    font-size: 16px;
	    margin-left: 0.3%;
	}
	#search:hover{
		background-color:#FFA964;
	}
	#select_box{
		margin-top:20px;
		display:flex;
		flex-direction: row;
	}
	#inner_box{
		margin:0 auto;
	
	}
	select{
		appearance: none;
	    -webkit-appearance: none;
	    -moz-appearance: none;
	    width: 76.8%;
	    height: 35px;
	    border-radius: 50px;
	    border: none;
	    padding: 2px 4px;
	    text-align: center;
	}
	select::-ms-expand{ 
		display: none;
    } 
    select:focus{
		outline:none;
	}
	
	.middle_contents{
		margin: auto;
		width:80%;
		height:680px;
		margin-top:20px;
	}
	
	.middle_wrapper_first{
		width:100%;
		height:17.6%;
		margin-bottom:50px;
	}
	
	.middle_wrapper_second{
		width:100%;
		height:41.2%;
	}
	
	.middle_second_contents{
		width:100%;
		margin:auto;
		display:flex;
	}
	.middle_wrapper_third{
		width:100%;
		height:41.2%;
	}
	
	.middle_third_contents{
		width:100%;
		margin:auto;
		display:flex;
	}
	.img_text{
		width:25%; 
		height:280px; 
		position:relative;
	}
    .location_img{
    	width:90%;
    	height:210px;
    }
    .location_img:hover{
    	background:#ddd;
    	opacity:0.6;
    }
    .location_text{
    	width:100%;
    	height:100%;
    	top:35%;
    	margin-left:35%;
    	position:absolute; 
    	color:#fff;
    	font-size:1.5em;
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
	 
	 
</script>
<div style="width:100%; background:linear-gradient(to bottom, #fffaf0 5%, #fff);">
<div class="container">
	<div style="width:100%; margin:auto; text-align:center; margin-top:5px; padding-top:20px;">
		<img src="/img/logo_r.png" style="width:300px; height:130px;">
	</div>
	<div id="select_box">
		<div style="width: 38%; text-align: center; margin: auto; border-radius: 50px; border: 1.5px solid #ff7100;">
			<div id="inner_box">
				<select id="district-select">
					<option value="#">지역 선택&nbsp;&nbsp;(&nbsp;클릭하여 지역을 선택해주세요.&nbsp;)</option>
					<option value="홍대">홍대</option>
					<option value="강남">강남</option>
					<option value="왕십리">왕십리</option>
					<option value="한남">한남</option>
					<option value="성수">성수</option>
					<option value="명동">명동</option>
					<option value="여의도">여의도</option>
					<option value="서촌">서촌</option>
					<option value="잠실">잠실</option>
					<option value="종로">종로</option>
				</select>
					<input id="search" type="button" value="search"/>
			</div>
		</div>
	</div>
		<div class="middle_contents">
			<div class="middle_wrapper_first">
				<p style="text-align:center; color:gray;">
					Search restaurants where you want to go,<br/>
					browse menus and reviews.<br/>
					Then you can find places you like, and<br/>
					Make a reservation  with <b>MUKSCHEDULE!</b>
				</p>
			</div>

			<div class="middle_wrapper_second">
				<div class="middle_second_contents">
					<div class="img_text">
						<a href="/"><img src="/img/한남.jpeg" class="location_img"></a>
						<div class="location_text">한남</div>
					</div>
					<div class="img_text">
						<a href="/"><img src="/img/성수.jpeg" class="location_img"></a>
						<div class="location_text">성수</div>
					</div>
					<div class="img_text">
						<a href="/"><img src="/img/명동.jpeg" class="location_img"></a>
						<div class="location_text">명동</div>
					</div>
					<div class="img_text">
						<a href="/search?district=홍대"><img src="/img/홍대.jpeg" class="location_img"></a>
						<div class="location_text">홍대</div>
					</div>
				</div>
			</div>
			<div class="middle_wrapper_third">
				<div class="middle_third_contents">
					<div class="img_text">
						<a href="/"><img src="/img/여의도.jpeg" class="location_img"></a>
						<div class="location_text">여의도</div>
					</div>
					<div class="img_text">
						<a href="/"><img src="/img/잠실.jpeg" class="location_img"></a>
						<div class="location_text">잠실</div>
					</div>
					<div class="img_text">
						<a href="/"><img src="/img/서촌.jpeg" class="location_img"></a>
						<div class="location_text">서촌</div>
					</div>
					<div class="img_text">
						<a href="/search?district=강남"><img src="/img/강남.jpeg" class="location_img"></a>
						<div class="location_text">강남</div>
					</div>
				</div>
			</div>
		</div>
</div>

</div>
<%@ include file="/resources/footer.jspf" %>

</body>
</html>