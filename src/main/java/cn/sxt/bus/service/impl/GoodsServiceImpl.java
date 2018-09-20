package cn.sxt.bus.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import cn.sxt.bus.domain.Goods;
import cn.sxt.bus.mapper.GoodsMapper;
import cn.sxt.bus.service.GoodsService;
import cn.sxt.bus.utils.DataGridView;
import cn.sxt.bus.vo.GoodsVo;

@Service
public class GoodsServiceImpl implements GoodsService {
	
	@Autowired
	private GoodsMapper goodsMapper;

	@RequestMapping("toGoodsManager")
	public String toGoodsManager() {
		return "busness/goods/goodsManager";
	}
	
	@Override
	public DataGridView queryAllGoods(GoodsVo goodsVo) {
		Page<Object> page = PageHelper.startPage(goodsVo.getPage(), goodsVo.getLimit());
		List<Goods> goodss = goodsMapper.queryAllGoods(goodsVo);
		return new DataGridView(page.getTotal(), goodss);
	}

	@Override
	public int addGoods(GoodsVo goodsVo) {
		return goodsMapper.insertSelective(goodsVo);
	}

	@Override
	public int updateGoods(GoodsVo goodsVo) {
		return goodsMapper.updateByPrimaryKeySelective(goodsVo);
	}

	@Override
	public int deleteGoods( Integer id) {
		return goodsMapper.deleteByPrimaryKey(id);
	}

	@Override
	public Goods queryGoodsById(Integer id) {
		return goodsMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<Goods> getGoodsByProviderId(GoodsVo goodsVo) {
		return goodsMapper.queryAllGoods(goodsVo);
	}
}
