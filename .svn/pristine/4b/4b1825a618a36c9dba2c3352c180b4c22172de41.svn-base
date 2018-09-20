package cn.sxt.sys.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.sxt.sys.service.LogInfoService;
import cn.sxt.sys.utils.DataGridView;
import cn.sxt.sys.utils.JsonIdDispose;
import cn.sxt.sys.vo.LogInfoVo;

@Controller
@RequestMapping("logInfo")
public class LogInfoController {
	@Autowired
	private LogInfoService logInfoService;

	@RequestMapping("toLogInfoManager")
	public String toLogInfoManager() {
		return "system/login/logInfoManager";
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String exitLogin(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
				+ "/";
		return "redirect:" + basePath;
	}

	@RequestMapping("queryAllLogInfo")
	@ResponseBody
	public DataGridView queryAllLogInfo(LogInfoVo infoVo) {
		return logInfoService.queryAllLogInfo(infoVo);
	}

	@RequestMapping("deleteLogInfo")
	@ResponseBody
	public Map<String, Object> deleteLogInfo(LogInfoVo infoVo) {
		int i = logInfoService.deleteLogInfo(infoVo.getId());
		Map<String, Object> map = new HashMap<>();
		if (i > 0) {
			map.put("msg", "删除成功");
		} else {
			map.put("msg", "删除失败");
		}
		return map;
	}

	@RequestMapping("batchDeleteLogInfo")
	@ResponseBody
	public Map<String, Object> batchDeleteLogInfo(LogInfoVo infoVo) {
		Integer[] logInfoIds = JsonIdDispose.disposeJsonString(infoVo.getLogInfoIds());
		for (Integer infoId : logInfoIds) {
			logInfoService.deleteLogInfo(infoId);
		}
		Map<String, Object> map = new HashMap<>();
		map.put("msg", "删除成功");
		return map;
	}

}
