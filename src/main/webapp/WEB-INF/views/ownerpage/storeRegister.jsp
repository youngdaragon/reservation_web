<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/header.jspf" %>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ad43dcaa341623983b20d5ee0fc28465&libraries=services"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>가게등록페이지</title>
<style>
h1{
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
  }
  
  #main-subject {
    text-align: center;
    margin-top: 10px;
    margin-bottom: 20px;
  }
  
  fieldset {
    margin-bottom: 20px;
    padding: 20px;
    background-color: #fff;
    border-radius: 10px;
    border-width: 1px;
  }
  
  legend {
    font-weight: bold;
    font-size: 20px;
  }
  
  label {
    display: block;
    margin-bottom: 5px;
  }
  #owner_comment,
  #how_to_come
   {
    width: 95%;
    padding: 10px;
    border: 1px;
    border-radius: 5px;
    margin-bottom: 20px;
    /*background-color: #f5f5f5;*/
    border-style:solid;
    border-width: 1px;
  }
  
  #owner_id,
  #store_name, 
  #location, 
  #district, 
  #tel_number, 
  #open_time, 
  #close_time, 
  #how_to_come, 
  #playroom, 
  #parking, 
  #wifi, 
  #animal, 
  #group_customer, 
  #disabled{
		width: 95%;
		padding: 10px;
		border: 1px;
		border-radius: 5px;
		margin-bottom: 20px;
		/*background-color: #f5f5f5;*/
		border-style:solid;
		border-width: 1px;
	}
  
  input[type="checkbox"] {
    margin-right: 5px;
  }
  
  input[type="submit"] {
    background-color: #FF9139;
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 18px;
  }
  
  input[type="submit"]:hover {
    background-color: #C65800;
  }

  #main-title{
  width:800px;
  margin:100px auto 10px auto;
  }
  #file-upload
  {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
    background-color: #fff;
  }

</style>
<script>
    function locationCheck(){
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };
    
    // 지도를 생성합니다
    var map = new kakao.maps.Map(mapContainer, mapOption);
    
    // 주소-좌표 변환 객체를 생성합니다
    var geocoder = new kakao.maps.services.Geocoder();
    var store_location=document.getElementById('location').value;
    map.relayout();
    // 주소로 좌표를 검색합니다
    geocoder.addressSearch(store_location, function(result, status) {
    
        // 정상적으로 검색이 완료됐으면
        if (status === kakao.maps.services.Status.OK) {
    
            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
    
            // 결과값으로 받은 위치를 마커로 표시합니다
            var marker = new kakao.maps.Marker({
                map: map,
                position: coords
            });
    
       // 인포윈도우로 장소에 대한 설명을 표시합니다
            var infowindow = new kakao.maps.InfoWindow({
                content: '<div style="width:150px;text-align:center;padding:6px 0;">가게 위치</div>'
            });
            infowindow.open(map, marker);
            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            map.setCenter(coords);
        }
        function zoomIn() {
            // 현재 지도의 레벨을 얻어옵니다
            var level = map.getLevel();
    
            // 지도를 1레벨 내립니다 (지도가 확대됩니다)
            map.setLevel(level - 1);
    
            // 지도 레벨을 표시합니다
            displayLevel();
        }
    
        function zoomOut() {
            // 현재 지도의 레벨을 얻어옵니다
            var level = map.getLevel();
    
            // 지도를 1레벨 올립니다 (지도가 축소됩니다)
            map.setLevel(level + 1);
    
            // 지도 레벨을 표시합니다
            displayLevel();
        }
    });
}
</script>
<script>
	$(document).on('click', '#registerForm input[value=" + "]', function(){
		$(this).parent().parent().append('<div><input type="file" id="filename" name="filename"><input type="button" value=" + "></div>');
		$(this).val(" - ");
	});
	
	$(document).on('click', '#registerForm input[value=" - "]',function(){
		$(this).parent().remove();
	});
</script>
</head>
<body>
	<div id="main-title" class="main-title">
  <h1 id="main-subject">가게 등록</h1>
  </div>
  <form action="storeRegisterOk" ModelAttribute="StoreDTO" id="registerForm" method="post" enctype="multipart/form-data">
    <fieldset>
      <legend>기본 정보</legend>
      <label for="owner_id">사장님 ID:</label>
      <input type="text" id="owner_id" name="owner_id" value="${logId}" readonly required>
      <label for="store_name">가게 이름:</label>
      <input type="text" id="store_name" name="store_name" required>
      <label for="location">위치:</label>
      <input type="text" id="location" name="location" onkeyup="locationCheck()" required>
      <div id="map" style="width:720px; height:400px;"></div>
      <label for="district">구역:</label>
      <input type="text" id="district" name="district" required>
      <label for="tel_number">전화번호:</label>
      <input type="tel" id="tel_number" name="tel_number" required>
      <label for="owner_comment">사장님 코멘트:</label>
      <textarea id="owner_comment" name="owner_comment"></textarea>
    </fieldset>

    <fieldset>
      <legend>영업 정보</legend>
      <label for="open_time">오픈 시간:</label>
      <input type="text" id="open_time" name="open_time" required>
      <label for="close_time">마감 시간:</label>
      <input type="text" id="close_time" name="close_time" required>
      <label for="how_to_come">찾아오는 길:</label>
      <textarea id="how_to_come" name="how_to_come"></textarea>
      <label for="parking">주차 가능 여부:</label>
      <input type="checkbox" id="parking" name="parking">
      <label for="wifi">와이파이 가능 여부:</label>
      <input type="checkbox" id="wifi" name="wifi">
      <label for="animal">반려동물 출입 가능 여부:</label>
      <input type="checkbox" id="animal" name="animal">
      <label for="group_customer">단체 좌석 제공 여부:</label>
      <input type="checkbox" id="group_customer" name="group_customer">
      <label for="playroom">놀이방 유무:</label>
      <input type="checkbox" id="playroom" name="playroom">
      <label for="disabled">장애인 시설 유무:</label>
      <input type="checkbox" id="disabled" name="disabled">
    </fieldset>

    <fieldset>
      <legend>사진 업로드</legend>
      <label for="filename">가게 사진:</label>
      <div id="file-upload">
      <input type="file" id="filename" name="filename"><input type="button" value=" + ">
      </div>
    </fieldset>

    <input type="submit" value="가게 등록">
  </form>
    <%@ include file="/resources/footer.jspf" %>
</body>
</html>
