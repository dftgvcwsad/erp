package cn.sxt.bus.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import cn.sxt.bus.domain.Provider;
import cn.sxt.bus.mapper.ProviderMapper;
import cn.sxt.bus.service.ProviderService;
import cn.sxt.bus.utils.DataGridView;
import cn.sxt.bus.vo.ProviderVo;

@Service
public class ProviderServiceImpl implements ProviderService {
	
	@Autowired
	private ProviderMapper providerMapper;

	@RequestMapping("toProviderManager")
	public String toProviderManager() {
		return "busness/provider/providerManager";
	}
	
	@Override
	public DataGridView queryAllProvider(ProviderVo providerVo) {
		Page<Object> page = PageHelper.startPage(providerVo.getPage(), providerVo.getLimit());
		List<Provider> providers = providerMapper.queryAllProvider(providerVo);
		return new DataGridView(page.getTotal(), providers);
	}

	@Override
	public int addProvider(ProviderVo providerVo) {
		return providerMapper.insertSelective(providerVo);
	}

	@Override
	public int updateProvider(ProviderVo providerVo) {
		return providerMapper.updateByPrimaryKeySelective(providerVo);
	}

	@Override
	public int deleteProvider( Integer id) {
		return providerMapper.deleteByPrimaryKey(id);
	}

	@Override
	public Provider queryProviderById(Integer id) {
		return providerMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<Provider> queryAllProviderForList(ProviderVo providerVo) {
		return providerMapper.queryAllProvider(providerVo);
	}
}
