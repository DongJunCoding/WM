<%@page import="com.example.model.WordTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	ArrayList<WordTO> japanList = (ArrayList<WordTO>) request.getAttribute("japanList");


%>
<html>
<head>
<meta charset="UTF-8">
<title>WM Total Japanese Test</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<style>

		@font-face {
		    font-family: 'iceHimchan-Rg';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-2@1.0/iceHimchan-Rg.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
		}
		
		input	{
		    font-family: 'iceHimchan-Rg';
		
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
		    height: 80vh;  /* 80vh = 800px * 0.8 = 640px */
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
	
	    .answer-input {
	      width: 100px; /* 크기 조정 */
	      margin-top: 10px;
	      margin-bottom: 10px;
	      text-align : center;
	      border: 1px solid rgba(255, 255, 255, 0.075);
		  border-radius:10px;      	
	        
	    }
	    
	    .type-div	{
	    	margin-bottom: 10px;
	    
	    }
	    

		.btn {
		    font-family: 'iceHimchan-Rg';
		    font-size: 25px;		   
		}
				
		
    </style>
    
</head>
<body>
	<div id="header-container">
    <div id="logo-container"><a href="wm.do"><img src="../images/WMLogo.png" style="width:30%;" /></a></div>
    <h1 style="text-align: center;">전체 일본어 단어 테스트</h1>
  </div>	
  

<script>

    const words = [
        <% for (WordTO to : japanList) { %>
            { wId: '<%= to.getWId() %>', word: '<%= to.getWname() %>', meaning: '<%= to.getWmean() %>', type: '<%= to.getWtype() %>' },
        <% } %>
    ];

    function shuffleArray(array) {
        for (let i = array.length - 1; i > 0; i--) {
            const j = Math.floor(Math.random() * (i + 1));
            [array[i], array[j]] = [array[j], array[i]];
        }
    }

    function generateWordBoxes() {
        shuffleArray(words);
        
        // 새로운 form 요소 생성
        const formElement = document.createElement('form');
        formElement.action = 'testResult.do';
        formElement.method = 'post';
        formElement.id = 'tfrm';

        const numberOfWordsInRow = 4;
        const numberOfWordsToDisplay = words.length;

        for (let i = 0; i < numberOfWordsToDisplay; i++) {
        	
            const wordBox = document.createElement('div');
            wordBox.className = 'word-box';

            const isWordEmpty = Math.random() < 0.5;

            if (isWordEmpty) {
            	
                const typeDiv = document.createElement('div');
                typeDiv.className = 'type-div';
                typeDiv.textContent = words[i].type;
                wordBox.appendChild(typeDiv);
                
                const wordDiv = document.createElement('div');
                wordDiv.textContent = words[i].word;
                wordBox.appendChild(wordDiv);
                
                const inputElement = document.createElement('input');
                inputElement.className = 'answer-input';
                inputElement.placeholder = '뜻';
                inputElement.name = 'test';
                wordBox.appendChild(inputElement);            
                
                const hiddenWord = document.createElement('input');
                hiddenWord.type = 'hidden';
                hiddenWord.name = 'original'; 
                hiddenWord.value = words[i].word;
                wordBox.appendChild(hiddenWord);
                
                const hiddenType = document.createElement('input');
                hiddenType.type = 'hidden';
                hiddenType.name = 'type'; 
                hiddenType.value = words[i].type;
                wordBox.appendChild(hiddenType);
                
                const hiddenInputElement = document.createElement('input');
                hiddenInputElement.type = 'hidden';
                hiddenInputElement.name = 'wId'; 
                hiddenInputElement.value = words[i].wId;
                wordBox.appendChild(hiddenInputElement);
                
                const hiddenCategory = document.createElement('input');
                hiddenCategory.type = 'hidden';
                hiddenCategory.name = 'category'; 
                hiddenCategory.value = 'Japanese';
                wordBox.appendChild(hiddenCategory);

            } else {
                const typeDiv = document.createElement('div');
                typeDiv.textContent = words[i].type;
                wordBox.appendChild(typeDiv);
                 
                
                const inputElement = document.createElement('input');
                inputElement.className = 'answer-input';
                inputElement.placeholder = '단어';
                inputElement.name = 'test';          
                wordBox.appendChild(inputElement);
                
                const hiddenInputElement = document.createElement('input');
                hiddenInputElement.type = 'hidden';
                hiddenInputElement.name = 'wId'; 
                hiddenInputElement.value = words[i].wId;
                wordBox.appendChild(hiddenInputElement);

                const hiddenMean = document.createElement('input');
                hiddenMean.type = 'hidden';
                hiddenMean.name = 'original'; 
                hiddenMean.value = words[i].meaning;
                wordBox.appendChild(hiddenMean);
                
                const hiddenType = document.createElement('input');
                hiddenType.type = 'hidden';
                hiddenType.name = 'type'; 
                hiddenType.value = words[i].type;
                wordBox.appendChild(hiddenType);
                
                const hiddenCategory = document.createElement('input');
                hiddenCategory.type = 'hidden';
                hiddenCategory.name = 'category'; 
                hiddenCategory.value = 'Japanese';
                wordBox.appendChild(hiddenCategory);
                
                const meaningDiv = document.createElement('div');
                meaningDiv.textContent = words[i].meaning;
                wordBox.appendChild(meaningDiv);
            }        

            formElement.appendChild(wordBox);
            
        	 // 마지막 wordBox 이후에 줄바꿈 요소 추가
            if ((i + 1) % numberOfWordsInRow === 0 && i !== numberOfWordsToDisplay - 1) {
                formElement.appendChild(document.createElement('br'));
            }
        }
        

        formElement.appendChild(document.createElement('br'));
        formElement.appendChild(document.createElement('br'));

        
        const submitButton = document.createElement('button');
        submitButton.type = 'button';
        submitButton.className = 'btn';
        submitButton.id = 'sbtn';
        submitButton.textContent = '제출하기';
        
        const buttonContainer = document.createElement('div');
        buttonContainer.appendChild(submitButton);
        
        submitButton.addEventListener('click', function () {
        	if (validateForm()) {
                document.getElementById('tfrm').submit();
            }
        });

        formElement.appendChild(buttonContainer);
        
        
     	// 문서에 form 추가
        document.body.appendChild(formElement);
    }


    window.onload = generateWordBoxes;
    
    function validateForm() {
        const inputElements = document.querySelectorAll('.answer-input');
        let isValid = true;

        inputElements.forEach((inputElement) => {
            const isKorean = inputElement.placeholder === '뜻';
            const inputValue = inputElement.value.trim();

            // placeholder에 따라 조건을 나눔, placeholder가 뜻이면서 한글 정규식을 지키지 않았을때 / 단어면서 영어 정규식 지키지 않았을 때 false 반환 
            if ((isKorean && inputValue !== '' && !/^[가-힣ㄱ-ㅎㅏ-ㅣ\s]+$/.test(inputValue)) ||
                (!isKorean && inputValue !== '' && !/[\u3000-\u303F\u3040-\u309F\u30A0-\u30FF\u4E00-\u9FFF]+/.test(inputValue))) {
                isValid = false;
            }
        });

        if (!isValid) {
            alert('단어에는 일본어만, 뜻에는 한글만 입력해야합니다!!');
        }

        return isValid;
    }
    
</script>


</body>
</html>