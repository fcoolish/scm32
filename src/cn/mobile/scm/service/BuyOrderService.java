package cn.mobile.scm.service;

import cn.mobile.scm.entity.BuyOrder;

public interface BuyOrderService extends BaseService<BuyOrder> {
	
	public int insertBuyOrder(BuyOrder buyOrder) throws Exception;
	 
}
