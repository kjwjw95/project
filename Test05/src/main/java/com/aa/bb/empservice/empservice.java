package com.aa.bb.empservice;

import java.util.List;
//import java.util.Map;

import com.aa.bb.domain.BoardVO;

public interface empservice{
//	public List<BoardVO> viewall();
	List<BoardVO> empList();
	void Create(BoardVO boardVO) throws Exception;
	void Delete(String empno) throws Exception;
	List<BoardVO> empListSearch(String searchOption, String keyword) throws Exception;
	int Count(String searchOption, String keyword) throws Exception;
}