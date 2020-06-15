package com.aa.bb.persistence;

import com.aa.bb.domain.BoardVO;

public interface ArticleDAO{
	void Create(BoardVO boardvo)	throws Exception;
	void Delete(String empno) throws Exception;
	int Count(String searchOption, String keyword) throws Exception;
}