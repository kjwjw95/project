package com.aa.bb.userDAO;

import com.aa.bb.domain.UserDetailVO;
import com.aa.bb.domain.UserVO;

public interface userDAO{
	void Create(UserVO uservo)	throws Exception;
	void CreateDetail(UserDetailVO userDetailvo) throws Exception;
	boolean Login(String id, String password);
}