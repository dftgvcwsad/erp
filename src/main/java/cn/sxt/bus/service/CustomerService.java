package cn.sxt.bus.service;

import cn.sxt.bus.domain.Customer;
import cn.sxt.bus.utils.DataGridView;
import cn.sxt.bus.vo.CustomerVo;

public interface CustomerService {
	DataGridView queryAllCustomer(CustomerVo customerVo);
	
	int addCustomer(CustomerVo customerVo);
	
	int updateCustomer(CustomerVo customerVo);
	
	int deleteCustomer(Integer id);
	
	Customer queryCustomerById(Integer id);
}
