package com.swpu.task;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.swpu.service.CustomerService;

/** 
* @author  cy
* @createDate 2017年4月24日 下午7:49:51 
* @version 1.0 
* @describe  每天凌晨0点检查客户是否超过6个月没有订单，如果有则添加客户流失预警
*/

@Component
public class CustomerTask {
	
	@Autowired 
	private CustomerService customerService;
	
	@Scheduled(cron = "0 0 0 * * ?")
	public void run(){
		customerService.CustomerLostWarning();
	}
}
