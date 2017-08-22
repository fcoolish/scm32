package cn.mobile.scm.service;

import java.util.Map;

import cn.mobile.scm.entity.SysParam;

public interface SysParamService extends BaseService<SysParam> {
    public Map<String,Object>selectList();
	 
}
