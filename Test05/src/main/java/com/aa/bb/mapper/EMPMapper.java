package com.aa.bb.mapper;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import com.aa.bb.domain.BoardVO;

public interface EMPMapper{
	
	List<BoardVO> empList(SqlSessionTemplate session);
	List<BoardVO> ListSearch(String searchOption, String keyword) throws Exception;
}