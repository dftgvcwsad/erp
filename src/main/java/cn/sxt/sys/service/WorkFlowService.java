package cn.sxt.sys.service;

import java.io.InputStream;

import cn.sxt.sys.utils.DataGridView;
import cn.sxt.sys.vo.WorkFlowVo;

public interface WorkFlowService {
	
	DataGridView queryAllProcessDeployment(WorkFlowVo flowVo);

	void addProcessDeployment(InputStream inputStream, String deploymentName);

	DataGridView queryAllprocessDef(WorkFlowVo flowVo);

	void deleteDeployment(String deploymentId);
	//获得流程图的流
	InputStream viewProcessImge(String deploymentId);

	void startLeaveBillProcess(Integer id);

	DataGridView queryCurrentUserTask(WorkFlowVo flowVo);
}
