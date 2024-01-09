<%@page import="com.example.model.WordTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%
	ArrayList<WordTO> engList = (ArrayList) request.getAttribute("engList");
	
	String wId = null;
	
	StringBuilder sbHtml = new StringBuilder();

	int count = 0; // 한 줄에 담을 행 개수

	
	for(WordTO to : engList) {
		
		wId = to.getWId();
		
	    if(count % 2 == 0) {
			sbHtml.append("<tr>");
	    }
	    sbHtml.append("<td id='td1'><input style='background-color: black;' class='form-check-input radioOption' type='radio' value='" + wId + "' data-word='" + to.getWname() + "' data-meaning='" + to.getWmean() + "' data-pos='" + to.getWtype() + "' name='wId'></td>");
        sbHtml.append("<td id='td2'>" + to.getWname() + "</td>");
        sbHtml.append("<td id='td3'>" + to.getWmean() + "</td>");
        if(count % 2 == 1) {
        	sbHtml.append("<td id='td4'>" + to.getWtype() + "</td>");
        }
        else {
        	sbHtml.append("<td style='border-right:solid 2px white'id='td4'>" + to.getWtype() + "</td>");
        }
        
      	count++;
      	
      	 if(count % 2 == 0) {
             sbHtml.append("</tr>");
         }
	}
	
	if (count % 2 != 0) {
	    sbHtml.append("</tr>");
	}
%>
<html>
	<head>
		<title>WM</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  		
  		<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  		
  		<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
		<link rel="stylesheet" href="assets/css/main.css" />		
		<style>
			#th1, #th2, #th3, #th4, #th5, #th6, #th7, #th8, #td1, #td2, #td3, #td4	{
				background:transparent;
				width:400px;
			    font-family: 'iceHimchan-Rg';
    			font-size:20px;
				
			}
			
			#th1, #th2, #th3, #th4, #th5, #th6, #th7, #th8	{
				color:coral;
				text-align:center;
			    font-family: 'iceHimchan-Rg';
				
				
			}
			
			#td1, #td2, #td3, #td4	{
				color:white;
			}
			
			#th4	{
				border-right:2px solid white;
			}
			
			.btn	{
			    font-family: 'iceHimchan-Rg';
				text-align:center;
			
			}
			
			div, input	{
			    font-family: 'iceHimchan-Rg';
				
			}
			
			@font-face {
			    font-family: 'iceHimchan-Rg';
			    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-2@1.0/iceHimchan-Rg.woff2') format('woff2');
			    font-weight: normal;
			    font-style: normal;
			}


		</style>
		
		<script>
			window.onload = function() {
				// 단어 추가 경고창
				document.getElementById('sbtn').onclick = function() {
					if(document.getElementById('word').value.trim() == "") {
						alert('단어를 입력해주세요!');
						return false;
					}
					
					if(document.getElementById('mean').value.trim() == "") {
						alert('뜻을 입력해주세요!');
						return false;
					}
					
					document.wfrm.submit();
				}
				
				// 단어 수정 경고창
				document.getElementById('msbtn').onclick = function() {
					
					if(document.getElementById('mword').value.trim() == "") {
						alert('단어를 입력해주세요!');
						return false;
					}
					
					if(document.getElementById('mmean').value.trim() == "") {
						alert('뜻을 입력해주세요!');
						return false;
					}
					
					document.efrm.submit();
				}
				
				
				// 수정창 클릭시 해당 선택 라디오 열에 대한 데이터 가져오기
				document.getElementById('openModalBtn').addEventListener('click', function (event) {
					
					// 선택된 라디오 버튼 가져오기
			        var selectedRadio = document.querySelector('input[name="wId"]:checked');
			        
			        var selectedOption = $("input[name='wId']:checked").val();
			        
			
			        if (selectedRadio) {
			            // 선택된 라디오 버튼의 데이터 가져오기            
			            var word = selectedRadio.getAttribute('data-word');
			            var meaning = selectedRadio.getAttribute('data-meaning');
			            var pos = selectedRadio.getAttribute('data-pos');
			
			            // 모달에 정보 적용       
			            document.getElementById('wId').value = selectedOption;
			            document.getElementById('mword').value = word;
			            document.getElementById('mmean').value = meaning;
			            document.getElementById('mpart').value = pos;

			        } else {
			            alert("선택을 해주세요!");
			            //모달 소멸
			            $('#wordModify').modal('dispose');
			        }
			    });
			} 
		</script>
	</head>
<body>
	<div id="wrapper">
	
	<div><a href="wm.do"><img src="../images/WMLogo.png" style="width:50%; margin-left:130px;" /></a></div>
	<br><br><br><br>
	
	<div>
		<a href="ememorize.do"><button class="btn btn" style="background-color: orangered;">English</button></a>
		<a href="jmemorize.do"><button class="btn btn">Japanese</button></a>
		<a href="cmemorize.do"><button class="btn btn">Chinese</button></a>
	</div>
	
		<!-- Header -->
		<header id="header">
				
		<!-- 단어 추가 모달창 -->		
		<div class="container mt-3">
      	<button type="button" class="btn btn" data-bs-toggle="modal" data-bs-target="#wordModal" data-bs-whatever="" style="float:right">단어 추가</button>
      	
      	<div class="modal fade" id="wordModal" tabindex="-1" aria-labelledby="wordModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h3 style="color:black" class="modal-title" id="wordModalLabel">단어 추가창</h3>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <form action="wordWrite.do" method="post" id="wfrm">
			      <input type="hidden" value="English" name="category" />
			      <div class="modal-body">
			          <div class="mb-3">
			            <label for="recipient-name" class="col-form-label">Word(단어)</label>
			            <input type="text" class="form-control" id="word" name="word">
			          </div>
			          <div class="mb-3">
			            <label for="recipient-name" class="col-form-label">Mean(뜻)</label>
			            <input type="text" class="form-control" id="mean" name="mean">
			          </div>
			          <div class="mb-3">
			            <label for="recipient-name" class="col-form-label">Parts of Speech(품사)</label>
			            <input type="text" class="form-control" id="part" name="part">
			          </div>
			          <span style="color:royalblue;">추가 후에 새로고침을 해주세요!</span>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			        <button type="submit" class="btn btn-primary" id="sbtn">단어 추가</button>
			      </div>
		      </form>
		    </div>
		  </div>
		</div>
      
      	<script>
	      	let wordModal = document.getElementById('wordModal')
	      	wordModal.addEventListener('show.bs.modal', function (event) {
	      	  // Button that triggered the modal
	      	  let button = event.relatedTarget
	      	  
	      	  let recipient = button.getAttribute('data-bs-whatever')
	      	  
	      	  let modalTitle = wordModal.querySelector('.modal-title')
	      	  let modalBodyInput = wordModal.querySelector('.modal-body input')
		
	      	  modalBodyInput.value = recipient
	      	})
      	</script>
      	
      	
      	<!-- 단어 수정 모달창 -->
      	<div class="modal fade" id="wordModify" tabindex="-1" aria-labelledby="wordModifyLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h3 style="color:black" class="modal-title" id="wordModifyLabel">단어 수정창</h3>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <form action="wordModifyOk.do" method="post" id="efrm">
			      <input type="hidden" value="English" name="category" />
			      <input type="hidden"  id="wId" name="wId" />
			      <div class="modal-body">
			          <div class="mb-3">
			            <label for="recipient-name" class="col-form-label">Word(단어)</label>
			            <input type="text" class="form-control" id="mword" name="mword">
			          </div>
			          <div class="mb-3">
			            <label for="recipient-name" class="col-form-label">Mean(뜻)</label>
			            <input type="text" class="form-control" id="mmean" name="mmean">
			          </div>
			          <div class="mb-3">
			            <label for="recipient-name" class="col-form-label">Parts of Speech(품사)</label>
			            <input type="text" class="form-control" id="mpart" name="mpart">
			          </div>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			        <button type="submit" class="btn btn-primary" id="msbtn">단어 수정</button>
			      </div>
		      </form>
		    </div>
		  </div>
		</div>
      
      	<script>
	      	let wordModify = document.getElementById('wordModify')
	      	wordModify.addEventListener('show.bs.modal', function (event) {
	      	  // Button that triggered the modal
	      	  let button = event.relatedTarget
	      	  
	      	  let recipient = button.getAttribute('data-bs-whatever')
	      	  
	      	  let modalTitle = wordModal.querySelector('.modal-title')
	      	  let modalBodyInput = wordModal.querySelector('.modal-body input')
		
	      	  modalBodyInput.value = recipient
	      	})
      	</script>
      <!-- 단어 리스트 -->
      
		    <form action="wordDelete.do" method="post">
		    <input type="hidden" value="English" name="category" />
      		<button type="submit" class="btn btn" style="float:right" name="abtn">전체 삭제</button>
      		<button type="submit" class="btn btn" style="float:right" name="dbtn">단어 삭제</button>
           	<button type="button" id="openModalBtn" class="btn btn" data-bs-toggle="modal" data-bs-target="#wordModify" data-bs-whatever="" style="float:right" name="mbtn">단어 수정</button>		
		  <table class="table">
		    <thead>
		      <tr>		      	
		        <th id="th1" style="width:7%">선택</th>
		        <th id="th2" style="width:10%">단어</th>
		        <th id="th3" style="width:25%">뜻</th>
		        <th id="th4" style="width:8%">품사</th>
		        <th id="th5" style="width:7%">선택</th>
		        <th id="th6" style="width:10%">단어</th>
		        <th id="th7" style="width:25%">뜻</th>
		        <th id="th8" style="width:8%">품사</th>
		      </tr>
		    </thead>
		    <tbody>
		     <%=sbHtml %>
		    </tbody>
		  </table>
      		</form>
		</div>
		
		</header>

		<!-- Footer -->
		<footer id="footer">
			<p class="copyright">&copy; 글로벌 단어장 : <a href="wm.do"><img src="../images/WMLogo.png" style="width:2%; margin-top:-1px;" /></a>
		</footer>
		
	</div>
		
	<!-- BG -->
	<div id="bg1"></div>		
</body>
</html>