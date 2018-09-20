package cn.sxt.sys.controller;

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
import cn.sxt.sys.domain.User;
import cn.sxt.sys.service.UserService;
import cn.sxt.sys.utils.DataGridView;
import cn.sxt.sys.utils.JsonIdDispose;
import cn.sxt.sys.utils.Md5Uitls;
import cn.sxt.sys.utils.PinyinUtils;
import cn.sxt.sys.vo.UserVo;

@Controller
@RequestMapping("user")
public class userController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("toUserManager")
	public String toUserManager() {
		return "system/user/userManager";
	}
	
	@RequestMapping("toUserLeft")
	public String toUserLeft() {
		return "system/user/userLeft";
	}
	
	@RequestMapping("toUserRight")
	public String toUserRight() {
		return "system/user/userRight";
	}
	
	
	@RequestMapping("queryAllUser")
	@ResponseBody
	public DataGridView queryAllUser(UserVo userVo) {
		return userService.queryAllUser(userVo);
	}
	
	@RequestMapping("toAddUser")
	public String toAddUser() {
		return "system/user/addUser";
	}
	
	@RequestMapping("getUserBydeptId")
	@ResponseBody
	public List<UserVo> getUserBydeptId(UserVo userVo) {
		return userService.queryUserBydeptId(userVo);
	}
	
	@RequestMapping(path="getLoginnamePinyinByName",produces="text/html;charset=utf-8")
	@ResponseBody
	public String getLoginnamePinyinByName(UserVo userVo) {
		String pinYin = PinyinUtils.getPinYin(userVo.getName());
		return pinYin;
	}
	
	@RequestMapping("addUser")
	@ResponseBody
	public Map<String, Object> addUser(UserVo userVo) {
		Map<String, Object> map=new HashMap<>();
		userVo.setType(SYS_Constast.USER_TYPE_NORMAR);
		userVo.setImgpath(SYS_Constast.USER_DEFAULT_IMG);
		userVo.setPwd(Md5Uitls.encodePwdUseMd5(SYS_Constast.USER_PWD_DEFAULT, userVo.getSalt(), 2));
		int i = userService.addUser(userVo);
		if(i>0){
			map.put("msg", "添加成功");
		}else{
			map.put("msg", "添加失败");
		}
		return map;
	}
	
	@RequestMapping("toUpdateUser")
	public String toUpdateUser(UserVo userVo,Model model) {
		User user = userService.queryUserById(userVo.getId());
		if(user.getMgr()==null) {
			user.setMgr(-1);
		}
		model.addAttribute("user", user);
		return "system/user/updateUser";
	}
	
	@RequestMapping("queryUserById")
	@ResponseBody
	public User queryUserById(UserVo userVo) {
		return userService.queryUserById(userVo.getId());
	}
	
	@RequestMapping("updateUser")
	@ResponseBody
	public Map<String, Object> updateUser(UserVo userVo) {
		Map<String, Object> map=new HashMap<>();
		int i = userService.updateUser(userVo);
		if(i>0){
			map.put("msg", "修改成功");
		}else{
			map.put("msg", "修改失败");
		}
		return map;
	}
	
	@RequestMapping("resetUserPwd")
	@ResponseBody
	public Map<String, Object> resetUserPwd(UserVo userVo) {
		Map<String, Object> map=new HashMap<>();
		int i = userService.resetUserPwd(userVo);
		if(i>0){
			map.put("msg", "修改成功");
		}else{
			map.put("msg", "修改失败");
		}
		return map;
	}
	
	@RequestMapping("batchDeleteUser")
	@ResponseBody
	public Map<String, Object> batchDeleteUser(UserVo userVo) {
		 Integer[] userIds = JsonIdDispose.disposeJsonString(userVo.getUserIds());
		for (Integer userId : userIds) {
			userService.deleteUser(userId);
		}
		Map<String, Object> map=new HashMap<>();
			map.put("msg", "删除成功");
		return map;
	}
	
	@RequestMapping("deleteUser")
	@ResponseBody
	public Map<String, Object> deleteUser(UserVo userVo) {
		int i = userService.deleteUser(userVo.getId());
		Map<String, Object> map=new HashMap<>();
		if(i>0){
			map.put("msg", "删除成功");
		}else{
			map.put("msg", "删除失败");
		}
		return map;
	}
	
	@RequestMapping("toAllocationRole")
	public String toAllocationRole(UserVo userVo,Model model) {
		model.addAttribute("userVo", userVo);
		return "system/user/allocationRole";
	}
	
	@RequestMapping("queryUserAllRole")
	@ResponseBody
	public DataGridView queryUserAllRole(UserVo userVo) {
		return  	userService.queryUserAllRole(userVo);
	}
	
	@RequestMapping("saveUserRole")
	@ResponseBody
	public Map<String, Object> saveUserRole(UserVo userVo) {
		int i = userService.saveUserRole(userVo);
		Map<String, Object> map=new HashMap<>();
		if(i>0){
			map.put("msg", "保存成功");
		}else{
			map.put("msg", "保存失败");
		}
		return map;
	}
	
	@RequestMapping("toUserInfo")
	public String toUserInfo() {
		return "system/user/userInfo";
	}
	
	@RequestMapping("judgeUserPwd")
	@ResponseBody
	public Map<String, Object> judgeUserPwd(UserVo userVo) {
		Map<String, Object> map =new  HashMap<>();
		User user = userService.queryUserById(userVo.getId());
		String pwdY = user.getPwd();
		String pwdMd5 = Md5Uitls.encodePwdUseMd5(userVo.getPwd(), user.getSalt(), 2);
		if(pwdY.equals(pwdMd5)) {
			map.put("msg", 1);
		}else {
			map.put("msg", 0);
		}
		return map;
	}
	
	@RequestMapping("toChangePwd")
	public String toChangePwd() {
		return "system/user/changePwd";
	}
	
	@RequestMapping("changeUserPwd")
	@ResponseBody
	public Map<String, Object> changeUserPwd(UserVo userVo,HttpSession session) {
		User user = (User) session.getAttribute("loginUser");
		String oldPwd = userVo.getPwd();
		UserVo userVo2=new UserVo();
		userVo2.setId(user.getId());
		userVo2.setPwd(Md5Uitls.encodePwdUseMd5(oldPwd, user.getSalt(), 2));
		int i = userService.updateUser(userVo2);
		Map<String, Object> map=new HashMap<>();
		if(i>0){
			map.put("msg", 1);
		}else{
			map.put("msg", 0);
		}
		return map;
	}
}
