package cn.sxt.sys.mapper;

import java.util.List;

import cn.sxt.sys.domain.LogInfo;
import cn.sxt.sys.vo.LogInfoVo;

public interface LogInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(LogInfo record);

    int insertSelective(LogInfo record);

    LogInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(LogInfo record);

    int updateByPrimaryKey(LogInfo record);
    
    List<LogInfo> queryAllLogInfo(LogInfoVo infoVo);
}