package com.swpu.controller.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.swpu.entity.Contact;
import com.swpu.service.ContactService;

/** 
* @author  cy
* @createDate 2017年4月4日 下午8:54:19 
* @version 1.0 
* @describe  
*/

@Controller
@RequestMapping("/customer/contact")
public class ContactController {
	
	@Autowired
	private ContactService contactService;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String contactList(Integer cust_id,String name,Model model) {
		List<Contact> contactList = contactService.selectContactByCust(cust_id);
		model.addAttribute("contactList",contactList);
		model.addAttribute("cust_name",name);
		model.addAttribute("cust_id",cust_id);
		return "customer/contact/list";
	}
	
	@RequestMapping(value = "data.json",method = RequestMethod.GET)
	@ResponseBody
	public Contact dataOne(Integer contact_id){
		return contactService.selectContactById(contact_id);
	}
	
	@RequestMapping(value = "add",method = RequestMethod.POST)
	@ResponseBody
	public String add(Contact contact){
		contactService.insertContact(contact);
		return "success";
	}
	
	@RequestMapping(value = "edit",method = RequestMethod.POST)
	@ResponseBody
	public String edit(Contact contact){
		contactService.updateContact(contact);
		return "success";
	}
	
	@RequestMapping(value = "del",method = RequestMethod.POST)
	@ResponseBody
	public String del(Integer contact_id){
		contactService.deleteContact(contact_id);
		return "success";
	}
}
