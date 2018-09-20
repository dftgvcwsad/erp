package cn.sxt.bus.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import cn.sxt.bus.domain.Customer;
import cn.sxt.bus.mapper.CustomerMapper;
import cn.sxt.bus.service.CustomerService;
import cn.sxt.bus.utils.DataGridView;
import cn.sxt.bus.vo.CustomerVo;

@Service
public class CustomerServiceImpl implements CustomerService {
	
	@Autowired
	private CustomerMapper customerMapper;

	@RequestMapping("toCustomerManager")
	public String toCustomerManager() {
		return "busness/customer/customerManager";
	}
	
	@Override
	public DataGridView queryAllCustomer(CustomerVo customerVo) {
		Page<Object> page = PageHelper.startPage(customerVo.getPage(), customerVo.getLimit());
		List<Customer> customers = customerMapper.queryAllCustomer(customerVo);
		return new DataGridView(page.getTotal(), customers);
	}

	@Override
	public int addCustomer(CustomerVo customerVo) {
		return customerMapper.insertSelective(customerVo);
	}

	@Override
	public int updateCustomer(CustomerVo customerVo) {
		return customerMapper.updateByPrimaryKeySelective(customerVo);
	}

	@Override
	public int deleteCustomer( Integer id) {
		return customerMapper.deleteByPrimaryKey(id);
	}

	@Override
	public Customer queryCustomerById(Integer id) {
		return customerMapper.selectByPrimaryKey(id);
	}
}
