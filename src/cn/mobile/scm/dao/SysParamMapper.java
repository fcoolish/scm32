package cn.mobile.scm.dao;

import cn.mobile.scm.entity.SysParam;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SysParamMapper extends BaseMapper<SysParam> {
	public List<SysParam> selectList(String type);
	public List<SysParam> selectOthreTable(String sql);
   
}