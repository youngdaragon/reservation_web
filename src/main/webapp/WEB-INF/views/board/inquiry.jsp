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
	#file_search{
		border:none;
		background-color:#FF7100;
		color:white; 
		width:100px;
		height:30px;
	}
	input:focus, textarea:focus{
		outline:none;
	}
	#btn1{
		border:none;
		background-color:#FF7100;
		color:white; 
		width:100px;
		height:40px;
		border-radius:10px;
		margin-right:20px;
	}
	#btn2{
		border:none;
		background-color:#FF7100;
		color:white; 
		width:100px;
		height:40px;
		border-radius:10px;
	}
	#file_search:hover, #btn1:hover, #btn2:hover{
		background-color:#FFA964;
		cursor:pointer;
	}
	.btn{
		text-align:center;
		margin-top:20px;
	}
  /************ loding bar ***************/ 
  .maskPop {
    display: none;
    justify-content: center;
    align-items: center;
  
   }
  .maskTxt{
    display: block;
    position: absolute;
    margin: 5% auto;
    margin-top : 70%;
    font-size: 16px;
    font-family: math;
    font-weight: bold;
    z-index : 2;
   }
   
  .loding_bar {
     display:block;
     position: absolute;
     margin: 5% auto;
     height: 80px;
     width: 80px;
     margin-top : 70%;
     border: 6px solid #fff;
     border-right-color: #c30;
     border-top-color: #c30;
     border-radius: 100%;
     -webkit-animation: spin 800ms infinite linear;
     animation: spin 800ms infinite linear;
     z-index : 1;
   }
   
   .mask{
      display:none;
      width:100%; 
      height:2000px; 
      position:fixed; 
      background:black; 
      opacity: 0.15;
   }
   
   
   @-webkit-keyframes "spin" 
   {
     from { transform: rotate(0deg); }
     to   { transform: rotate(359deg); }
   }
   
   @keyframes "spin" 
   {
     from { transform: rotate(0deg); }
     to   { transform: rotate(359deg); }
   } 
   
/***************************************/ 
</style>
</head>
<script>

$(document).ready(function() { // document ready function

	   var uploadFile = $('#file_hidden');

	   //File Upload change function
	   uploadFile.on('change',function(){
	         
	      var nBytes = 0;
	      var oFiles = document.getElementById("file_hidden").files;
	      var nFiles = oFiles.length;
	      var nFilesLimit = 1024 * 1024 * 100; // 파일 사이즈 제한 100Mb
	      
	      for (var nFileId = 0; nFileId < nFiles; nFileId++) {
	               nBytes += oFiles[nFileId].size;
	       }
	      
	      var nMBytes = (String)(nBytes/(nFilesLimit/10)).substring(0,5);
	      
	      // Upload FileSize Check
	      if ( nBytes >= nFilesLimit){
	         alert('업로드 파일 사이즈가 초과되었습니다!\n[ 파일 사이즈 제한 100Mb ] \n[ 요청한 파일 사이즈 :' + nMBytes +' Mb ] ');
	         return false;
	      }else if ( nBytes == 0 ){
	         alert('요청하신 파일 사이즈가 0 입니다.\n파일을 다시 확인해주세요 ! ');
	         return false;
	      }
	         
	      if(window.FileReader){ 
	          var showname = $(this)[0].files[0].name; 
	       } else {
	          var showname = $(this).val().split('/').pop().split('\\').pop(); 
	       } 
	      
	      //input text에 보여지는 File Name
	      $(this).siblings('#file_show').val(showname);
	      });
	   }); // document ready function End

	   

	   function btnCommit(){
	     
	       var url = "inquiryWriteOk";       // ajax로 요청하는 controller Name
	       var form = $('#inquiryForm')[0]; // 파일
	       var formData = new FormData(form); // 파일을 formData에 실음
	       
	       $.ajax({
	         type: "POST",
	         url: url,
	         enctype: 'multipart/form-data',
	         data: formData,
	         processData: false,
	         contentType: false,
	         success: function(data) {    /* ajax 요청 Success 시 , 발생되는 func */
	         	suc();
	         },
	         beforeSend:function(data){ /* ajax send 시 , 발생되는 func || mask처리 */
	             var pop     = document.getElementById("maskPop");
	             var mask     = document.getElementById("mask");
	             maskPop.style.display = 'flex';
	             mask.style.display = 'block';
	         },
	         complete:function(data){ /* ajax send 시 , 실행 완료 후 발생되는  func || mask처리 */
	            var pop  = document.getElementById("maskPop");
	            var mask  = document.getElementById("mask");
	            maskPop.style.display = 'none';
	            mask.style.display = 'none';
	         },
	         error: function(data) { /* ajax 요청 Fail 시 , 발생되는 func */
	            alert('통신 과정에서 오류가 발생하였습니다.\n다시 시도해주세요 !');
	         }
	      }); 
	    }
	   
	   // 작성 취소
	   function cancel() {
		   // alert 창 띄우기
		   alert("작성을 취소하시겠습니까?");
		   // 이전 페이지로 돌아가기
		   window.location.href="/board/inquiry";
	   }
	   // 성공
	   function suc(){
		   alert('1:1문의가 등록되었습니다.');
		   window.location.href="/board/inquiryList";
	   }

</script>
<body>

	<!-- 페이지 mask 처리 -->
   <div id="mask" class="mask"></div> 
   
   <!-- LodingBar 처리 -->
   <div id="maskPop" class="maskPop">
      <div id="loding_bar" class="loding_bar"></div>
      <div id="maskTxt" class="maskTxt">서버로 요청하고 있어요!!</div>
   </div>

	<div class="c">
	<div class="all">
		<h1>1:1 문의</h1>
		<div style="border-top:1px solid #696969; margin-bottom:20px;"></div>
		<form method="post" action="inquiryWriteOk" id="inquiryForm" enctype="multipart/form-data">
			<ul>
				<li>제목</li>
					<li style="margin-bottom:20px;"><input type="text" name="question_title" id="question_title"/></li>
				<li>상담내용</li>
					<li style="margin-bottom:20px;"><textarea name="question" id="question"></textarea></li>
				<li>첨부파일</li>
					<li>
						<input type="file" name="filename" id="file_hidden" style="display: none;" />
	            		<input type="text" name="file_show" id="file_show" style="width:400px; height:25px; padding-left:5px; padding-bottom:3px; font-weight:bold;" readonly="readonly"/>
	            		<input type="button" class="searchBtn ml10" id="file_search" value="파일 찾기" onclick=document.all.file_hidden.click();> 
	
					</li>
				<li>
					<div class="btn">
						<input type="button" value="취소하기" id="btn1" onclick="cancel()"/>
						<input type="button" value="등록하기" id="btn2" onclick="btnCommit()"/>
					</div>
				</li>
			</ul>
		</form>
		</div>
	</div>
	<%@ include file="/resources/footer.jspf" %>
	</body>
</html>