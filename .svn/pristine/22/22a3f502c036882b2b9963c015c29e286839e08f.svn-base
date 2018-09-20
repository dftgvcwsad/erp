package cn.sxt.bus.mapper;

import java.util.List;

import cn.sxt.bus.domain.Customer;
import cn.sxt.bus.vo.CustomerVo;

public interface CustomerMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Customer record);

    int insertSelective(Customer record);

    Customer selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Customer record);

    int updateByPrimaryKey(Customer record);
    
    List<Customer> queryAllCustomer(CustomerVo customerVo);
}