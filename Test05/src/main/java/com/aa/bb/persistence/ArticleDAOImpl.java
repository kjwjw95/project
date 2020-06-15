package com.aa.bb.persistence;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.aa.bb.domain.BoardVO;


@Repository
public class ArticleDAOImpl implements ArticleDAO{
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public void Create(BoardVO boardvo)	throws Exception{
		session.insert("emp.create",boardvo);
	}
	@Override
	public void Delete(String empno) throws Exception{
		session.delete("emp.delete",empno);
	}
	@Override
	public int Count(String searchOption, String keyword) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword",keyword);
		return session.selectOne("emp.count",map);
	}
}