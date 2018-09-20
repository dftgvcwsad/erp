package cn.sxt.sys.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.sxt.sys.constast.SYS_Constast;
import cn.sxt.sys.domain.Permission;
import cn.sxt.sys.domain.User;
import cn.sxt.sys.service.PermissionService;
import cn.sxt.sys.utils.DataGridView;
import cn.sxt.sys.utils.JsonIdDispose;
import cn.sxt.sys.utils.TreeNode;
import cn.sxt.sys.utils.TreeNodeBuiler;
import cn.sxt.sys.vo.PermissionVo;

@RequestMapping("permission")
@Controller
public class PermissionController {
	
	@Autowired
	private PermissionService permissionService;

	@RequestMapping("loadIndexTree")
	@ResponseBody
	public List<TreeNode> loadIndexTree(HttpSession session){
		User user = (User) session.getAttribute("loginUser");
		List<Permission> list=null;
		//判断是否是超管
		if(user.getType()==SYS_Constast.USER_TYPE_SUPER) {
			PermissionVo permissionVo=new PermissionVo();
			//查询所有可用菜单
			permissionVo.setType(SYS_Constast.PERMISSION_TYPE_MENU);
			permissionVo.setAvailable(SYS_Constast.MENU_AVAILABLE_YES);
			list = permissionService.queryAllPermissionForBoss(permissionVo);
		}else {
			//根据用户ID查询可用菜单
			PermissionVo permissionVo=new PermissionVo();
			permissionVo.setType(SYS_Constast.PERMISSION_TYPE_MENU);
			permissionVo.setAvailable(SYS_Constast.MENU_AVAILABLE_YES);
			list = permissionService.queryPermissionByUserId(permissionVo, user.getId());
		}
				List<TreeNode> treeNodes=new ArrayList<>();
				//遍历所有菜单取出需要的属性添加到TreeNode集合中
				for (Permission pei : list) {
					Boolean open=pei.getOpen()==SYS_Constast.TYPE_PUBLIC_ONE?true:false;
					treeNodes.add(new TreeNode(pei.getId(), pei.getPid(), pei.getName(), pei.getIcon(), pei.getHref(), open, pei.getTarget()));
				}
				//使用TreeNodeBuiler将treeNodes菜单集合变得有层次，并且从节点ID为1最为根节点
				//把简答的json集合对象转成标准的json集合对象
		return TreeNodeBuiler.builer(treeNodes, 1);
	}
	
	@RequestMapping("toPermissionManager")
	public String toPermissionManager() {
		return "system/permission/permissionManager";
	}
	
	@RequestMapping("toPermissionLeft")
	public String toPermissionLeft() {
		return "system/permission/permissionLeft";
	}
	
	@RequestMapping("toPermissionRight")
	public String toPermissionRight() {
		return "system/permission/permissionRight";
	}
	
	@RequestMapping("loadPermissionTree")
	@ResponseBody
	public List<TreeNode> loadPermissionTree(PermissionVo permissionVo) {
		permissionVo.setType(SYS_Constast.PERMISSION_TYPE_MENU);
		List<Permission> permissions = permissionService.queryAllPermissionForBoss(permissionVo);
		List<TreeNode> nodes=new ArrayList<>();
		for (Permission de : permissions) {
			Boolean open=de.getOpen()==SYS_Constast.TYPE_PUBLIC_ONE?true:false;
			Boolean isParent=de.getParent()==SYS_Constast.TYPE_PUBLIC_ONE?true:false;
			nodes.add(new TreeNode(de.getId(), de.getPid(), de.getName(),open , isParent));
		}
		return nodes;
	}
	
	@RequestMapping("queryAllPermission")
	@ResponseBody
	public DataGridView queryAllPermission(PermissionVo permissionVo) {
		permissionVo.setType(SYS_Constast.PERMISSION_TYPE_PERMISSION);
		return permissionService.queryAllPermission(permissionVo);
	}
	
	@RequestMapping("toAddPermission")
	public String toAddPermission() {
		return "system/permission/addPermission";
	}
	
	@RequestMapping("addPermission")
	@ResponseBody
	public Map<String, Object> addPermission(PermissionVo permissionVo) {
		permissionVo.setType(SYS_Constast.PERMISSION_TYPE_PERMISSION);
		Map<String, Object> map=new HashMap<>();
		int i = permissionService.addPermission(permissionVo);
		if(i>0){
			map.put("msg", "添加成功");
		}else{
			map.put("msg", "添加失败");
		}
		return map;
	}
	
	@RequestMapping("toUpdatePermission")
	public String toUpdatePermission(PermissionVo permissionVo,Model model) {
		Permission permission = permissionService.queryPermissionById(permissionVo.getId());
		model.addAttribute("permission", permission);
		return "system/permission/updatePermission";
	}
	
	@RequestMapping("updatePermission")
	@ResponseBody
	public Map<String, Object> updatePermission(PermissionVo permissionVo) {
		permissionVo.setType(SYS_Constast.PERMISSION_TYPE_PERMISSION);
		Map<String, Object> map=new HashMap<>();
		int i = permissionService.updatePermission(permissionVo);
		if(i>0){
			map.put("msg", "修改成功");
		}else{
			map.put("msg", "修改失败");
		}
		return map;
	}
	
	@RequestMapping("batchDeletePermission")
	@ResponseBody
	public Map<String, Object> batchDeletePermission(PermissionVo permissionVo) {
		 Integer[] permissionIds = JsonIdDispose.disposeJsonString(permissionVo.getPermissionIds());
		for (Integer permissionId : permissionIds) {
			permissionService.deletePermission(permissionId);
		}
		Map<String, Object> map=new HashMap<>();
			map.put("msg", "删除成功");
		return map;
	}
	
	@RequestMapping("deletePermission")
	@ResponseBody
	public Map<String, Object> deletePermission(PermissionVo permissionVo) {
		int i = permissionService.deletePermission(permissionVo.getId());
		Map<String, Object> map=new HashMap<>();
		if(i>0){
			map.put("msg", "删除成功");
		}else{
			map.put("msg", "删除失败");
		}
		return map;
	}
}
