package cn.mobile.scm.action;

import java.util.Arrays;

import javax.annotation.Resource;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.mobile.scm.entity.BuyOrder;
import cn.mobile.scm.entity.BuyOrderDetail;
import cn.mobile.scm.service.BuyOrderService;

@Controller
@RequestMapping("/buyOrder")
public class BuyOrderAction extends BaseAction {
	@Resource
	private BuyOrderService buyOrderService;
	
	@RequestMapping(value="/insert")
	@ResponseBody //如果返回json格式，需要这个注解，这里用来测试环境
	public Object insert(BuyOrder buyOrder, String rows){
		System.out.println("---action.buyOrder:"+buyOrder);
		System.out.println("---action.rows:"+rows);
		//提供json格式数据转java对象
		ObjectMapper  mapper = new ObjectMapper();
		
		
		int i = 0;
		try {
			BuyOrderDetail [] buyOrderDetails = mapper.readValue(rows, BuyOrderDetail[].class);
			buyOrder.setBuyOrderDetails(Arrays.asList(buyOrderDetails));
			i =buyOrderService.insertBuyOrder(buyOrder);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	
}
