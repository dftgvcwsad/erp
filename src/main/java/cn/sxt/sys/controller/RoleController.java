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
import cn.sxt.sys.domain.Role;
import cn.sxt.sys.service.PermissionService;
import cn.sxt.sys.service.RoleService;
import cn.sxt.sys.utils.DataGridView;
import cn.sxt.sys.utils.JsonIdDispose;
import cn.sxt.sys.utils.TreeNode;
import cn.sxt.sys.vo.PermissionVo;
import cn.sxt.sys.vo.RoleVo;

@Controller
@RequestMapping("role")
public class RoleController {
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private PermissionService permissionService;
	
	@RequestMapping("toRoleManager")
	public String toRoleManager() {
		return "system/role/roleManager";
	}
	
	@RequestMapping("queryAllRole")
	@ResponseBody
	public DataGridView queryAllRole(RoleVo roleVo) {
		return roleService.queryAllRole(roleVo);
	}
	
	@RequestMapping("toAddRole")
	public String toAddRole() {
		return "system/role/addRole";
	}
	
	@RequestMapping("addRole")
	@ResponseBody
	public Map<String, Object> addRole(RoleVo roleVo) {
		Map<String, Object> map=new HashMap<>();
		int i = roleService.addRole(roleVo);
		if(i>0){
			map.put("msg", "添加成功");
		}else{
			map.put("msg", "添加失败");
		}
		return map;
	}
	
	@RequestMapping("toUpdateRole")
	public String toUpdateRole(RoleVo roleVo,Model model) {
		Role role = roleService.queryRoleById(roleVo.getId());
		model.addAttribute("role", role);
		return "system/role/updateRole";
	}
	
	@RequestMapping("updateRole")
	@ResponseBody
	public Map<String, Object> updateRole(RoleVo roleVo) {
		Map<String, Object> map=new HashMap<>();
		int i = roleService.updateRole(roleVo);
		if(i>0){
			map.put("msg", "修改成功");
		}else{
			map.put("msg", "修改失败");
		}
		return map;
	}
	
	@RequestMapping("batchDeleteRole")
	@ResponseBody
	public Map<String, Object> batchDeleteRole(RoleVo roleVo) {
		 Integer[] roleIds = JsonIdDispose.disposeJsonString(roleVo.getRoleIds());
		for (Integer roleId : roleIds) {
			roleService.deleteRole(roleId);
		}
		Map<String, Object> map=new HashMap<>();
			map.put("msg", "删除成功");
		return map;
	}
	
	@RequestMapping("deleteRole")
	@ResponseBody
	public Map<String, Object> deleteRole(RoleVo roleVo) {
		int i = roleService.deleteRole(roleVo.getId());
		Map<String, Object> map=new HashMap<>();
		if(i>0){
			map.put("msg", "删除成功");
		}else{
			map.put("msg", "删除失败");
		}
		return map;
	}
	
	@RequestMapping("toAllocationPermission")
	public String toAllocationPermission(RoleVo roleVo,Model model) {
		model.addAttribute("roleId", roleVo.getId());
		return "system/role/allocationPermission";
	}
	
	@RequestMapping("loadRolePermission")
	@ResponseBody
	public List<TreeNode> loadRolePermission(RoleVo roleVo) {
		List<TreeNode> nodes =new ArrayList<TreeNode>();
		PermissionVo permissionVo=new PermissionVo();
		permissionVo.setAvailable(SYS_Constast.MENU_AVAILABLE_YES);
		//查询出角色拥有的权限
		List<Permission> rolePermission = permissionService.queryPermissionByRoleId(permissionVo.getAvailable(), roleVo.getId());
		 List<Permission> allPermission = permissionService.queryAllPermissionForBoss(permissionVo);
		//遍历所有可用的权限将其中角色id查询所拥有的权限设置为默认选中状态
		 for (Permission pe1 : allPermission) {
				//初始全部都是不被选中
				boolean checked=false;
				//和每一个菜单做匹配，匹配上的设置为默认选中状态
				for (Permission pe2 : rolePermission) {
					if(pe1.getId()==pe2.getId()){
						checked=true;
						//有一个匹配得上就退出内层循环匹配下一个菜单
						break;
					}
				}
				//将是否可以打开的integer类型转换成boolean类型。方便zTree接受
				boolean open=pe1.getOpen()==SYS_Constast.TYPE_PUBLIC_ONE?true:false;
				Boolean isParent=false;//处理选择权限时  CURD的树不出来的问题
				//如果是菜单就全部设置成父节点,其他的都是权限都不是父节点
				if(pe1.getType().equals(SYS_Constast.PERMISSION_TYPE_MENU)) {
					isParent=true;
				}
				//将每一个菜单属性复制。方便zTree接受
				nodes.add(new TreeNode(pe1.getId(), pe1.getPid(), pe1.getName(), open, isParent, checked));
		 }
		return nodes;
	}
	
	@RequestMapping("saveRolePermission")
	@ResponseBody
	public Map<String, Object> saveRolePermission(RoleVo roleVo) {
		Map<String, Object> map = new HashMap<>();
		int i = roleService.saveRolePermission(roleVo);
		if(i>0){
			map.put("msg", "分配成功");
		}else{
			map.put("msg", "分配失败");
		}
		return map;
	}
}
