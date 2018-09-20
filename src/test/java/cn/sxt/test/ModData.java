package cn.sxt.test;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.sxt.sys.constast.SYS_Constast;
import cn.sxt.sys.domain.User;
import cn.sxt.sys.service.UserService;
import cn.sxt.sys.utils.Md5Uitls;
import cn.sxt.sys.utils.RandomUtils;
import cn.sxt.sys.vo.UserVo;

public class ModData {

	public static void main(String[] args) {
		/*ApplicationContext context=new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
		UserService userService = context.getBean(UserService.class);
		User user = userService.queryUserById(1);
			String salt=RandomUtils.createRandomUUID();
			user.setSalt(salt);
			user.setPwd(Md5Uitls.encodePwdUseMd5(SYS_Constast.USER_PWD_DEFAULT, salt, 2));
			UserVo userVoNew=new UserVo();
			BeanUtils.copyProperties(user, userVoNew);
			userService.updateUser(userVoNew);*/
	}
}
