package com.swpu.controller.customer;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Maps;
import com.swpu.entity.CstService;
import com.swpu.entity.Customer;
import com.swpu.entity.Dict;
import com.swpu.entity.User;
import com.swpu.service.CustService;
import com.swpu.service.CustomerService;
import com.swpu.service.DictService;
import com.swpu.service.UserService;

/** 
* @author  cy
* @createDate 2017年4月4日 下午8:54:19 
* @version 1.0 
* @describe  服务管理
*/

@Controller
@RequestMapping("/service")
public class ServiceController {
	
	@Autowired
	private DictService dictService;
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private CustService custService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String create(Model model) {
		List<Dict> serviceTypes = dictService.findDictByType("服务类型");
		List<Map<String,Object>> customers = customerService.selectCustomer();
		model.addAttribute("serviceTypes",serviceTypes);
		model.addAttribute("customers",customers);
		return "service/create";
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	@ResponseBody
	public String createService(HttpServletRequest request) {
		String cust_id = request.getParameter("cust_id");
		String type = request.getParameter("type");
		String title = request.getParameter("title");
		String create_id = request.getParameter("create_id");
		String Request = request.getParameter("request");
		
		Map<String,Object> param = Maps.newHashMap();
		param.put("cust_id",cust_id);
		param.put("type",type);
		param.put("title",title);
		param.put("create_id",create_id);
		param.put("request",Request);
		
		custService.insertService(param);
		return "success";
	}
	
	@RequestMapping(value = "/del", method = RequestMethod.POST)
	@ResponseBody
	public String del(Integer svr_id) {
		custService.deleteService(svr_id);
		return "success";
	}
	
	@RequestMapping(value = "/allot", method = RequestMethod.GET)
	public String allot(Model model) {
		List<Dict> serviceTypes = dictService.findDictByType("服务类型");
		List<User> users = userService.getUserByUserRole("客户经理");
		model.addAttribute("serviceTypes",serviceTypes);
		model.addAttribute("users",users);
		return "service/allot";
	}
	
	@RequestMapping(value = "/allot/dispatch", method = RequestMethod.POST)
	@ResponseBody
	public String dispatch(Integer svr_id,Integer allot_id) {
		Map<String,Object> param = Maps.newHashMap();
		param.put("svr_id",svr_id);
		param.put("allot_id",allot_id);
		custService.dispatch(param);
		return "success";
	}
	
	@RequestMapping(value = "/deal", method = RequestMethod.GET)
	public String dealList(Model model) {
		List<Dict> serviceTypes = dictService.findDictByType("服务类型");
		List<User> users = userService.getUserByUserRole("客户经理");
		model.addAttribute("serviceTypes",serviceTypes);
		model.addAttribute("users",users);
		return "service/deal/list";
	}
	
	@RequestMapping(value = "/deal/deal", method = RequestMethod.POST)
	@ResponseBody
	public String dealInfo(Integer svr_id,String deal) {
		Map<String,Object> param = Maps.newHashMap();
		param.put("svr_id",svr_id);
		param.put("deal",deal);
		custService.deal(param);
		return "success";
	}
	
	@RequestMapping(value = "/feedback", method = RequestMethod.GET)
	public String feedback(Model model) {
		List<Dict> satisfys = dictService.findDictByType("客户满意度");
		model.addAttribute("satisfys",satisfys);
		return "service/feedback/list";
	}
	
	@RequestMapping(value = "/feedback/deal", method = RequestMethod.POST)
	@ResponseBody
	public String feedbackDeal(Integer svr_id,String result,String satisfy) {
		Map<String,Object> param = Maps.newHashMap();
		int length = satisfy.length();
		if (length>=3) {
			param.put("command","archive");
		}else {
			param.put("command","redeal");
		}
		param.put("svr_id",svr_id);
		param.put("result",result);
		param.put("satisfy",satisfy);
		custService.feedback(param);
		return "success";
	}
	
	@RequestMapping(value = "/archive", method = RequestMethod.GET)
	public String archive(Model model) {
		List<Dict> serviceTypes = dictService.findDictByType("服务类型");
		model.addAttribute("serviceTypes",serviceTypes);
		return "service/archive/list";
	}
	
	@RequestMapping(value = "/archive/{svr_id}", method = RequestMethod.GET)
	public String archiveInfo(@PathVariable("svr_id") String svr_id,Model model) {
		CstService cstService = custService.selectServiceById(Integer.valueOf(svr_id));
		model.addAttribute("cstService",cstService);
		return "service/archive/archive";
	}
	
	@RequestMapping(value = "datas.json",method = RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> dataList(HttpServletRequest request){
		//绘制计数器，ajax为异步请求。
		String draw = request.getParameter("draw");
		//当前所在页，第一页为0
        Integer currentPage = Integer.valueOf(request.getParameter("start"));
        //页面最大显示记录数
        Integer pageNum = Integer.valueOf(request.getParameter("length"));
        String cust_name = request.getParameter("cust_name");
        String title = request.getParameter("title");
        String type = request.getParameter("type");
        String state = request.getParameter("state");
        
        Map<String,Object> param = Maps.newHashMap();
        if (!StringUtils.isEmpty(cust_name)) {
        	Customer customer = customerService.selectCustomerByName(cust_name);
        	if (customer!=null) {
    			param.put("cust_id",customer.getCust_id());
    		}else{
    			param.put("cust_id"," ");
    		}
		}
    	
		param.put("currentPage",currentPage);
		param.put("pageNum",pageNum);
		param.put("title",title);
		param.put("type",type);
		param.put("state",state);
        
		Map<String,Object> map = Maps.newHashMap();
		List<CstService> datas = custService.selectServiceALL(param);
		Integer count = custService.findServiceCount();
		Integer recordsFiltered = custService.findServiceCountByParam(param);
		map.put("data",datas);
		map.put("draw",draw);
		map.put("recordsTotal",count);//总记录数
		map.put("recordsFiltered",recordsFiltered);
		return map;
	}
	
	@RequestMapping(value = "data.json",method = RequestMethod.GET)
	@ResponseBody
	public CstService dataOne(Integer svr_id){
		return custService.selectServiceById(svr_id);
	}
}
