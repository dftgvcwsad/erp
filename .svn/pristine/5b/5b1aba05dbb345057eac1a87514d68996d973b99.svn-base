package cn.sxt.sys.utils;

import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;
/**
 * 用于实现菜单树所需要的json对象
 * @author Administrator
 *
 */
public class TreeNode {
	/**
	 * 创造出zTree所需要json对象
	 * @param id 节点编号
	 * @param pid 父节点编号
	 * @param name 	节点名称
	 * @param open	是否可以打开
	 * @param icon 节点图标
	 * @param checked zTree所需要的被选中状态
	 * @param isParent 是否是父节点
	 * @param href 地址
	 * @param target tagrgt
	 * @param title 标题
	 * @param spread 是否展开  ----是否可以打开
	 */
	private Integer id;
	@JsonProperty("pId")
	private Integer pid;
	private String title;
	private String name;
	private String icon;
	private String href;
	private Boolean spread;
	private Boolean open;
	private Boolean isParent;
	private String target;
	private Boolean checked;
	
	private List<TreeNode> children=new ArrayList<>();
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public String getHref() {
		return href;
	}
	public void setHref(String href) {
		this.href = href;
	}
	public Boolean getSpread() {
		return spread;
	}
	public void setSpread(Boolean spread) {
		this.spread = spread;
	}
	
	public Boolean getIsParent() {
		return isParent;
	}
	public void setIsParent(Boolean isParent) {
		this.isParent = isParent;
	}
	
	public Boolean getOpen() {
		return open;
	}
	public void setOpen(Boolean open) {
		this.open = open;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public List<TreeNode> getChildren() {
		return children;
	}
	public void setChildren(List<TreeNode> children) {
		this.children = children;
	}
	
	public Boolean getChecked() {
		return checked;
	}
	public void setChecked(Boolean checked) {
		this.checked = checked;
	}
	public TreeNode() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	//生成可选树的结构
	public TreeNode(Integer id, Integer pid, String name, Boolean open, Boolean isParent, Boolean checked) {
		super();
		this.id = id;
		this.pid = pid;
		this.name = name;
		this.open = open;
		this.isParent = isParent;
		this.checked = checked;
	}
	public TreeNode(Integer id, Integer pid, String title, String icon, String href, Boolean spread, String target) {
		super();
		this.id = id;
		this.pid = pid;
		this.title = title;
		this.icon = icon;
		this.href = href;
		this.spread = spread;
		this.target = target;
	}
	//用于生成普通树的结构
	public TreeNode(Integer id, Integer pid, String name, Boolean open, Boolean isParent) {
		super();
		this.id = id;
		this.pid = pid;
		this.name = name;
		this.open = open;
		this.isParent = isParent;
	}
	
}
