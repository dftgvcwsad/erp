package cn.sxt.sys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import cn.sxt.sys.domain.LogInfo;
import cn.sxt.sys.mapper.LogInfoMapper;
import cn.sxt.sys.service.LogInfoService;
import cn.sxt.sys.utils.DataGridView;
import cn.sxt.sys.vo.LogInfoVo;

@Service
public class LogInfoServiceImpl implements LogInfoService {
	@Autowired
	private LogInfoMapper logInfoMapper;

	@Override
	public DataGridView queryAllLogInfo(LogInfoVo infoVo) {
		//使用Mybatis的插件PageHelper分页插件
		Page<Object> page=PageHelper.startPage(infoVo.getPage(), infoVo.getLimit());
		List<LogInfo> logInfos = logInfoMapper.queryAllLogInfo(infoVo);
		return new DataGridView(page.getTotal(), logInfos);
	}

	@Override
	public int deleteLogInfo(Integer infoId) {
		return logInfoMapper.deleteByPrimaryKey(infoId);
	}

	@Override
	public void addLogInfo(LogInfoVo infoVo) {
		logInfoMapper.insert(infoVo);
	}


}
