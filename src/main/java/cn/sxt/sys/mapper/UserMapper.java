package cn.sxt.sys.mapper;

import java.util.List;

import cn.sxt.sys.domain.User;
import cn.sxt.sys.vo.UserVo;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
 	User queryUserByLoginName(String loginName);

	List<UserVo> queryAllUser(UserVo userVo);
}