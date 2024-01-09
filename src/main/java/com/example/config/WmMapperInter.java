package com.example.config;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.model.WordTO;

public interface WmMapperInter {
	// 단어 전체 리스트
	@Select("select wId, category, wname, wmean, wtype from word order by wId")
	public ArrayList<WordTO> wordList();
	
	// 수정 모달창 전체 리스트
	@Select("select wId, category, wname, wmean, wtype from word order by wId where wId=#{wId}")
	public ArrayList<WordTO> ModifywordList(String wId);
	
	// 단어 추가하기
	@Insert("insert into word values (0, #{category}, #{wname}, #{wmean}, #{wtype})")
	public int wordWrite(WordTO to);
	
	//단어 수정하기
	@Update("update word set wname=#{wname}, wmean=#{wmean}, wtype=#{wtype}  where wId=#{wId}")
	public int wordModify(WordTO to);
	
	//단어 삭제하기
	@Delete("delete from word where wId=#{wId}")
	public int wordDelete(WordTO to);
	
	//전체 삭제하기 : 삭제한 컬럼의 개수만큼 int로 반환
	@Delete("delete from word where category=#{category}")
	public int allDelete(String category);
	
	// 시험에서 내가 쓴 단어와 같은지 비교하는 코드
	@Select("select wname from word where wId=#{wId}")
	public ArrayList<String> equalWord(String wId);
	
	// 시험에서 내가 쓴 뜻과 같은지 비교하는 코드
	@Select("select wmean from word where wId=#{wId}")
	public ArrayList<String> equalMean(String wId);
}
