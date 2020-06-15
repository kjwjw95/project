package com.aa.bb.empservice;

import java.util.List;
//import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aa.bb.domain.BoardVO;
import com.aa.bb.mapper.EMPMapper;
import com.aa.bb.persistence.ArticleDAO;

@Service
public class empserviceImpl implements empservice{
	@Autowired
	private ArticleDAO articleDAO;
	
	@Autowired
	private EMPMapper mapper;
	
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public List<BoardVO> empList() {
		return mapper.empList(session);
	}

	@Override
	public void Create(BoardVO boardVO) throws Exception {
		articleDAO.Create(boardVO);
		
	}

	@Override
	public void Delete(String empno) throws Exception {
		articleDAO.Delete(empno);
		
	}

	@Override
	public List<BoardVO> empListSearch(String searchOption, String keyword) throws Exception {
		
		return mapper.ListSearch(searchOption, keyword);
	}

	@Override
	public int Count(String searchOption, String keyword) throws Exception {
		return articleDAO.Count(searchOption, keyword);
	}
}