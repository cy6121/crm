package com.swpu.controller.dict;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Maps;
import com.swpu.entity.Dict;
import com.swpu.service.DictService;

/** 
* @author  cy
* @createDate 2017年4月4日 下午8:54:19 
* @version 1.0 
* @describe 
*/

@Controller
@RequestMapping("/dict/data")
public class DictController {
	
	@Autowired
	private DictService dictService;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String data() {
		
		return "dict/data/list";
	}
	
	@RequestMapping(value = "datas.json",method = RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> dataList(HttpServletRequest request){
		//绘制计数器，ajax为异步请求。
		String draw = request.getParameter("draw");
		
		Map<String,Object> map = Maps.newHashMap();
		List<Dict> datas = dictService.selectDictALL();
		map.put("data",datas);
		map.put("draw",draw);
		return map;
	}
	
	@RequestMapping(value = "data.json",method = RequestMethod.GET)
	@ResponseBody
	public Dict dataOne(Integer dictId){
		return dictService.findDictById(dictId);
	}
	
	@RequestMapping(value = "add",method = RequestMethod.POST)
	@ResponseBody
	public String add(Dict dict){
		dictService.insertDict(dict);
		return "success";
	}
	
	@RequestMapping(value = "edit",method = RequestMethod.POST)
	@ResponseBody
	public String edit(Dict dict){
		dictService.updateDict(dict);
		return "success";
	}
	
	@RequestMapping(value = "del",method = RequestMethod.POST)
	@ResponseBody
	public String del(Integer dictId){
		dictService.deleteDict(dictId);
		return "success";
	}
	
}