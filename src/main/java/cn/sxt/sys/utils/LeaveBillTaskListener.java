package cn.sxt.sys.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.activiti.engine.delegate.DelegateTask;
import org.activiti.engine.delegate.TaskListener;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;

import cn.sxt.sys.domain.User;
import cn.sxt.sys.service.UserService;

public class LeaveBillTaskListener implements TaskListener{
	
	private static final long serialVersionUID = 1L;

	@Override
	public void notify(DelegateTask delegateTask) {
		// 1,当前这个对象没有被spring管理 如何得到 在这里面得到request
		ServletRequestAttributes requestAttributes=(ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
		HttpServletRequest request = requestAttributes.getRequest();
		// 2,得到session
		HttpSession session = request.getSession();
		// 3,得到当前用户
		User user = (User) session.getAttribute("loginUser");
		//4,取到领导的ID
		Integer mgr=user.getMgr();
		//5,根据IOC容器
		WebApplicationContext ctx =WebApplicationContextUtils.getWebApplicationContext(request.getServletContext());
		//6，获得userService+
		UserService userService = ctx.getBean(UserService.class);
		//7,根据领导的ID去查询领导的信息
		User leaderUser = userService.queryUserById(mgr);
		//8，设置任务办理人
		delegateTask.setAssignee(leaderUser.getName());
		
		
	}

}
