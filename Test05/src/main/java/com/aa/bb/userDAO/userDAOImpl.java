package com.aa.bb.userDAO;

import java.util.HashMap;
import java.util.Map;
import javax.inject.Inject;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.aa.bb.domain.UserDetailVO;
import com.aa.bb.domain.UserVO;


@Repository
public class userDAOImpl implements userDAO{
	@Inject
	SqlSessionTemplate session;
	
	//void Delete(String empno) throws Exception;
	@Override
	public boolean Login(String id, String password) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("password",password);
		
		int A = session.selectOne("user.login",map);
		
		if(A ==1) return true;
		else return false;

		
	
	}

	@Override
	public void Create(UserVO uservo) throws Exception {
		session.insert("user.create",uservo);
		
	}

	@Override
	public void CreateDetail(UserDetailVO userDetailvo) throws Exception {
		session.insert("user.createDetail", userDetailvo);
		
	}
}