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
import org.activiti.engine.impl.identity.Authentication;
import org.activiti.engine.impl.persistence.entity.ProcessDefinitionEntity;
import org.activiti.engine.impl.pvm.PvmTransition;
import org.activiti.engine.impl.pvm.process.ActivityImpl;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Comment;
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
import cn.sxt.sys.vo.act.ActCommentEntity;
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
		String assignee = SessionUtils.getUserNameInSession("loginUser");
		long count = taskService.createTaskQuery().taskAssignee(assignee).count();
		List<Task> listPage = taskService.createTaskQuery().taskAssignee(assignee).orderByTaskCreateTime().desc()
				.listPage((flowVo.getPage() - 1) * flowVo.getLimit(), flowVo.getLimit());
		List<ActTaskEntity> entities = new ArrayList<>();
		for (Task task : listPage) {
			ActTaskEntity entity = new ActTaskEntity();
			BeanUtils.copyProperties(task, entity);
			entities.add(entity);
		}
		return new DataGridView(count, entities);
	}

	//根据任务ID查询请假单的信息
	@Override
	public LeaveBill queryLeaveBillByTaskId(String taskId) {
		//根据任务ID查询出任务实例中的流程实例ID
		String processInstanceId = taskService.createTaskQuery().taskId(taskId).singleResult().getProcessInstanceId();
		//根据流程实例ID查询出流程实例中的业务ID
		String businessKey = runtimeService.createProcessInstanceQuery().processInstanceId(processInstanceId).singleResult().getBusinessKey();
		//从业务ID中截取出请假单ID
		String id= businessKey.split("_")[1];
		LeaveBill leaveBill = leaveBillMapper.selectByPrimaryKey(Integer.valueOf(id));
		return leaveBill;
	}

	@Override
	public List<String> queryOutcomeByTaskId(String taskId) {
		List<String> outcomes=new ArrayList<>();
		//根据任务ID查询到任务实例
		Task task = taskService.createTaskQuery().taskId(taskId).singleResult();
		//得到任务实例中的流程定义ID
		String processDefinitionId = task.getProcessDefinitionId();
		//得到任务实例中的当前活动的ID（就是bpmn的xml格式里的userTask id="usertask1" ）
		String userTaskId = task.getTaskDefinitionKey();
		//使用流程定义ID查询流程定义对象里的xml数据（就是bpmn的xml）
		ProcessDefinitionEntity processDefinitionEntity=(ProcessDefinitionEntity) repositoryService.getProcessDefinition(processDefinitionId);
		//使用活动ID中流程定义中查询出节点
		ActivityImpl activityImpl = processDefinitionEntity.findActivity(userTaskId);
		List<PvmTransition> outgoingTransitions = activityImpl.getOutgoingTransitions();
		if(null!=outgoingTransitions&&outgoingTransitions.size()>0) {
			for (PvmTransition pvmTransition : outgoingTransitions) {
				Object name=pvmTransition.getProperty("name");
				outcomes.add(name.toString());
			}
		}
		return outcomes;
	}

	@Override
	public DataGridView queryCommonsByTaskId(String taskId) {
		//根据任务ID查询任务实例中的流程实例ID
		String processInstanceId = taskService.createTaskQuery().taskId(taskId).singleResult().getProcessInstanceId();
		//根据流程实例ID查询出整个流程的批注信息
		List<Comment> comments = taskService.getProcessInstanceComments(processInstanceId);
		List<ActCommentEntity> entities=new ArrayList<>();
		for (Comment comment : comments) {
			ActCommentEntity entity=new ActCommentEntity();
			BeanUtils.copyProperties(comment, entity);
			entities.add(entity);
		}
		return new DataGridView(Long.valueOf(entities.size()), entities);
	}

	@Override
	public void completeTask(WorkFlowVo flowVo) {
		String taskId = flowVo.getTaskId();//任务ID
		String outcom = flowVo.getOutcom();//连接名称
		String comment = flowVo.getComment();//批注信息
		Integer id = flowVo.getId();//请假单的ID
		//1,创建流程变量的Map
		Map<String, Object> variables=new HashMap<>();
		variables.put("outcom", outcom);
		//2,根据任务ID查询流程实例对象,得到流程实例ID
		String processInstanceId = taskService.createTaskQuery().taskId(taskId).singleResult().getProcessInstanceId();
		//3,得到当前用户
		String username = SessionUtils.getUserNameInSession("loginUser");
		//4,设置当前线程用户的局部变量
		Authentication.setAuthenticatedUserId(username);
		//5,添加批注信息
		/**
		 * 因为批注 是属性某个办理人  所以一空设置办理人的ID。可以查看addComment-->AddcomentAdd-->
		 *  String userId = Authentication.getAuthenticatedUserId();
    		CommentEntity comment = new CommentEntity();
    		comment.setUserId(userId);
		 */
		taskService.addComment(taskId, processInstanceId, "["+outcom+"]"+comment);
		//6，完成任务
		taskService.complete(taskId, variables);
		//8,判断任务是否完成
		ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(processInstanceId).singleResult();
		if(null==processInstance) {
			//说明任务这完成了
			//更新请假单的状态
			LeaveBill leaveBill=new LeaveBill();
			leaveBill.setId(id);
			if(outcom.equals("放弃")) {
				leaveBill.setState(String.valueOf(SYS_Constast.TYPE_LEAVEBILL_STATE_THREE));
			}else {
				leaveBill.setState(String.valueOf(SYS_Constast.TYPE_LEAVEBILL_STATE_TOW));
			}
			leaveBillMapper.updateByPrimaryKeySelective(leaveBill);
		}
	}
	
	
}
