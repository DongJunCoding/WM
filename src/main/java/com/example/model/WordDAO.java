package com.example.model;

import java.util.ArrayList;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.config.WmMapperInter;

@Repository
@MapperScan(basePackages = { "com.example.controller", "com.example.config", "com.example.model" })
public class WordDAO {

	@Autowired
	private WmMapperInter mapper;

	// 전체 단어 리스트
	public ArrayList<WordTO> wordList() {

		ArrayList<WordTO> totalList = mapper.wordList();

		return totalList;
	};

	// 단어 리스트 추가
	public int wordWrite(WordTO to) {

		int result = mapper.wordWrite(to);

		int flag = 1;

		if (result == 1) {
			flag = 0;
		}

		return flag;
	};

	// 단어 리스트 수정
	public int wordModify(WordTO to) {

		int result = mapper.wordModify(to);

		int flag = 1;

		if (result == 1) {
			flag = 0;
		}

		return flag;
	};

	// 단어 리스트 삭제
	public int wordDelete(WordTO to) {

		int result = mapper.wordDelete(to);

		int flag = 1;

		if (result == 1) {
			flag = 0;
		}

		return flag;
	};

	// 단어 리스트 전체삭제
	public int allDelete(String category) {

		int result = mapper.allDelete(category);

		int flag = 1;

		if (result != 0) {
			flag = 0;
		}

		return flag;
	};
	
	
	//시험 단어 비교 메서드
	public ArrayList<String> equalWord(String wId) {
		
		ArrayList<String> word = mapper.equalWord(wId);
		
		return word;
	}
	
	//시험 뜻 비교 메서드
		public ArrayList<String> equalMean(String wId) {
			
		ArrayList<String> mean = mapper.equalMean(wId);
			
		return mean;
	}
}
