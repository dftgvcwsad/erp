package cn.sxt.sys.vo;

public class WorkFlowVo {
	
	private String deploymentName;
	private String deploymentId;
	//请假单id
	private Integer id;
	//任务ID
	private String taskId;
	//链接名称
	private String outcom;
	//批注信息
	private String comment;
	
	private Integer page;//第几页
	private Integer limit;//每页几条数据
	
	
	public String getOutcom() {
		return outcom;
	}
	public void setOutcom(String outcom) {
		this.outcom = outcom;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getTaskId() {
		return taskId;
	}
	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getDeploymentId() {
		return deploymentId;
	}
	public void setDeploymentId(String deploymentId) {
		this.deploymentId = deploymentId;
	}
	public String getDeploymentName() {
		return deploymentName;
	}
	public void setDeploymentName(String deploymentName) {
		this.deploymentName = deploymentName;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getLimit() {
		return limit;
	}
	public void setLimit(Integer limit) {
		this.limit = limit;
	}
	
}
