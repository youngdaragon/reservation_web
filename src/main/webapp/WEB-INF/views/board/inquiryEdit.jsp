<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/header.jspf" %> 
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>
	*{
		text-size:1.2em;
	}
	.c{
		display:flex;
		justify-content:center;
		margin-top:50px;
		margin-bottom:30px;
	}
	#inquiryForm li{
		padding:5px 0px;
		margin-bottom:5px;
	}
	h1{
		text-align:center;
		margin-bottom:30px;
		color:#696969;
	}
	#question_title{
		width:500px;
		height:30px;
	}
	#question{
		width:500px;
		height:250px;
	}
	ul{
		list-style-type:none;
	}
	input, textarea{
		border:1.5px solid #ddd;
		border-radius:5px;
	}
	input[type="submit"]{
		border:none;
		background-color:#FF7100;
		color:white; 
		width:100px;
		height:40px;
		border-radius:30px;
		margin-left:20px;
	}
	input:focus, textarea:focus{
		outline:none;
	}
	.btn{
		text-align:center;
		margin-top:40px;
	}
	#btn1:hover, #btn2:hover{
		background-color:#FFA964;
		cursor:pointer;
	}
	#btn1{
		border:none;
		background-color:#FF7100;
		color:white; 
		width:100px;
		height:40px;
		border-radius:30px;
		margin-right:20px;
	}
</style>
</head>
<script>
	// 폼의 유효성검사
	$("#inquiryEdit").submit(function(){
		if($("#question_title").val()==""){
			alert("제목을 입력하세요.");
			return false;
		}else{
			alert("문의가 등록되었습니다.\n문의내역은 마이페이지에서 확인가능합니다.");
		}
	});

	// 작성 취소
	   function cancel() {
		   // alert 창 띄우기
		   alert("작성을 취소하시겠습니까?");
		   // 이전 페이지로 돌아가기
		   window.location.href="/board/inquiryList";
	   }
</script>
<body>
<div class="c">
<div class="all">
	<h1>1:1 문의</h1>
	<div style="border-top:1px solid #696969; margin-bottom:20px;"></div>
	<form method="post" action="../inquiryEditOk" id="inquiryEdit" enctype="multipart/form-data">
		<input type="hidden" name="seq" value="${dto.seq }"/>
		<input type="hidden" name="before_filename" value="${filename }"/>
		<ul>
			<li>제목</li>
				<li style="margin-bottom:20px;"><input type="text" name="question_title" id="question_title" value="${dto.question_title}"/></li>
			<li>상담내용</li>
				<li style="margin-bottom:20px;"><textarea name="question" id="question">${dto.question}</textarea></li>
			<li>
				<c:if test="${not empty filename}">
					<a href="/uploadfile/${filename}" download>이전 첨부파일 : ${filename}</a>
				</c:if>
				<c:if test="${empty filename}">
					첨부된 파일이 없습니다.
				</c:if>
				<p style="color:gray; font-size:0.9em;">(새로운 파일을 선택하시려면 아래의 파일찾기를 선택해주세요.<br/>
				단, 새로운 파일을 선택히신 경우, 이전에 첨부한 파일은 사라집니다.)</p>
			</li>
			<li>첨부파일</li>
				<li>
					<div><input type="file" name="filename"/></div>
				</li>
			<li>
				<div class="btn">
					<input type="button" value="취소하기" id="btn1" onclick="cancel()"/>
					<input type="submit" value="글 수정하기" id="btn2"/>
				</div>
			</li>
		</ul>
	</form>
</div>
</div>

<%@ include file="/resources/footer.jspf" %>
</body>
</html>