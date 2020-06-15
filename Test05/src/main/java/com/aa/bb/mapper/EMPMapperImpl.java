package com.aa.bb.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.aa.bb.domain.BoardVO;

@Repository
public class EMPMapperImpl implements EMPMapper{
	@Inject
	SqlSession session;
	@Override
	public List<BoardVO> empList(SqlSessionTemplate sessions) {
		return sessions.selectList("emp.selectEmpList");
	}

	@Override
	public List<BoardVO> ListSearch(String searchOption, String keyword) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword",keyword);
		return session.selectList("emp.search",map);
	}
}