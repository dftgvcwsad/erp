package cn.sxt.sys.utils;

import java.util.ArrayList;
import java.util.List;

public class TreeNodeBuiler {
	/**
	 * 目的将传过来的菜单集合变得有层次关系
	 * @param treeNodes
	 * @param rootId  传过来的根节点，根据根节点找到所有包扩根节点在内的菜单
	 * @return
	 */
	
	public static List<TreeNode> builer(List<TreeNode> treeNodes,Integer rootId){
		List<TreeNode> nodes=new ArrayList<>();
		//遍历传过来的菜单集合，根据传过的根节点得到有层次关系的菜单
		for (TreeNode treeNode1 : treeNodes) {
			//当当前对象是根节点
			if(treeNode1.getPid()==rootId){
				//添加根节点菜单
				nodes.add(treeNode1);
			}
			for (TreeNode treeNode2 : treeNodes) {
				//treeNode2的父节点是treeNode1
				if(treeNode2.getPid()==treeNode1.getId()){
					//将treeNode2添加到treeNode1的Children属性里去
					treeNode1.getChildren().add(treeNode2);
				}
			}
		}
		//获得一个有层次的菜单集合、、根节点和所有对应的子节点
		return nodes;
	}
}
