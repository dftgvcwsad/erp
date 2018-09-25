package cn.sxt.sys.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.sxt.sys.constast.SYS_Constast;
import cn.sxt.sys.domain.Dept;
import cn.sxt.sys.service.DeptService;
import cn.sxt.sys.utils.DataGridView;
import cn.sxt.sys.utils.JsonIdDispose;
import cn.sxt.sys.utils.TreeNode;
import cn.sxt.sys.vo.DeptVo;

@Controller
@RequestMapping("dept")
public class DeptController {
	@Autowired
	private DeptService deptService;
	
	@RequestMapping("toDeptLeft")
	public String toDeptLeft() {
		return "system/dept/deptLeft";
	}
	
	@RequestMapping("toDeptRight")
	public String toDeptRight() {
		return "system/dept/deptRight";
	}
	
	@RequestMapping("loadDeptTree")
	@ResponseBody
	public List<TreeNode> loadDeptTree(DeptVo deptVo) {
		List<Dept> depts = deptService.queryAllDeptForTree(deptVo);
		List<TreeNode> nodes=new ArrayList<>();
		for (Dept de : depts) {
			Boolean open=de.getOpen()==SYS_Constast.TYPE_PUBLIC_ONE?true:false;
			Boolean isParent=de.getParent()==SYS_Constast.TYPE_PUBLIC_ONE?true:false;
			nodes.add(new TreeNode(de.getId(), de.getPid(), de.getName(),open , isParent));
		}
		return nodes;
	}
	
	@RequestMapping("queryAllDept")
	@ResponseBody
	public DataGridView queryAllDept(DeptVo deptVo) {
		return deptService.queryAllDept(deptVo);
	}
	
	@RequestMapping("toAddDept")
	public String toAddDept() {
		return "system/dept/addDept";
	}
	
	@RequestMapping("addDept")
	@ResponseBody
	public Map<String, Object> addDept(DeptVo deptVo) {
		Map<String, Object> map=new HashMap<>();
		int i = deptService.addDept(deptVo);
		if(i>0){
			map.put("msg", "添加成功");
		}else{
			map.put("msg", "添加失败");
		}
		return map;
	}
	
	@RequestMapping("toUpdateDept")
	public String toUpdateDept(DeptVo deptVo,Model model) {
		Dept dept = deptService.queryDeptById(deptVo.getId());
		model.addAttribute("dept", dept);
		return "system/dept/updateDept";
	}
	
	@RequestMapping("updateDept")
	@ResponseBody
	public Map<String, Object> updateDept(DeptVo deptVo) {
		Map<String, Object> map=new HashMap<>();
		int i = deptService.updateDept(deptVo);
		if(i>0){
			map.put("msg", "修改成功");
		}else{
			map.put("msg", "修改失败");
		}
		return map;
	}
	
	@RequestMapping("batchDeleteDept")
	@ResponseBody
	public Map<String, Object> batchDeleteDept(DeptVo deptVo) {
		 Integer[] deptIds = JsonIdDispose.disposeJsonString(deptVo.getDeptIds());
		for (Integer deptId : deptIds) {
			deptService.deleteDept(deptId);
		}
		Map<String, Object> map=new HashMap<>();
			map.put("msg", "删除成功");
		return map;
	}
	
	@RequestMapping("deleteDept")
	@ResponseBody
	public Map<String, Object> deleteDept(DeptVo deptVo) {
		int i = deptService.deleteDept(deptVo.getId());
		Map<String, Object> map=new HashMap<>();
		if(i>0){
			map.put("msg", "删除成功");
		}else{
			map.put("msg", "删除失败");
		}
		return map;
	}
}
