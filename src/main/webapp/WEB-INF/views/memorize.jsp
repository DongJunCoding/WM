<%@page import="com.example.model.WordTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>WM Total English Test</title>
<style>

      @font-face {
             font-family: 'GangwonEdu_OTFBoldA';
             src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
             font-weight: normal;
             font-style: normal;
         }
      
      input   {
          font-family: 'GangwonEdu_OTFBoldA';
      
      }
      
      div   {
         font-family: 'GangwonEdu_OTFBoldA';
      
      }   
         
      body {
    font-family: 'GangwonEdu_OTFBoldA';
    background-color: #f4f4f4;
    padding: 0;
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background-color: transparent;
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
          height: 80px;
          background-color: #fff;
          border: 1px solid #ddd;
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
       }
       

      button {
          width: 200px; /* 버튼 너비 조정 */
          height: 40px; /* 버튼 높이 조정 */
          font-size: 16px; /* 폰트 크기 조정 */
          display: block;
          margin: 0 auto;
      }
      
      
    </style>
    
</head>
<body>
 
    <div id="header-container">
    <div id="logo-container"><a href="wm.do"><img src="../images/WMLogo.png" style="width:100%;" /></a></div>
    <h1 style="text-align: center;">전체 영어 단어 테스트</h1>
  </div>

<script>

    const words = [
  
            { word: '123', meaning: '444' },
            { word: '123', meaning: '444' },
            { word: '123', meaning: '444' },
            { word: '123', meaning: '444' },
            { word: '123', meaning: '444' },
            { word: '123', meaning: '444' },
            { word: '123', meaning: '444' },
            { word: '123', meaning: '444' },
            { word: '123', meaning: '444' },
            { word: '123', meaning: '444' },
            { word: '123', meaning: '444' },
            { word: '123', meaning: '444' },
            { word: '123', meaning: '444' },
            { word: '123', meaning: '444' },
            { word: '123', meaning: '444' },
            { word: '123', meaning: '444' },
            { word: '123', meaning: '444' },
            { word: '123', meaning: '444' },
            { word: '123', meaning: '444' },
            { word: '123', meaning: '444' },
            { word: '123', meaning: '444' },
            { word: '123', meaning: '444' },

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
        formElement.action = 'totalTestResult.do';
        formElement.method = 'post';
        formElement.id = 'tfrm';

        const numberOfWordsInRow = 3;
        const numberOfWordsToDisplay = words.length;

        for (let i = 0; i < numberOfWordsToDisplay; i++) {
           
            const wordBox = document.createElement('div');
            wordBox.className = 'word-box';

            const isWordEmpty = Math.random() < 0.5;

            if (isWordEmpty) {
                const wordDiv = document.createElement('div');
                wordDiv.textContent = words[i].word;
                wordBox.appendChild(wordDiv);

                const inputElement = document.createElement('input');
                inputElement.className = 'answer-input';
                inputElement.placeholder = '뜻';
                inputElement.name = 'mean';
                wordBox.appendChild(inputElement);
            } else {
                const inputElement = document.createElement('input');
                inputElement.className = 'answer-input';
                inputElement.placeholder = '단어';
                inputElement.name = 'word';
                wordBox.appendChild(inputElement);

                const meaningDiv = document.createElement('div');
                meaningDiv.textContent = words[i].meaning;
                wordBox.appendChild(meaningDiv);
            }        

            formElement.appendChild(wordBox);
            
            if ((i + 1) % numberOfWordsInRow === 0 && i !== numberOfWordsToDisplay - 1) {
                formElement.appendChild(document.createElement('br'));
            }
        }
        

        const submitButton = document.createElement('button');
        submitButton.type = 'button'; // 기본 동작을 방지하기 위해 버튼의 타입을 'button'으로 변경
        submitButton.textContent = '제출하기';
        submitButton.addEventListener('click', function () {
            // 폼을 JavaScript로 제출
           formElement.submit();        
        });

        formElement.appendChild(submitButton);
        
        
        // 문서에 form 추가
        document.body.appendChild(formElement);
    }

    window.onload = generateWordBoxes;
    
</script>

<br>

   <div id="bg"></div>      


</body>
</html>