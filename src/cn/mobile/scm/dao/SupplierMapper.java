package cn.mobile.scm.dao;


import java.util.List;
import java.util.Map;

import cn.mobile.scm.entity.Supplier;

public interface SupplierMapper extends BaseMapper<Supplier>{
   
	//public int insertSupplier(Supplier supplier) throws Exception;
	List<Map<String, Object>> selectSupplier(Map<String, String> paramMap);
}