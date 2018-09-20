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
import cn.sxt.sys.domain.Permission;
import cn.sxt.sys.service.PermissionService;
import cn.sxt.sys.utils.DataGridView;
import cn.sxt.sys.utils.JsonIdDispose;
import cn.sxt.sys.utils.TreeNode;
import cn.sxt.sys.vo.PermissionVo;

@Controller
@RequestMapping("menu")
public class MenuController {
	
	@Autowired
	private PermissionService permissionService;
	
	@RequestMapping("toMenuManager")
	public String toMenuManager() {
		return "system/menu/menuManager";
	}
	
	@RequestMapping("toMenuLeft")
	public String toMenuLeft() {
		return "system/menu/menuLeft";
	}
	
	@RequestMapping("toMenuRight")
	public String toMenuRight() {
		return "system/menu/menuRight";
	}
	
	@RequestMapping("loadMenuTree")
	@ResponseBody
	public List<TreeNode> loadMenuTree(PermissionVo permissionVo) {
		permissionVo.setType(SYS_Constast.PERMISSION_TYPE_MENU);
		List<Permission> menus = permissionService.queryAllPermissionForBoss(permissionVo);
		List<TreeNode> nodes=new ArrayList<>();
		for (Permission de : menus) {
			Boolean open=de.getOpen()==SYS_Constast.TYPE_PUBLIC_ONE?true:false;
			Boolean isParent=de.getParent()==SYS_Constast.TYPE_PUBLIC_ONE?true:false;
			nodes.add(new TreeNode(de.getId(), de.getPid(), de.getName(),open , isParent));
		}
		return nodes;
	}
	
	@RequestMapping("queryAllMenu")
	@ResponseBody
	public DataGridView queryAllMenu(PermissionVo permissionVo) {
		permissionVo.setType(SYS_Constast.PERMISSION_TYPE_MENU);
		return permissionService.queryAllPermission(permissionVo);
	}
	
	@RequestMapping("toAddMenu")
	public String toAddMenu() {
		return "system/menu/addMenu";
	}
	
	@RequestMapping("addMenu")
	@ResponseBody
	public Map<String, Object> addMenu(PermissionVo permissionVo) {
		permissionVo.setType(SYS_Constast.PERMISSION_TYPE_MENU);
		Map<String, Object> map=new HashMap<>();
		int i = permissionService.addPermission(permissionVo);
		if(i>0){
			map.put("msg", "添加成功");
		}else{
			map.put("msg", "添加失败");
		}
		return map;
	}
	
	@RequestMapping("toUpdateMenu")
	public String toUpdateMenu(PermissionVo permissionVo,Model model) {
		Permission menu = permissionService.queryPermissionById(permissionVo.getId());
		if(menu.getIcon()!=null&&!menu.getIcon().equals("")) {
			//处理一下图标显示的问题
			menu.setIcon(menu.getIcon().replace("&", "&amp;"));
		}
		model.addAttribute("menu", menu);
		return "system/menu/updateMenu";
	}
	
	@RequestMapping("updateMenu")
	@ResponseBody
	public Map<String, Object> updateMenu(PermissionVo permissionVo) {
		permissionVo.setType(SYS_Constast.PERMISSION_TYPE_MENU);
		Map<String, Object> map=new HashMap<>();
		int i = permissionService.updatePermission(permissionVo);
		if(i>0){
			map.put("msg", "修改成功");
		}else{
			map.put("msg", "修改失败");
		}
		return map;
	}
	
	@RequestMapping("batchDeleteMenu")
	@ResponseBody
	public Map<String, Object> batchDeleteMenu(PermissionVo permissionVo) {
		 Integer[] menuIds = JsonIdDispose.disposeJsonString(permissionVo.getPermissionIds());
		for (Integer menuId : menuIds) {
			permissionService.deletePermission(menuId);
		}
		Map<String, Object> map=new HashMap<>();
			map.put("msg", "删除成功");
		return map;
	}
	
	@RequestMapping("deleteMenu")
	@ResponseBody
	public Map<String, Object> deleteMenu(PermissionVo permissionVo) {
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
