package cn.sxt.bus.mapper;

import java.util.List;

import cn.sxt.bus.domain.Inport;
import cn.sxt.bus.vo.InportVo;

public interface InportMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Inport record);

    int insertSelective(Inport record);

    Inport selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Inport record);

    int updateByPrimaryKey(Inport record);
    
    List<Inport> queryAllInport(InportVo inportVo);
}