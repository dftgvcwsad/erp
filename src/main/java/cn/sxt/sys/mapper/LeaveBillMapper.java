package cn.sxt.sys.mapper;

import java.util.List;

import cn.sxt.sys.domain.LeaveBill;
import cn.sxt.sys.vo.LeaveBillVo;

public interface LeaveBillMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(LeaveBill record);

    int insertSelective(LeaveBill record);

    LeaveBill selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(LeaveBill record);

    int updateByPrimaryKey(LeaveBill record);

	List<LeaveBillVo> queryAllLeaveBill(LeaveBillVo leaveBillVo);
}