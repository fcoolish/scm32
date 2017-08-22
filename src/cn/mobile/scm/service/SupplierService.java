package cn.mobile.scm.service;

import java.util.List;
import java.util.Map;

import cn.mobile.scm.entity.Page;
import cn.mobile.scm.entity.Supplier;

public interface SupplierService extends BaseService<Supplier>{

	List<Map<String, Object>> selectSupplier(Map<String,String> paramMap);

	
}
