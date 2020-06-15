package com.aa.bb.userservice;

import java.util.List;
import java.util.Map;

import com.aa.bb.domain.CodemngVO;
import com.aa.bb.domain.InItemVO;
import com.aa.bb.domain.ItemVO;
import com.aa.bb.domain.OutItemVO;
import com.aa.bb.domain.UserDetailVO;
import com.aa.bb.domain.UserVO;

public interface userservice{
	
	boolean Login(String id, String password);
	void Create(UserVO uservo) throws Exception;
	void CreateDetail(UserDetailVO uservo) throws Exception;
	
	
	
	List<CodemngVO> ListAll() throws Exception;
	List<CodemngVO> Categori() throws Exception;
	List<CodemngVO> Madename()throws Exception;
	List<CodemngVO> Unitname()throws Exception;
	void UpdateCode(CodemngVO codemngvo) throws Exception;
	void InsertCode(CodemngVO codemngvo) throws Exception;
	List<ItemVO> ItemList(String itemclscd) throws Exception;
	List<CodemngVO> Classfication(String cdno) throws Exception;
	void UpdateItem(Map<String, String> map) throws Exception;
	void InsertItem(Map<String, String> map) throws Exception;
	List<InItemVO> InItemList(String itemcd) throws Exception;
	void InsertInItem(Map<String, String> map) throws Exception;
	void UpdateInItem(Map<String, String> map) throws Exception;
	List<OutItemVO> Outitemlist();
	void UpdateOutItem(Map<String, String> map) throws InterruptedException;
	List<CodemngVO> DeliveList();
	

}