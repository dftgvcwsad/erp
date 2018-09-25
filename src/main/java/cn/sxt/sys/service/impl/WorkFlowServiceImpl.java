package cn.sxt.sys.service.impl;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.zip.ZipInputStream;

import org.activiti.engine.HistoryService;
import org.activiti.engine.IdentityService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.task.Task;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.sxt.sys.constast.SYS_Constast;
import cn.sxt.sys.domain.LeaveBill;
import cn.sxt.sys.mapper.LeaveBillMapper;
import cn.sxt.sys.service.WorkFlowService;
import cn.sxt.sys.utils.DataGridView;
import cn.sxt.sys.utils.SessionUtils;
import cn.sxt.sys.vo.WorkFlowVo;
import cn.sxt.sys.vo.act.ActProcessDefinitionEntity;
import cn.sxt.sys.vo.act.ActTaskEntity;
import cn.sxt.sys.vo.act.DeploymentEntity;

@Service
public class WorkFlowServiceImpl implements WorkFlowService {

	@Autowired
	private LeaveBillMapper leaveBillMapper;

	@Autowired
	private RepositoryService repositoryService;

	@Autowired
	private RuntimeService runtimeService;

	@Autowired
	private TaskService taskService;

	@Autowired
	private IdentityService identityService;

	@Autowired
	private HistoryService historyService;

	@Override
	public DataGridView queryAllProcessDeployment(WorkFlowVo flowVo) {
		String deployName = flowVo.getDeploymentName();
		if (null == deployName) {
			deployName = "";
		}
		long count = repositoryService.createDeploymentQuery().deploymentNameLike("%" + deployName + "%").count();
		List<Deployment> listPage = repositoryService.createDeploymentQuery().deploymentNameLike("%" + deployName + "%")
				.listPage((flowVo.getPage() - 1) * flowVo.getLimit(), flowVo.getLimit());
		List<DeploymentEntity> deployments = new ArrayList<>();
		for (Deployment deployment : listPage) {
			DeploymentEntity actDeployment = new DeploymentEntity();
			BeanUtils.copyProperties(deployment, actDeployment);
			deployments.add(actDeployment);
		}
		return new DataGridView(count, deployments);
	}

	@Override
	public DataGridView queryAllprocessDef(WorkFlowVo flowVo) {
		String deployName = flowVo.getDeploymentName();
		if (null == deployName) {
			deployName = "";
		}
		List<Deployment> list = repositoryService.createDeploymentQuery().deploymentNameLike("%" + deployName + "%")
				.list();
		if (list.size() == 0) {
			return new DataGridView(0L, null);
		} else {
			Set<String> deploymentIds = new HashSet<>();
			for (Deployment d : list) {
				deploymentIds.add(d.getId());
			}
			long count = repositoryService.createProcessDefinitionQuery().deploymentIds(deploymentIds).count();
			List<ProcessDefinition> listPage = repositoryService.createProcessDefinitionQuery()
					.deploymentIds(deploymentIds)
					.listPage((flowVo.getPage() - 1) * flowVo.getLimit(), flowVo.getLimit());
			List<ActProcessDefinitionEntity> data = new ArrayList<>();
			for (ProcessDefinition pde : listPage) {
				ActProcessDefinitionEntity entity = new ActProcessDefinitionEntity();
				BeanUtils.copyProperties(pde, entity);
				data.add(entity);
			}
			return new DataGridView(count, data);
		}
	}

	@Override
	public void addProcessDeployment(InputStream inputStream, String deploymentName) {
		ZipInputStream zipInputStream = new ZipInputStream(inputStream);
		repositoryService.createDeployment().name(deploymentName).addZipInputStream(zipInputStream).deploy();
	}

	@Override
	public void deleteDeployment(String deploymentId) {
		repositoryService.deleteDeployment(deploymentId);
	}

	@Override
	public InputStream viewProcessImge(String deploymentId) {
		ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery()
				.deploymentId(deploymentId).singleResult();
		String resourceName = processDefinition.getDiagramResourceName();
		return repositoryService.getResourceAsStream(deploymentId, resourceName);
	}

	@Override
	public void startLeaveBillProcess(Integer id) {
		String processDefinitionKey = LeaveBill.class.getSimpleName();
		// 提交事务，创建流程变量设置办理人
		String name = SessionUtils.getUserNameInSession("loginUser");
		Map<String, Object> variables = new HashMap<>();
		variables.put("username", name);
		// 设置业务id
		String businessKey = processDefinitionKey + "_" + id;
		runtimeService.startProcessInstanceByKey(processDefinitionKey, businessKey, variables);
		// 提交成功吧请假单状态更改
		LeaveBill leaveBill = new LeaveBill();
		leaveBill.setId(id);
		leaveBill.setState(String.valueOf(SYS_Constast.TYPE_LEAVEBILL_STATE_ONE));
		leaveBillMapper.updateByPrimaryKeySelective(leaveBill);
	}

	@Override
	public DataGridView queryCurrentUserTask(WorkFlowVo flowVo) {
		String assignee = SessionUtils.getUserNameInSession("lofinUser");
		long count = taskService.createTaskQuery().taskAssignee(assignee).count();
		List<Task> listPage = taskService.createTaskQuery().taskAssignee(assignee).orderByTaskCreateTime()
		.listPage((flowVo.getPage() - 1) * flowVo.getLimit(), flowVo.getLimit());
		List<ActTaskEntity> entities =new ArrayList<>();
		for (Task task : listPage) {
			ActTaskEntity entity=new ActTaskEntity();
			BeanUtils.copyProperties(task, entity);
			entities.add(entity);
		}
		return new DataGridView(count, entities);
	}

}
