package cn.sxt.bus.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import cn.sxt.bus.domain.Customer;
import cn.sxt.bus.service.CustomerService;
import cn.sxt.bus.utils.DataGridView;
import cn.sxt.bus.vo.CustomerVo;
import cn.sxt.sys.utils.JsonIdDispose;

@RequestMapping("customer")
@Controller
public class CustomerController {
	
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping("toCustomerManager")
	public String toCustomerManager() {
		return "busness/customer/customerManager";
	}
	
	@RequestMapping("queryAllCustomer")
	@ResponseBody
	public DataGridView queryAllCustomer(CustomerVo customerVo) {
		DataGridView gridView = customerService.queryAllCustomer(customerVo);
		return gridView;
	}
	
	@RequestMapping("toAddCustomer")
	public String toAddCustomer() {
		return "busness/customer/addCustomer";
	}
	
	@RequestMapping("addCustomer")
	@ResponseBody
	public Map<String, Object> addCustomer(CustomerVo customerVo) {
		Map<String, Object> map=new HashMap<>();
		int i = customerService.addCustomer(customerVo);
		if(i>0){
			map.put("msg", "添加成功");
		}else{
			map.put("msg", "添加失败");
		}
		return map;
	}
	
	@RequestMapping("toUpdateCustomer")
	public String toUpdateCustomer(CustomerVo customerVo,Model model) {
		Customer customer = customerService.queryCustomerById(customerVo.getId());
		model.addAttribute("customer", customer);
		return "busness/customer/updateCustomer";
	}
	
	@RequestMapping("updateCustomer")
	@ResponseBody
	public Map<String, Object> updateCustomer(CustomerVo customerVo) {
		Map<String, Object> map=new HashMap<>();
		int i = customerService.updateCustomer(customerVo);
		if(i>0){
			map.put("msg", "修改成功");
		}else{
			map.put("msg", "修改失败");
		}
		return map;
	}
	
	@RequestMapping("deleteCustomer")
	@ResponseBody
	public Map<String, Object> deleteCustomer(CustomerVo customerVo) {
		int i = customerService.deleteCustomer(customerVo.getId());
		Map<String, Object> map=new HashMap<>();
		if(i>0){
			map.put("msg", "删除成功");
		}else{
			map.put("msg", "删除失败");
		}
		return map;
	}
	@RequestMapping("batchDeleteCustomer")
	@ResponseBody
	public Map<String, Object> batchDeleteCustomer(CustomerVo customerVo) {
		 Integer[] customerIds = JsonIdDispose.disposeJsonString(customerVo.getCustomerIds());
		for (Integer infoId : customerIds) {
			customerService.deleteCustomer(infoId);
		}
		Map<String, Object> map=new HashMap<>();
			map.put("msg", "删除成功");
		return map;
	}
}
