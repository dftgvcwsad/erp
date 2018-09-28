package cn.sxt.sys.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.sxt.sys.domain.LeaveBill;
import cn.sxt.sys.service.WorkFlowService;
import cn.sxt.sys.utils.DataGridView;
import cn.sxt.sys.vo.WorkFlowVo;

@Controller
@RequestMapping("workFlow")
public class WorkFlowController {
	
	@Autowired
	private WorkFlowService workFlowService;
	
	@RequestMapping("toWorkFlowManager")
	public String toWorkFlowManager() {
		return "system/workFlow/workFlowManager";
	}
	
	@RequestMapping("queryAllProcessDeployment")
	@ResponseBody
	public DataGridView queryAllProcessDeployment(WorkFlowVo flowVo) {
		return workFlowService.queryAllProcessDeployment(flowVo);
	}
	
	@RequestMapping("queryAllprocessDef")
	@ResponseBody
	public DataGridView queryAllprocessDef(WorkFlowVo flowVo) {
		return workFlowService.queryAllprocessDef(flowVo);
	}
	
	@RequestMapping("toAddProcessDeployment")
	public String toAddProcessDeployment() {
		return "system/workFlow/workFlowAdd";
	}
	
	@RequestMapping("addProcessDeployment")
	@ResponseBody
	public Map<String, Object> addProcessDeployment(MultipartFile mf,WorkFlowVo flowVo) {
		Map<String, Object> map=new HashMap<>();
		String msg="部署成功";
		try {
			workFlowService.addProcessDeployment(mf.getInputStream(),flowVo.getDeploymentName());
		} catch (IOException e) {
			e.printStackTrace();
			msg="部署失败";
		}
		map.put("msg", msg);
		return map;
	}
	
	@RequestMapping("deleteDeployment")
	@ResponseBody
	public Map<String, Object> deleteDeployment(WorkFlowVo flowVo) {
		Map<String, Object> map=new HashMap<>();
		String msg="删除成功";
		try {
			workFlowService.deleteDeployment(flowVo.getDeploymentId());
		} catch (Exception e) {
			e.printStackTrace();
			msg="删除失败";
		}
		map.put("msg", msg);
		return map;
	}
	
	@RequestMapping("toViewProcessImge")
	public String toViewProcessImge(WorkFlowVo flowVo) {
		return "system/workFlow/viewProcessImge";
	}
	
	@RequestMapping("viewProcessImge")
	public void viewProcessImge(WorkFlowVo flowVo,HttpServletResponse response) {
		InputStream inputStream=workFlowService.viewProcessImge(flowVo.getDeploymentId());
		try {
			BufferedImage read = ImageIO.read(inputStream);
			ImageIO.write(read, "JPEG", response.getOutputStream());
			inputStream.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("startLeaveBillProcess")
	@ResponseBody
	public Map<String, Object> startLeaveBillProcess(WorkFlowVo flowVo) {
		Map<String, Object> map=new HashMap<>();
		String msg="提交成功";
		try {
			workFlowService.startLeaveBillProcess(flowVo.getId());
		} catch (Exception e) {
			e.printStackTrace();
			msg="提交失败";
		}
		map.put("msg", msg);
		return map;
	}
	
	@RequestMapping("toTaskManager")
	public String toTaskManager() {
		return "system/workFlow/taskManager";
	}
	
	@RequestMapping("queryCurrentUserTask")
	@ResponseBody
	public DataGridView queryCurrentUserTask(WorkFlowVo flowVo) {
		return workFlowService.queryCurrentUserTask(flowVo);
	}
	
	@RequestMapping("toDoTask")
	public String toDoTask(WorkFlowVo flowVo,Model model) {
		//根据任务ID查询请假单
		LeaveBill leaveBill= workFlowService.queryLeaveBillByTaskId(flowVo.getTaskId());
		//根据任务ID查询到按钮的集合
		List<String> outcomes=workFlowService.queryOutcomeByTaskId(flowVo.getTaskId());
		model.addAttribute("leaveBill", leaveBill);
		model.addAttribute("outcomes", outcomes);
		return "system/workFlow/doTask";
	}
	
	@RequestMapping("queryCommonsByTaskId")
	@ResponseBody
	public DataGridView queryCommonsByTaskId(WorkFlowVo flowVo) {
		return workFlowService.queryCommonsByTaskId(flowVo.getTaskId());
	}
	
	@RequestMapping("completeTask")
	@ResponseBody
	public Map<String, Object> completeTask(WorkFlowVo flowVo) {
		Map<String, Object> map=new HashMap<>();
		String msg="提交成功";
		try {
			workFlowService.completeTask(flowVo);
		} catch (Exception e) {
			e.printStackTrace();
			msg="提交失败";
		}
		map.put("msg", msg);
		return map;
	}
}
