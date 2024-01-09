package com.example.controller;

import java.util.ArrayList;
import java.util.Collections;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.WordDAO;
import com.example.model.WordTO;

import jakarta.servlet.http.HttpServletRequest;

@RestController
public class TestController {

	@Autowired
	private WordDAO wdao;

	// 영어 테스트 선택 화면
	@RequestMapping("englishTestMain.do")
	public ModelAndView englishTestMain() {

		ArrayList<WordTO> totalList = wdao.wordList();
		ArrayList<WordTO> engList = new ArrayList<>();

		for (WordTO to : totalList) {
			if (to.getCategory().equals("English")) {

				engList.add(to);

			}
		}

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("englishTest/englishTestMain");
		modelAndView.addObject("engListSize", engList.size());
		return modelAndView;
	}

	// 일본어 테스트 선택 화면
	@RequestMapping("japanTestMain.do")
	public ModelAndView japanTestMain() {

		ArrayList<WordTO> totalList = wdao.wordList();
		ArrayList<WordTO> japanList = new ArrayList<>();

		for (WordTO to : totalList) {
			if (to.getCategory().equals("Japanese")) {

				japanList.add(to);

			}
		}

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("japanTest/japanTestMain");
		modelAndView.addObject("japanListSize", japanList.size());
		return modelAndView;
	}

	// 영어 테스트 선택 화면
	@RequestMapping("chinaTestMain.do")
	public ModelAndView chinaTestMain() {

		ArrayList<WordTO> totalList = wdao.wordList();
		ArrayList<WordTO> chinaTest = new ArrayList<>();

		for (WordTO to : totalList) {
			if (to.getCategory().equals("Chinese")) {

				chinaTest.add(to);

			}
		}

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("chinaTest/chinaTestMain");
		modelAndView.addObject("chinaTestSize", chinaTest.size());
		return modelAndView;
	}

	// 정해진 숫자만큼 영어 시험
	@RequestMapping("test.do")
	public ModelAndView test(HttpServletRequest request) {

		ModelAndView modelAndView = new ModelAndView();

		ArrayList<WordTO> totalList = wdao.wordList();
		ArrayList<WordTO> globalList = new ArrayList<>();

		String category = request.getParameter("category");

		String number = request.getParameter("numberText");

		for (WordTO to : totalList) {
			if (to.getCategory().equals("English") && category.equals("English")) {

				globalList.add(to);

				Collections.shuffle(globalList);

				modelAndView.setViewName("englishTest/test");
				modelAndView.addObject("number", number);
				modelAndView.addObject("engList", globalList);

			}

			else if (to.getCategory().equals("Japanese") && category.equals("Japanese")) {

				globalList.add(to);

				Collections.shuffle(globalList);

				modelAndView.setViewName("japanTest/test");
				modelAndView.addObject("number", number);
				modelAndView.addObject("globalList", globalList);

			}

			else if (to.getCategory().equals("Chinese") && category.equals("Chinese")) {

				globalList.add(to);

				Collections.shuffle(globalList);

				modelAndView.setViewName("chinaTest/test");
				modelAndView.addObject("number", number);
				modelAndView.addObject("chinaList", globalList);

			}
		}

		return modelAndView;
	}

	// 전체 영어 시험
	@RequestMapping("totalTest.do")
	public ModelAndView totalEnglishTest(HttpServletRequest request) {

		ModelAndView modelAndView = new ModelAndView();

		ArrayList<WordTO> totalList = wdao.wordList();
		ArrayList<WordTO> globalList = new ArrayList<>();

		String category = request.getParameter("category");

		for (WordTO to : totalList) {
			if (to.getCategory().equals("English") && category.equals("English")) {

				globalList.add(to);

				modelAndView.setViewName("englishTest/totalTest");
				modelAndView.addObject("engList", globalList);
			}

			else if (to.getCategory().equals("Japanese") && category.equals("Japanese")) {

				globalList.add(to);

				modelAndView.setViewName("japanTest/totalTest");
				modelAndView.addObject("japanList", globalList);

			}

			else if (to.getCategory().equals("Chinese") && category.equals("Chinese")) {

				globalList.add(to);

				modelAndView.setViewName("chinaTest/totalTest");
				modelAndView.addObject("chinaList", globalList);

			}
		}

		return modelAndView;
	}

	@RequestMapping("testResult.do")
	public ModelAndView totalTestResult(HttpServletRequest request) {

		ModelAndView modelAndView = new ModelAndView();

		// 시험 원본 파일 리스트 정보
		String original[] = request.getParameterValues("original");

		String type[] = request.getParameterValues("type");

		// 내가 쓴 답 리스트 정보
		String testArr[] = request.getParameterValues("test");

		String wId[] = request.getParameterValues("wId");

		String category = request.getParameter("category");

		ArrayList<String> testList = new ArrayList<String>();

		for (int i = 0; i < wId.length; i++) {

			// 영어 테스트 결과
			if (category.equals("English")) {

				// 배열 안에 mean(한글)값을 가져올 때
				if (testArr[i].matches("^[가-힣ㄱ-ㅎㅏ-ㅣ\\s]*$")) {

					testList.addAll(wdao.equalMean(wId[i]));

				}

				// 배열 안에 단어(영어)값을 가져올 때
				else if (testArr[i].matches("^[a-zA-Z\\s]*$")) {

					testList.addAll(wdao.equalWord(wId[i]));

				}

				modelAndView.setViewName("englishTest/testResult");
				modelAndView.addObject("testList", testList);
				modelAndView.addObject("original", original);
				modelAndView.addObject("type", type);
				modelAndView.addObject("wId", wId);
				modelAndView.addObject("testArr", testArr);

			}

			// 일본어 테스트 결과
			else if (category.equals("Japanese")) {

				// 배열 안에 mean(한글)값을 가져올 때
				if (testArr[i].matches("^[가-힣ㄱ-ㅎㅏ-ㅣ\\s]*$")) {

					testList.addAll(wdao.equalMean(wId[i]));

				}

				// 배열 안에 단어(일본어)값을 가져올 때
				else if (testArr[i].matches("[\\u3040-\\u309F\\u30A0-\\u30FF一-龯\\s]+")) {

					testList.addAll(wdao.equalWord(wId[i]));

				}

				modelAndView.setViewName("japanTest/testResult");
				modelAndView.addObject("testList", testList);
				modelAndView.addObject("original", original);
				modelAndView.addObject("type", type);
				modelAndView.addObject("wId", wId);
				modelAndView.addObject("testArr", testArr);

			}

			// 중국어 테스트 결과
			else if (category.equals("Chinese")) {
				
				String chineseWordRegex = "[\\u4E00-\\u9FFF\\s]+";
				
				// 배열 안에 mean(한글)값을 가져올 때
				if (testArr[i].matches("^[가-힣ㄱ-ㅎㅏ-ㅣ\\s]*$")) {

					testList.addAll(wdao.equalMean(wId[i]));

				}

				// 배열 안에 단어(중국어)값을 가져올 때
				else if (testArr[i].matches(chineseWordRegex)) {

					testList.addAll(wdao.equalWord(wId[i]));

				}

				modelAndView.setViewName("chinaTest/testResult");
				modelAndView.addObject("testList", testList);
				modelAndView.addObject("original", original);
				modelAndView.addObject("type", type);
				modelAndView.addObject("wId", wId);
				modelAndView.addObject("testArr", testArr);

			}
		}

		return modelAndView;
	}
}
