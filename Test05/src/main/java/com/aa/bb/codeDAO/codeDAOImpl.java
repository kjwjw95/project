package com.aa.bb.codeDAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aa.bb.domain.CodemngVO;
import com.aa.bb.domain.InItemVO;
import com.aa.bb.domain.ItemVO;
import com.aa.bb.domain.OutItemVO;

@Repository
public class codeDAOImpl implements codeDAO{

	@Autowired
	SqlSessionTemplate session;

	@Override
	public List<CodemngVO> listAll() throws Exception {
		return session.selectList("codemng.codelist");
	}

	@Override
	public void CodeUpdate(CodemngVO codemngvo) throws Exception {
		session.update("codemng.codeupdate", codemngvo);
		
	}

	@Override
	public void CodeInsert(CodemngVO codemngvo) throws Exception {
		session.insert("codemng.codeinsert", codemngvo);
		
	}

	@Override
	public List<ItemVO> ItemList(String itemclscd) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("cdno", itemclscd);
		return session.selectList("codemng.itemlist",map);
	}

	@Override
	public List<CodemngVO> categori() throws Exception {
		return session.selectList("codemng.categori");
	}

	@Override
	public List<CodemngVO> Classfication(String cdno) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("cdno", cdno);
		return session.selectList("codemng.classfication", map);
	}

	@Override
	public List<CodemngVO> Madename() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("codemng.madename");
	}

	@Override
	public List<CodemngVO> Unitname() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("codemng.unitname");
	}

	@Override
	public void UpdateItem(Map<String, String> map) throws Exception {
		session.update("codemng.itemupdate", map);
		
	}

	@Override
	public void InsertItem(Map<String, String> map) throws Exception {
		System.out.println(">>>>><<<<<");
		session.insert("codemng.iteminsert", map);
	}

	@Override
	public List<InItemVO> InItemList(String itemcd) throws Exception {
		return session.selectList("codemng.initemlist", itemcd);
		
	}

	@Override
	public void InsertInItem(Map<String, String> map) throws Exception {
		session.update("codemng.initemupdate3", map);
		session.insert("codemng.initeminsert", map);
		
	}

	@Override
	public void UpdateInItem(Map<String, String> map) throws Exception {
		session.update("codemng.initemupdate2", map);
		session.update("codemng.initemupdate1", map);
		
	}

	@Override
	public List<OutItemVO> OutItemList() {
		// TODO Auto-generated method stub
		return session.selectList("codemng.outitemlist");
	}

	@Override
	public void UpdateOutitem(Map<String, String> map) throws InterruptedException {
		session.update("codemng.outitemupdate", map);
		
//		Thread.sleep(2000);
		
		String a=map.get("delivyn");
		System.out.println(">>>>>>>>>>>>>>>>"+a);
		if(a.equals("Y")) {
			session.update("codemng.stockupdate", map);
			System.out.println(">>>>>>>>>>>>>>>><<<<<<<<<<<<<<"+a);
		}
			
	}

	@Override
	public List<CodemngVO> DeliveList() {
		// TODO Auto-generated method stub
		return session.selectList("codemng.delivlist");
	}
	
}