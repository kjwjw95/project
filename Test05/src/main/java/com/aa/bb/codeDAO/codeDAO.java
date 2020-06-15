package com.aa.bb.codeDAO;

import java.util.List;
import java.util.Map;
import com.aa.bb.domain.CodemngVO;
import com.aa.bb.domain.InItemVO;
import com.aa.bb.domain.ItemVO;
import com.aa.bb.domain.OutItemVO;


public interface codeDAO{
	List<CodemngVO> listAll() throws Exception;
	List<CodemngVO> categori() throws Exception;
	List<CodemngVO> Madename() throws Exception;
	List<CodemngVO> Unitname() throws Exception;
	void CodeUpdate(CodemngVO codemngvo) throws Exception;
	void CodeInsert(CodemngVO codemngvo) throws Exception;
	List<ItemVO> ItemList(String itemclscd) throws Exception;
	List<CodemngVO> Classfication(String cdno) throws Exception;
	void UpdateItem(Map<String, String> map) throws Exception;
	void InsertItem(Map<String, String> map) throws Exception;
	List<InItemVO> InItemList(String itemcd) throws Exception;
	void InsertInItem(Map<String, String> map) throws Exception;
	void UpdateInItem(Map<String, String> map) throws Exception;
	List<OutItemVO> OutItemList();
	void UpdateOutitem(Map<String, String> map) throws InterruptedException;
	List<CodemngVO> DeliveList();
	
}

