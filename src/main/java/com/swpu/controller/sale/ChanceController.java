package com.swpu.controller.sale;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Maps;
import com.swpu.entity.Contact;
import com.swpu.entity.Customer;
import com.swpu.entity.SaleChance;
import com.swpu.entity.SalePlan;
import com.swpu.entity.User;
import com.swpu.service.CustomerService;
import com.swpu.service.SaleChanceService;
import com.swpu.service.SalePlanService;
import com.swpu.service.UserService;
import com.swpu.util.Const;

/** 
* @author  cy
* @createDate 2017年4月4日 下午8:54:19 
* @version 1.0 
* @describe  
*/

@Controller
@RequestMapping("/sale/chance")
public class ChanceController {
	
	@Autowired
	private SaleChanceService saleChanceService;
	
	@Autowired
	private SalePlanService salePlanService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String chance(Model model) {
		List<User> managerList = userService.getUserByUserRole("客户经理");
		model.addAttribute("managerList",managerList);
		return "sale/chance/list";
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
        String searchValue = request.getParameter("search[value]").trim();
		
        if (StringUtils.isNotEmpty(searchValue)) {
			searchValue = "%" + searchValue + "%";
		}
        
        Map<String,Object> param = Maps.newHashMap();
		param.put("searchValue",searchValue);
		param.put("currentPage",currentPage);
		param.put("pageNum",pageNum);
		param.put("type","chance");
        
		Map<String,Object> map = Maps.newHashMap();
		List<SaleChance> datas = saleChanceService.selectSaleChanceALL(param);
		Integer count = saleChanceService.findSaleChanceCount(param);
		Integer recordsFiltered = saleChanceService.findSaleChanceCountByParam(param);
		map.put("data",datas);
		map.put("draw",draw);
		map.put("recordsTotal",count);//总记录数
		map.put("recordsFiltered",recordsFiltered);
		return map;
	}
	
	@RequestMapping(value = "data.json",method = RequestMethod.GET)
	@ResponseBody
	public SaleChance dataOne(Integer sale_id){
		return saleChanceService.findSaleChanceById(sale_id);
	}
	
	@RequestMapping(value = "add",method = RequestMethod.POST)
	@ResponseBody
	public String add(SaleChance saleChance){
		Subject subject = SecurityUtils.getSubject();
		Session session = subject.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		saleChance.setCreate(user);//获取创建人信息
		saleChanceService.insertSaleChance(saleChance);
		return "success";
	}
	
	@RequestMapping(value = "edit",method = RequestMethod.POST)
	@ResponseBody
	public String edit(SaleChance SaleChance){
		saleChanceService.updateSaleChance(SaleChance);
		return "success";
	}
	
	@RequestMapping(value = "del",method = RequestMethod.POST)
	@ResponseBody
	public String del(Integer stkId){
		saleChanceService.deleteSaleChance(stkId);
		return "success";
	}
	
	@RequestMapping(value = "dispatch",method = RequestMethod.POST)
	@ResponseBody
	public String dispatch(Integer sale_id,Integer allot_id,String allot_date){
		Map<String,Object> param = Maps.newHashMap();
		param.put("sale_id",sale_id);
		param.put("allot_id",allot_id);
		param.put("allot_date",allot_date);
		saleChanceService.dispatch(param);
		return "success";
	}
	
	@RequestMapping(value = "finish",method = RequestMethod.POST)
	@ResponseBody
	public String finish(SaleChance saleChance,Integer allot_id){
		Customer customer = new Customer();
		Contact contact = new Contact();
		User user = new User();
		customer.setName(saleChance.getCus_name());
		user.setUserid(allot_id);
		customer.setManager(user);
		contact.setName(saleChance.getContact());
		contact.setMobile(saleChance.getTel());
		customerService.insertCustomer(saleChance,customer,contact);
		return "success";
	}
	
	@RequestMapping(value = "stop",method = RequestMethod.POST)
	@ResponseBody
	public String stop(SaleChance saleChance){
		saleChance.setState("4");
		saleChanceService.updateSaleChanceState(saleChance);
		return "success";
	}
	
	@RequestMapping(value = "/{sale_id}",method = RequestMethod.GET)
	public String detail(@PathVariable("sale_id") Integer sale_id,Model model){
		SaleChance saleChance = saleChanceService.findSaleChanceById(sale_id);
		List<SalePlan> planList = salePlanService.selectSalePlanById(sale_id);
		model.addAttribute("saleChance",saleChance);
		model.addAttribute("planList",planList);
		return "sale/plan/detail";
	}
}
