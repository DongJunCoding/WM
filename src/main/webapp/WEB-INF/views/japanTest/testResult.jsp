<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	//원래 시험 정보 리스트
	String original[] = (String[]) request.getAttribute("original");
	String testArr[] = (String[]) request.getAttribute("testArr");
	String type[] = (String[]) request.getAttribute("type");

	//내가 쓴 답 리스트
	ArrayList<String> testList = (ArrayList<String>) request.getAttribute("testList");

	String wIds[] = (String[]) request.getAttribute("wId");
	
	//맞은 개수, 틀린 개수 카운팅
	int correctCount = 0;
	int incorrectCount = 0;
	
    int row = 4;

	
	StringBuilder sbHtml = new StringBuilder();
	
		sbHtml.append("<form action='japanTestMain.do' post='method'>");

	
	for(int i = 0; i < wIds.length; i++) {
		
		sbHtml.append("<div class='word-box'>");
		
		//맞은 경우와 틀린 경우 색깔로 구별
		if(testArr[i].equals(testList.get(i))) {
			sbHtml.append("<div>" + type[i] + "</div>");
			sbHtml.append("<div style='color:blue'>내가 쓴 단어 : " + testArr[i] +"</div>");
			sbHtml.append("<div style='color:blue'>정답 : " + testList.get(i) + "</div>");
			sbHtml.append("<div>" + original[i] + "</div>");

			correctCount++;
		}
		
		else if(!testArr[i].equals(testList.get(i))) {
			
			sbHtml.append("<div>" + type[i] + "</div>");
			sbHtml.append("<div style='color:red'>내가 쓴 뜻 : " + testArr[i] +"</div>");
			sbHtml.append("<div style='color:red'>정답 : " + testList.get(i) + "</div>");
			sbHtml.append("<div>" + original[i] + "</div>");

			incorrectCount++;
		}
		
		sbHtml.append("</div>");
		
        if ((i + 1) % row == 0 && i != wIds.length - 1) {
            sbHtml.append("<br>");
        }
		
	}
	
    sbHtml.append("<br>");
    sbHtml.append("<br>");

    sbHtml.append("<div>");
	sbHtml.append("<button class='btn btn' style='font-size:25px;'>시험 보기</button>");
    sbHtml.append("</div>");
	
	sbHtml.append("</form>");


%>
<html>
<head>
<meta charset="UTF-8">
<title>WM 영어 시험 결과</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
		@font-face {
		    font-family: 'iceHimchan-Rg';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-2@1.0/iceHimchan-Rg.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
		}
		
		div	{
		    font-family: 'iceHimchan-Rg';
		   text-align: center;
		}
			
	    body {
		    font-family: 'iceHimchan-Rg';
		    background-color: #f4f4f4;
		    padding: 0;
		    display: flex;
		    flex-wrap: wrap;
		    justify-content: center;
		    align-items: center;
		    height: 80vh; /* 80vh = 800px * 0.8 = 640px */
		    background-color: transparent;
		   	background-image: url("../../images/도기코기집.png");
		   	background-size: cover;
    
		    
		 }
		
		div#header-container {
		    text-align: center;
		    width: 100%;
		 }
		
		div#logo-container {
		    margin: 0 auto;
		    width: 50%;
		 }
		
		.word-box {
       	  width: 200px;
          height: 110px;
		  background-color: rgba(255, 255, 255, 0.5);
          border: 1px solid rgba(255, 255, 255, 0.075);
          margin: 25px 60px;
          padding: 10px;
          box-sizing: border-box;
          text-align: center;
          line-height: 1.4;
          transition: background-color 0.3s;
          display: inline-block;
          border-radius:20px;
      	}

</style>
</head>
<body>

	<div id="header-container">
		<div id="logo-container"><a href="wm.do"><img src="../images/WMLogo.png" style="width:30%;" /></a></div>
		<h2 style="text-align: center;">전체 영어 단어 시험 결과</h2>
		<br>
		
		<div style="color:blue; font-size:25px;"> 맞은 개수 : <%=correctCount %></div>
		<br>
	
		<div style="color:red; font-size:25px;"> 틀린 개수 : <%=incorrectCount %></div>
	</div>
	

<%=sbHtml %>



</body>
</html>