package com.aa.bb.userservice;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aa.bb.codeDAO.codeDAO;
import com.aa.bb.domain.CodemngVO;
import com.aa.bb.domain.InItemVO;
import com.aa.bb.domain.ItemVO;
import com.aa.bb.domain.OutItemVO;
import com.aa.bb.domain.UserDetailVO;
import com.aa.bb.domain.UserVO;
import com.aa.bb.userDAO.userDAO;

@Service
public class userserviceImpl implements userservice{
	@Autowired
	private userDAO userDAO;
	
	@Autowired
	private codeDAO codedao;
	
	@Autowired
	SqlSessionTemplate session;

	@Override
	public boolean Login(String id, String password) {
		
		return userDAO.Login(id, password);
	}

	@Override
	public void Create(UserVO uservo) throws Exception {
		userDAO.Create(uservo);
		
	}

	@Override
	public void CreateDetail(UserDetailVO uservo) throws Exception {
		userDAO.CreateDetail(uservo);
		
	}

	@Override
	public List<CodemngVO> ListAll() throws Exception {
		return codedao.listAll();
		
	}

	@Override
	public void UpdateCode(CodemngVO codemngvo) throws Exception {
		codedao.CodeUpdate(codemngvo);
		
	}

	@Override
	public void InsertCode(CodemngVO codemngvo) throws Exception {
		codedao.CodeInsert(codemngvo);
		
	}

	@Override
	public List<ItemVO> ItemList(String itemclscd) throws Exception {
		
		return codedao.ItemList(itemclscd);
	}

	@Override
	public List<CodemngVO> Categori() throws Exception {
		// TODO Auto-generated method stub
		return codedao.categori();
	}

	@Override
	public List<CodemngVO> Classfication(String cdno) throws Exception {
		// TODO Auto-generated method stub
		return codedao.Classfication(cdno);
	}

	@Override
	public List<CodemngVO> Madename() throws Exception {
		// TODO Auto-generated method stub
		return codedao.Madename();
	}

	@Override
	public List<CodemngVO> Unitname() throws Exception {
		// TODO Auto-generated method stub
		return codedao.Unitname();
	}

	@Override
	public void UpdateItem(Map<String, String> map) throws Exception {
		codedao.UpdateItem(map);
		
	}

	@Override
	public void InsertItem(Map<String, String> map) throws Exception {
		codedao.InsertItem(map);
		
	}

	@Override
	public List<InItemVO> InItemList(String itemcd) throws Exception {
		return codedao.InItemList(itemcd);
	}

	@Override
	public void InsertInItem(Map<String, String> map) throws Exception {
		codedao.InsertInItem(map);
		
	}

	@Override
	public void UpdateInItem(Map<String, String> map) throws Exception {
		codedao.UpdateInItem(map);
		
	}

	@Override
	public List<OutItemVO> Outitemlist() {
		
		return codedao.OutItemList();
	}

	@Override
	public void UpdateOutItem(Map<String, String> map) throws InterruptedException {
		codedao.UpdateOutitem(map);
		
	}

	@Override
	public List<CodemngVO> DeliveList() {
		// TODO Auto-generated method stub
		return codedao.DeliveList();
	}
	
	

}