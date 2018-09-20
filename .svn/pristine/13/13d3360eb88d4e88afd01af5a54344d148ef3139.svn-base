package cn.sxt.bus.service;

import java.util.List;

import cn.sxt.bus.domain.Goods;
import cn.sxt.bus.utils.DataGridView;
import cn.sxt.bus.vo.GoodsVo;

public interface GoodsService {
	DataGridView queryAllGoods(GoodsVo goodsVo);
	
	int addGoods(GoodsVo goodsVo);
	
	int updateGoods(GoodsVo goodsVo);
	
	int deleteGoods(Integer id);
	
	Goods queryGoodsById(Integer id);

	List<Goods> getGoodsByProviderId(GoodsVo goodsVo);
}
