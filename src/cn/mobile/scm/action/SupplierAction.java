package cn.mobile.scm.action;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.mobile.scm.entity.Page;
import cn.mobile.scm.entity.Supplier;
import cn.mobile.scm.service.SupplierService;


@Controller
@RequestMapping(value="/supplier")
public class SupplierAction extends BaseAction{

	@Resource
	private SupplierService supplierService;
	
	@RequestMapping(value="/insert")
	@ResponseBody 	//如果返回json格式，需要这个注解
	public Object insert(Supplier supplier) {
		
		System.out.println("开始插入" );
		int i =0;
		try {
			i = supplierService.insert(supplier);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return i;
	}
	
	//根据主键更改供应商的信息
	@RequestMapping(value="/update")
	@ResponseBody 	//如果返回json格式，需要这个注解
	public Object update(Supplier supplier) {
		
		System.out.println("开始插入" );
		int i =0;
		try {
			i = supplierService.update(supplier);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return i;
	}
	
	@RequestMapping("/deleteList")
	@ResponseBody //如果返回json格式，需要这个注解，这里用来测试环境
	public Object deleteList(String[] pks){
		System.out.println("---deleteList.pks:" + pks);
		int i = 0;
		try {
			
			i = supplierService.deleteList(pks);
			return i;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return i;
	}

	
		
	@RequestMapping("/selectPage")
	@ResponseBody //如果返回json格式，需要这个注解，这里用来测试环境
	public Object selectPage(Page<Supplier> page){
		
		
		Page p = supplierService.selectPage(page);
		System.out.println("----page:"+page);
//		//supplier.setSupName("supName1");
//		Map<String, Object> map =new HashMap<String, Object>();
//		map.put("total",page.getTotalRecord());
//		map.put("rows",page.getList());
		return page.getPageMap();
	}
	
	
	
	
	
	@RequestMapping("/selectPageUseDyc")
	@ResponseBody //如果返回json格式，需要这个注解，这里用来测试环境
	public Object selectPageDyc(Page<Supplier> page,Supplier supplier){
		page.setParamEntity(supplier);
		System.out.println("开始查询了");

		Page p = supplierService.selectPageUseDyc(page);
		System.out.println("----page:"+page);
//		//supplier.setSupName("supName1");
//		Map<String, Object> map =new HashMap<String, Object>();
		//map.put("total",page.getTotalRecord());
		//map.put("rows",page.getList());
		return p.getPageMap();
	}
	
	@RequestMapping("/doAjax")
	@ResponseBody //如果返回json格式，需要这个注解，这里用来测试环境
	public Object doAjax(Supplier supplier){
		System.out.println("---doAjax.supplier:"+supplier);
		supplier.setSupName("supName1");
		return supplier;
	}
	

	@RequestMapping("/selectsupplier")
	@ResponseBody
	public Object selectSupplier(String start,String end){
		System.out.println("start:"+ start+"||end:"+end);
		Map<String, String> paramMap =new HashMap<String, String>();
		paramMap.put("start", start);
		paramMap.put("end", end);

		return supplierService.selectSupplier(paramMap);
	}

}
