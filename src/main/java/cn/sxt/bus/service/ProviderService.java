package cn.sxt.bus.service;

import java.util.List;

import cn.sxt.bus.domain.Provider;
import cn.sxt.bus.utils.DataGridView;
import cn.sxt.bus.vo.ProviderVo;

public interface ProviderService {
	DataGridView queryAllProvider(ProviderVo providerVo);
	
	int addProvider(ProviderVo providerVo);
	
	int updateProvider(ProviderVo providerVo);
	
	int deleteProvider(Integer id);
	
	Provider queryProviderById(Integer id);
	
	List<Provider> queryAllProviderForList(ProviderVo providerVo);
}
