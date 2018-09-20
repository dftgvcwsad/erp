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

import cn.sxt.sys.domain.Notice;
import cn.sxt.sys.domain.User;
import cn.sxt.sys.service.NoticeService;
import cn.sxt.sys.utils.DataGridView;
import cn.sxt.sys.utils.JsonIdDispose;
import cn.sxt.sys.vo.NoticeVo;

@Controller
@RequestMapping("notice")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("toDeskManager")
	public String toDeskManager() {
		return "system/main/deskManager";
	}
	
	@RequestMapping("toNoticeManager")
	public String toNoticeManager() {
		return "system/notice/noticeManager";
	}
	
	@RequestMapping("queryAllNotice")
	@ResponseBody
	public DataGridView queryAllNotice(NoticeVo infoVo) {
		return noticeService.queryAllNotice(infoVo);
	}
	
	@RequestMapping("toAddNotice")
	public String toAddNotice() {
		return "system/notice/addNotice";
	}
	
	@RequestMapping("addNotice")
	@ResponseBody
	public Map<String, Object> addNotice(NoticeVo noticeVo,HttpSession session) {
		Map<String, Object> map=new HashMap<>();
		User user = (User) session.getAttribute("loginUser");
		noticeVo.setOpername(user.getName());
		noticeVo.setCreatetime(new Date());
		int i = noticeService.addNotice(noticeVo);
		if(i>0){
			map.put("msg", "添加成功");
		}else{
			map.put("msg", "添加失败");
		}
		return map;
	}
	
	@RequestMapping("toUpdateNotice")
	public String toUpdateNotice(NoticeVo noticeVo,Model model) {
		Notice notice = noticeService.queryNoticeById(noticeVo.getId());
		model.addAttribute("notice", notice);
		return "system/notice/updateNotice";
	}
	
	@RequestMapping("updateNotice")
	@ResponseBody
	public Map<String, Object> updateNotice(NoticeVo noticeVo) {
		Map<String, Object> map=new HashMap<>();
		int i = noticeService.updateNotice(noticeVo);
		if(i>0){
			map.put("msg", "修改成功");
		}else{
			map.put("msg", "修改失败");
		}
		return map;
	}
	
	@RequestMapping("deleteNotice")
	@ResponseBody
	public Map<String, Object> deleteNotice(NoticeVo noticeVo) {
		int i = noticeService.deleteNotice(noticeVo.getId());
		Map<String, Object> map=new HashMap<>();
		if(i>0){
			map.put("msg", "删除成功");
		}else{
			map.put("msg", "删除失败");
		}
		return map;
	}
	@RequestMapping("batchDeleteNotice")
	@ResponseBody
	public Map<String, Object> batchDeleteNotice(NoticeVo noticeVo) {
		 Integer[] noticeIds = JsonIdDispose.disposeJsonString(noticeVo.getNoticeIds());
		for (Integer infoId : noticeIds) {
			noticeService.deleteNotice(infoId);
		}
		Map<String, Object> map=new HashMap<>();
			map.put("msg", "删除成功");
		return map;
	}
	
}
