package cn.sxt.sys.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.sxt.sys.domain.User;
import cn.sxt.sys.service.LogInfoService;
import cn.sxt.sys.utils.ActiverUser;
import cn.sxt.sys.vo.LogInfoVo;
import cn.sxt.sys.vo.UserVo;

@Controller
@RequestMapping("login")
public class LoginController {
	
	@Autowired
	private LogInfoService logInfoService;
	
	@RequestMapping("toLogin")
	public String toLogin() {
		return "system/main/login";
	}
	
	@RequestMapping("login")
	public String login(HttpServletRequest request,UserVo userVo,Model model) {
		UsernamePasswordToken token = new UsernamePasswordToken(userVo.getLoginname(), userVo.getPwd());
		Subject subject = SecurityUtils.getSubject();
		try {  
	        subject.login(token);  
	        if (subject.isAuthenticated()) {  
	        	ActiverUser activerUser = (ActiverUser) subject.getPrincipal();//subject.getPrincipal();类型就是new SimpleAuthenticationInfo(user
	        	User loginUser = activerUser.getCunuser();
	        	request.getSession().setAttribute("loginUser",loginUser );
	        	// 记录每次登录，登录日志
				LogInfoVo infoVo = new LogInfoVo();
				infoVo.setLoginname(loginUser.getName() + "-" + loginUser.getLoginname());
				// request.getRemoteAddr()得到客户端的IP地址
				infoVo.setLoginip(request.getRemoteAddr());
				infoVo.setLogintime(new Date());
				logInfoService.addLogInfo(infoVo);
	            return "system/main/index";  
	        }
	    } catch (IncorrectCredentialsException e) {  
	        model.addAttribute("error", "密码错误");  
	    } catch (UnknownAccountException e) {  
	        model.addAttribute("error", "帐号不存在");  
	    }
		
		return "system/main/login";
	}
	
	
}
