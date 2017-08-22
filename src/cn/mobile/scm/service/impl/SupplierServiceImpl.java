package cn.mobile.scm.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mobile.scm.dao.SupplierMapper;
import cn.mobile.scm.entity.Page;
import cn.mobile.scm.entity.Supplier;
import cn.mobile.scm.service.SupplierService;


@Service("supplierService")
public class SupplierServiceImpl extends BaseServiceImpl<Supplier> implements SupplierService{

	/*@Autowired
	private SupplierMapper supplierMapper;


	public int insert(Supplier supplier) throws Exception {
		// TODO Auto-generated method stub
		return supplierMapper.insert(supplier);
	}

	public int update(Supplier entity) throws Exception {
		// TODO Auto-generated method stub
		return supplierMapper.insert(entity);
	}

	public int delete(Supplier entity) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	public Supplier select(Supplier entity) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public Page<Supplier> selectPage(Page<Supplier> page) {
		// TODO Auto-generated method stub
		page.setList(supplierMapper.selectPageList(page));
		page.setTotalRecord(supplierMapper.selectPageCount(page));
		
		return page;
	}

	public Page<Supplier> selectPageUseDyc(Page<Supplier> page) {
		// TODO Auto-generated method stub
		page.setList(supplierMapper.selectPageListUseDyc(page));
		page.setTotalRecord(supplierMapper.selectPageCountUseDyc(page));
		
		return page;
	}

	public int deleteList(String[] pks) throws Exception {
		// TODO Auto-generated method stub
		return supplierMapper.deleteList(pks);
	}*/

	public List<Map<String, Object>> selectSupplier(Map<String, String> paramMap) {
		// TODO Auto-generated method stub
		return supplierMapper.selectSupplier(paramMap);
	}

}
