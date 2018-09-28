package cn.sxt.sys.service;

import java.io.InputStream;
import java.util.List;

import cn.sxt.sys.domain.LeaveBill;
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

	LeaveBill queryLeaveBillByTaskId(String taskId);

	List<String> queryOutcomeByTaskId(String taskId);

	DataGridView queryCommonsByTaskId(String taskId);

	void completeTask(WorkFlowVo flowVo);
}
