package cn.sxt.sys.constast;

public interface SYS_Constast {
	//登录用户类型
	public static final Integer USER_TYPE_SUPER=0;
	public static final Integer USER_TYPE_NORMAR=1;
	//菜单数据是否可用
	public static final Integer MENU_AVAILABLE_YES=1;
	public static final Integer MENU_AVAILABLE_NO=0;
	//公用的类型（代替大部分属性常量）
	public static final Integer TYPE_PUBLIC_ZERO=0;
	public static final Integer TYPE_PUBLIC_ONE=1;
	public static final Integer TYPE_PUBLIC_TOW=2;
	
	//请假单的状态
	public static final Integer TYPE_LEAVEBILL_STATE_ZERO=0;//未提交
	public static final Integer TYPE_LEAVEBILL_STATE_ONE=1;//提交审批中
	public static final Integer TYPE_LEAVEBILL_STATE_TOW=2;//审批完成
	public static final Integer TYPE_LEAVEBILL_STATE_THREE=3;//放弃流程
	
	//默认密码
	public static final String USER_PWD_DEFAULT="123456";
	
	//权限类型
	public static final String PERMISSION_TYPE_MENU="menu";
	public static final String PERMISSION_TYPE_PERMISSION="permission";

	//用户默认头像
	public static final String USER_DEFAULT_IMG="resources/images/defaulttitle.jpg";
}
