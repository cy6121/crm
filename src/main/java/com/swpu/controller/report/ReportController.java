package com.swpu.controller.report;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Maps;
import com.swpu.entity.Customer;
import com.swpu.service.CustomerService;
import com.swpu.service.ReportService;

/** 
* @author  cy
* @createDate 2017年4月4日 下午8:54:19 
* @version 1.0 
* @describe  
*/

@Controller
@RequestMapping("/report")
public class ReportController {
	
	@Autowired
	private ReportService reportService;
	
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping(value = "consist", method = RequestMethod.GET)
	public String consist() {
		return "report/consist";
	}
	
	@RequestMapping(value = "consist/datas.json", method = RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> consistData(HttpServletRequest request) {
		//绘制计数器，ajax为异步请求。
		String draw = request.getParameter("draw");
		String type = request.getParameter("type");
		Map<String,Object> param = Maps.newHashMap();
		param.put("type",type);
		List<Map<String,Object>> datas = reportService.selectConsistByType(param);
		
		Map<String,Object> map = Maps.newHashMap();
		map.put("data",datas);
		map.put("draw",draw);
		return map;
	}
	
	@RequestMapping(value = "drain", method = RequestMethod.GET)
	public String contactList() {
		
		return "report/drain";
	}
	
	@RequestMapping(value = "pay", method = RequestMethod.GET)
	public String pay() {
		
		return "report/pay";
	}
	
	@RequestMapping(value = "pay/datas.json", method = RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> payData(HttpServletRequest request) {
		//绘制计数器，ajax为异步请求。
		String draw = request.getParameter("draw");
		//当前所在页，第一页为0
        Integer currentPage = Integer.valueOf(request.getParameter("start"));
        //页面最大显示记录数
        Integer pageNum = Integer.valueOf(request.getParameter("length"));
		String cust_name = request.getParameter("cust_name");
		String date1 = request.getParameter("date_1");
		String date2 = request.getParameter("date_2");
		if (!StringUtils.isEmpty(date2)) {
			date2 = DateTime.parse(date2).plusDays(1).toString("yyyy-MM-dd");
		}
		Map<String,Object> param = Maps.newHashMap();
		
		if (!StringUtils.isEmpty(cust_name)) {
			Customer customer = customerService.selectCustomerByName(cust_name);
			if (customer!=null) {
				param.put("cust_id",customer.getCust_id());
			}else{
				param.put("cust_id"," ");
			}
		}
		
		param.put("date1",date1);
		param.put("date2",date2);
		param.put("currentPage",currentPage);
		param.put("pageNum",pageNum);
		
		List<Map<String,Object>> datas = reportService.selectPayByParam(param);
		Integer count = reportService.selectPayCount();
		Integer recordsFiltered = reportService.selectPayCountByParam(param);
		
		Map<String,Object> map = Maps.newHashMap();
		map.put("data",datas);
		map.put("draw",draw);
		map.put("recordsTotal",count);//总记录数
		map.put("recordsFiltered",recordsFiltered);
		return map;
	}
	
	@RequestMapping(value = "service", method = RequestMethod.GET)
	public String service() {
		return "report/service";
	}
	
	@RequestMapping(value = "service/datas.json", method = RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> serviceData(HttpServletRequest request) {
		//绘制计数器，ajax为异步请求。
		String draw = request.getParameter("draw");
		String date1 = request.getParameter("date_1");
		String date2 = request.getParameter("date_2");
		if (!StringUtils.isEmpty(date2)) {
			date2 = DateTime.parse(date2).plusDays(1).toString("yyyy-MM-dd");
		}
		Map<String,Object> param = Maps.newHashMap();
		
		param.put("date1",date1);
		param.put("date2",date2);
		
		List<Map<String,Object>> datas = reportService.selectServiceByParam(param);
		
		Map<String,Object> map = Maps.newHashMap();
		map.put("data",datas);
		map.put("draw",draw);
		return map;
	}
}
