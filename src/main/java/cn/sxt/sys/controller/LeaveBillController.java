package cn.sxt.sys.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.sxt.sys.constast.SYS_Constast;
import cn.sxt.sys.domain.LeaveBill;
import cn.sxt.sys.domain.User;
import cn.sxt.sys.service.LeaveBillService;
import cn.sxt.sys.utils.DataGridView;
import cn.sxt.sys.vo.LeaveBillVo;

@Controller
@RequestMapping("leaveBill")
public class LeaveBillController {

	@Autowired
	private LeaveBillService leaveBillService;
	
	@RequestMapping("toLeaveBillManager")
	public String toLeaveBillManager() {
		return "system/leaveBill/leaveBillManager";
	}
	
	@RequestMapping("queryAllLeaveBill")
	@ResponseBody
	public DataGridView queryAllLeaveBill(LeaveBillVo leaveBillVo,HttpSession session) {
		User user = (User) session.getAttribute("loginUser");
		if(user.getType()==SYS_Constast.USER_TYPE_SUPER) {
			return leaveBillService.queryAllLeaveBill(leaveBillVo);
		}else {
			leaveBillVo.setUserid(user.getId());
			return leaveBillService.queryAllLeaveBill(leaveBillVo);
		}
	}
	
	@RequestMapping("toAddLeaveBill")
	public String toAddLeaveBill() {
		return "system/leaveBill/addLeaveBill";
	}
	
	@RequestMapping("addLeaveBill")
	@ResponseBody
	public Map<String, Object> addLeaveBill(LeaveBillVo leaveBillVo,HttpSession session) {
		Map<String, Object> map=new HashMap<>();
		User user = (User) session.getAttribute("loginUser");
		leaveBillVo.setUserid(user.getId());
		leaveBillVo.setLeavetime(new Date());
		int i = leaveBillService.addLeaveBill(leaveBillVo);
		if(i>0){
			map.put("msg", "添加成功");
		}else{
			map.put("msg", "添加失败");
		}
		return map;
	}
	
	@RequestMapping("toUpdateLeaveBill")
	public String toUpdateLeaveBill(LeaveBillVo leaveBillVo,Model model) {
		LeaveBill leaveBill = leaveBillService.queryLeaveBillById(leaveBillVo.getId());
		model.addAttribute("leaveBill", leaveBill);
		return "system/leaveBill/updateLeaveBill";
	}
	
	@RequestMapping("updateLeaveBill")
	@ResponseBody
	public Map<String, Object> updateLeaveBill(LeaveBillVo leaveBillVo) {
		Map<String, Object> map=new HashMap<>();
		int i = leaveBillService.updateLeaveBill(leaveBillVo);
		if(i>0){
			map.put("msg", "修改成功");
		}else{
			map.put("msg", "修改失败");
		}
		return map;
	}
	
	@RequestMapping("deleteLeaveBill")
	@ResponseBody
	public Map<String, Object> deleteLeaveBill(LeaveBillVo leaveBillVo) {
		int i = leaveBillService.deleteLeaveBill(leaveBillVo.getId());
		Map<String, Object> map=new HashMap<>();
		if(i>0){
			map.put("msg", "删除成功");
		}else{
			map.put("msg", "删除失败");
		}
		return map;
	}
	
}
