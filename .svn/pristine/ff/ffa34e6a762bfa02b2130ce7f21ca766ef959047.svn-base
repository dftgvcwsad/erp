package cn.sxt.bus.mapper;

import java.util.List;

import cn.sxt.bus.domain.Goods;
import cn.sxt.bus.vo.GoodsVo;

public interface GoodsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Goods record);

    int insertSelective(Goods record);

    Goods selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Goods record);

    int updateByPrimaryKey(Goods record);
    
    List<Goods> queryAllGoods(GoodsVo goodsVo);
}