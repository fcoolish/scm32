package cn.mobile.scm.dao;

import java.util.List;

import cn.mobile.scm.entity.Page;

public interface BaseMapper<T>{

	
	//添加单个对象
	public int insert(T entity);
	
	//修改单个对象
	public int update(T entity);
	
	//删除
	public int delete (T entity);
	
	//通过主键(数组)批量删除数据
	public int deleteList(String pks[])throws Exception;
	
	//查询单个对象
	public T select(T entity);
	
	//通过关键字分页查询
	public List<T>selectPageList(Page<T> page);
	
	
	//通过关键字分页查询返回记录数
	public Integer selectPageCount(Page<T> page);
	
	//通过多条件关键字分页查询
	public List<T>selectPageListUseDyc(Page<T> page);
		
		
	//通过多条件关键字分页查询返回记录数
	public Integer selectPageCountUseDyc(Page<T> page);
	
	
}
