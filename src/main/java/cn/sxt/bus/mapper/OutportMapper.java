package cn.sxt.bus.mapper;

import java.util.List;

import cn.sxt.bus.domain.Outport;
import cn.sxt.bus.vo.OutportVo;

public interface OutportMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Outport record);

    int insertSelective(Outport record);

    Outport selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Outport record);

    int updateByPrimaryKey(Outport record);

	List<Outport> queryAllOutport(OutportVo outportVo);
}