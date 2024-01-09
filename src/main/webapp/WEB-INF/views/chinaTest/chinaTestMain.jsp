<%@page import="com.example.model.WordTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%
	int wordLength = (int) request.getAttribute("chinaTestSize");

%>
<html>
	<head>
		<title>WM Global Test</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  		
  		<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  		
  		<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
		<link rel="stylesheet" href="assets/css/main.css" />		
		<style>
			.btn	{
			    font-family: 'iceHimchan-Rg';
				text-align:center;
				width:300px;
				height:150px;
			
			}
			
			div	{
			    font-family: 'iceHimchan-Rg';
			
			}
			
			input	{
			    font-family: 'iceHimchan-Rg';
				background-color: transparent;
				width:165px;
				
			}
			
			@font-face {
			    font-family: 'iceHimchan-Rg';
			    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-2@1.0/iceHimchan-Rg.woff2') format('woff2');
			    font-weight: normal;
			    font-style: normal;
			}
		</style>
		
		<script>
			// 숫자만 적을 수 있는 정규식
			const regex = /^[0-9]+$/;
		
			window.onload = function() {
				
				document.getElementById("testBtn").onclick = function() {
					
					let number = document.getElementById("numberText").value;
					let wordLength = <%=wordLength%>;
					
					if(number.trim() == "") {
						alert("시험 볼 단어 숫자를 입력해주세요!");
						return false;
					}
					
					if(!regex.test(number)) {
						alert("숫자만 입력 가능합니다!");
						return false;
					}
					
					if(number == 0) {
						alert("0은 입력할 수 없습니다!");
						return false;
					}
					
					if(number > wordLength) {
						alert("전체 단어 수보다 많은 값이 입력되었습니다!");
						return false;
					}
				}
				
				document.getElementById("totalTestBtn").onclick = function() {
					let wordLength = <%=wordLength%>;
					
					if(wordLength == 0) {
						alert("단어가 존재하지 않습니다!");
						return false;
					}
					
					
				}
			}
		</script>	
	</head>
<body>
	<div id="wrapper">
	
	<div><a href="wm.do"><img src="../images/WMLogo.png" style="width:50%; margin-left:130px;" /></a></div>
	<br>
	
	<div>
		<form action="test.do" method="post" id="efrm">
		<input type="hidden" value="Chinese" name="category" />
		시험 볼 단어 수 : <input type="text" id="numberText" name="numberText" placeholder="전체 단어 수 : <%=wordLength%>"><br><br>
		<button class="btn" id="testBtn">시험</button>
		</form>
		<br><br>
		<form action="totalTest.do" method="post" id="tefrm">
		<input type="hidden" value="Chinese" name="category" />
		
		<button class="btn" id="totalTestBtn">전체 시험</button>
		</form>
	</div>
	
		<!-- Header -->
		<header id="header">
				
		<!-- 단어 추가 모달창 -->		
		<div class="container mt-3">
      	</div>
	
		</header>

		<!-- Footer -->
		<footer id="footer">
			<p class="copyright">&copy; 글로벌 단어장 : <a href="wm.do"><img src="../images/WMLogo.png" style="width:2%; margin-top:-1px;" /></a>
		</footer>
		
	</div>
		
	<!-- BG -->
	<div id="bg2"></div>		
</body>
</html>