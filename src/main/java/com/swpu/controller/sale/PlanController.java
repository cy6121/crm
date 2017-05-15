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
import com.swpu.entity.SaleChance;
import com.swpu.entity.SalePlan;
import com.swpu.entity.User;
import com.swpu.service.SaleChanceService;
import com.swpu.service.SalePlanService;
import com.swpu.util.Const;

/** 
* @author  cy
* @createDate 2017年4月4日 下午8:54:19 
* @version 1.0 
* @describe  
*/

@Controller
@RequestMapping("/sale/plan")
public class PlanController {
	
	@Autowired
	private SalePlanService salePlanService;
	
	@Autowired
	private SaleChanceService saleChanceService;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String plan() {
		
		return "sale/plan/list";
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
		param.put("type","plan");
		Subject subject = SecurityUtils.getSubject();
		Session session = subject.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		param.put("userid",user.getUserid());
        
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
	
	@RequestMapping(value = "edit",method = RequestMethod.POST)
	@ResponseBody
	public String edit(Integer plan_id,String plan_todo,String plan_result,String type){
		Map<String,Object> param = Maps.newHashMap();
		param.put("type",type);
		param.put("plan_id",plan_id);
		param.put("plan_todo",plan_todo);
		param.put("plan_result",plan_result);
		salePlanService.updateSalePlan(param);
		return "success";
	}
	
	@RequestMapping(value = "del",method = RequestMethod.POST)
	@ResponseBody
	public String del(Integer plan_id){
		salePlanService.deletePlan(plan_id);
		return "success";
	}
	
	@RequestMapping(value = "make/{sale_id}", method = RequestMethod.GET)
	public String planMake(@PathVariable("sale_id") Integer sale_id,Model model){
		SaleChance saleChance = saleChanceService.findSaleChanceById(sale_id);
		List<SalePlan> planList = salePlanService.selectSalePlanById(sale_id);
		model.addAttribute("saleChance",saleChance);
		model.addAttribute("planList",planList);
		return "sale/plan/make";
	}
	
	@RequestMapping(value = "make",method = RequestMethod.POST)
	@ResponseBody
	public String make(SalePlan salePlan){
		salePlanService.insertSalePlan(salePlan);
		return "success";
	}
	
	@RequestMapping(value = "exec/{sale_id}", method = RequestMethod.GET)
	public String planExec(@PathVariable("sale_id") Integer sale_id,Model model){
		SaleChance saleChance = saleChanceService.findSaleChanceById(sale_id);
		List<SalePlan> planList = salePlanService.selectSalePlanById(sale_id);
		model.addAttribute("saleChance",saleChance);
		model.addAttribute("planList",planList);
		return "sale/plan/exec";
	}
}
