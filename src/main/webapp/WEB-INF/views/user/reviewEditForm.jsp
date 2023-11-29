<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<%@ include file="/resources/header.jspf" %>
<style>
#myform fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
#myform fieldset legend{
    text-align: right;
}
#myform input[type=radio]{
    display: none;
}
#myform label{
    font-size: 3em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
#myform label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#review {
    width: 100%;
    height: 150px;
    padding: 10px;
    box-sizing: border-box;
    border: solid 1.5px #D3D3D3;
    border-radius: 5px;
    font-size: 16px;
    resize: none;
}
body{
	margin : 0 auto;
}
.wrapper_div{
	background-color: #FCFCFC;
	height: 100%;  	
	max-width: 1200px;
	margin : 0 auto;
}
.subject_div{
	background-color: #FF7100;
	color: #fff;
	padding: 10px;
	font-weight: bold;
	text-align: center;
	max-width: 1200px;
	margin : 0 auto;
}
.input_wrap{
	padding: 30px;
	text-align: center;
}
.btn_wrap{
	margin : 20px auto;
	padding: 5px 30px 30px 30px;
	text-align: center;
}
.cancel_btn{
	margin-right:5px;
	display: inline-block;
	height:40px;
	width: 150px;
	background-color: #fff;
	color: #7d7d7d;
	font-size: 14px;
	line-height: 20px; 
	border: 1px solid #dadada;
	cursor: pointer;
}
.enroll_btn{
	display: inline-block;
	line-height:20px;
	height:40px;
	width: 150px;
	background-color: #FF7100;
	color: #fff;
	font-size: 14px;
	border:none;
	cursor: pointer; 	
}
.enroll_btn:hover{
	background-color:#FFA964;
	cursor:pointer;
}
.filebox{
	margin: 10px auto;
	text-align:center;
}
.input_file{
	border: 1px solid #dadada;
	height: 27px;
	color: #7d7d7d;
}
.file_btn{
	color: #7d7d7d;
	width: 70px;
	height: 30px;
	background: #fff;
	border: 1px solid #dadada;
	cursor: pointer;
	margin-bottom : 20px;
}
.desc{
	color: #7d7d7d;
	margin-bottom:40px;
}
.rating_div{
	padding-top: 10px;
}
h4{
	margin:0;
	text-align:center;
	color:#99999;
}
select{
	margin: 15px;
	width: 100px;
	height: 40px;
	text-align: center;
	font-size: 16px;
	font-weight: 600;
}
.content_div{
	padding-top: 10px;
}

textarea{
	width: 100%;
	height: 100px;
	border: 1px solid #dadada;
	padding: 12px 8px 12px 8px;
	font-size: 15px;
	color: #99999;
	resize: none;
	margin-top: 10px;  	
} 	
</style>
<script>
function cancelCheck(){
	if(confirm("정말 취소하시겠습니까 ?")==true){
		history.back();
	}else{
		return false;
	}	
}
//첨부파일 등록
function fileReg(){
 $('#file').click();
}

//첨부파일 삭제
function fileRm(){
	$('#file, #file_text').val('');
}

//파일등록시 확장자 검사
function fileChange(obj){
	var fileNm = obj.value; 
	var maxSize = 10485760; //10mb
	var fileSize = 0; 
	if(fileNm != ''){
		fileSize = document.getElementById("file").files[0].size;
	}
	if(fileNm != ''){
		var ext = fileNm.slice(fileNm.lastIndexOf(".")+1).toLowerCase();
		if(ext != 'jpg' && ext != 'png' && ext != 'gif'){
			alert('jpg, png, gif 파일만 등록이 가능합니다.');
			fileRm();
			return;
		}else if(fileSize > maxSize){
			alert('10MB 이하의 파일만 등록이 가능합니다.');
			fileRm();
			return;
		}else{
			$('#file_text').val(fileNm);
		}
	}
}
</script>
<body>
<form method="post" name="myform" id="myform" action="reviewEditOk" enctype="multipart/form-data">
	<div class="wrapper_div">
		<div class="subject_div">
			${dto.store_name }에 대한 리뷰를 써주세요
			<input type="hidden" name="store_seq" value="${dto.store_seq}"/>
			<input type="hidden" name="seq" value="${dto.seq}"/>
		</div>
		
		<div class="input_wrap">
			<div class="rating_div">
			<fieldset>
				<h4>별점을 선택해 주세요</h4>
				<c:if test="${dto.score == '5' }">
					<input type="radio" name="score" value="5" id="rate1" checked="checked"><label for="rate1">★</label>
					<input type="radio" name="score" value="4" id="rate2"><label for="rate2">★</label>
					<input type="radio" name="score" value="3" id="rate3"><label for="rate3">★</label>
					<input type="radio" name="score" value="2" id="rate4"><label for="rate4">★</label>
					<input type="radio" name="score" value="1" id="rate5"><label for="rate5">★</label>
				</c:if>
				<c:if test="${dto.score == '4' }">
					<input type="radio" name="score" value="5" id="rate1"><label for="rate1">★</label>
					<input type="radio" name="score" value="4" id="rate2" checked="checked"><label for="rate2">★</label>
					<input type="radio" name="score" value="3" id="rate3"><label for="rate3">★</label>
					<input type="radio" name="score" value="2" id="rate4"><label for="rate4">★</label>
					<input type="radio" name="score" value="1" id="rate5"><label for="rate5">★</label>
				</c:if>
				<c:if test="${dto.score == '3' }">
					<input type="radio" name="score" value="5" id="rate1"><label for="rate1">★</label>
					<input type="radio" name="score" value="4" id="rate2"><label for="rate2">★</label>
					<input type="radio" name="score" value="3" id="rate3" checked="checked"><label for="rate3">★</label>
					<input type="radio" name="score" value="2" id="rate4"><label for="rate4">★</label>
					<input type="radio" name="score" value="1" id="rate5"><label for="rate5">★</label>
				</c:if>
				<c:if test="${dto.score == '2' }">
					<input type="radio" name="score" value="5" id="rate1"><label for="rate1">★</label>
					<input type="radio" name="score" value="4" id="rate2"><label for="rate2">★</label>
					<input type="radio" name="score" value="3" id="rate3"><label for="rate3">★</label>
					<input type="radio" name="score" value="2" id="rate4" checked="checked"><label for="rate4">★</label>
					<input type="radio" name="score" value="1" id="rate5"><label for="rate5">★</label>
				</c:if>
				<c:if test="${dto.score == '1' }">
					<input type="radio" name="score" value="5" id="rate1"><label for="rate1">★</label>
					<input type="radio" name="score" value="4" id="rate2"><label for="rate2">★</label>
					<input type="radio" name="score" value="3" id="rate3"><label for="rate3">★</label>
					<input type="radio" name="score" value="2" id="rate4"><label for="rate4">★</label>
					<input type="radio" name="score" value="1" id="rate5" checked="checked"><label for="rate5">★</label>
				</c:if>
			</fieldset>
			</div>
		</div>
			<div class="file_div">
				<h4>사진업로드</h4>
				<div class="filebox">
					<input type="hidden" value="${dto.file_location }" id="before_filename" name="before_filename">
    				<input type="file" id="file" name="filename" title="" onchange="fileChange(this)" style="display:none;"/>
					<input type="text" id="file_text" name="file_text" title="" readonly="readonly" value="${dto.file_location }" class="input_file"/>
					<input type="button" class="file_btn" value="파일 선택" onclick="fileReg()"/>
					<input type="button" class="file_btn" value="삭제" onclick="fileRm()" />
					<div class="desc">10MB 이하의 jpg, png, gif 파일만 업로드 가능합니다.</div>
				</div>
			</div>
			<div class="content_div">
				<h4>리뷰 작성</h4>
				<textarea name="review" id="review"
						  placeholder="레스토랑과 유저들에게 도움이 되는 따뜻한 리뷰를 작성해주세요.">${dto.review }</textarea>
			</div>		
		
		<div class="btn_wrap">
			<input type="button" value="취소" class="cancel_btn" onclick="cancelCheck()"/>
			<input type="submit" value="등록" class="enroll_btn"/>
		</div>
	</div>
</form>
</body>