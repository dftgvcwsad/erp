package cn.sxt.test;

import cn.sxt.sys.utils.PinyinUtils;

public class Test {
	public static void main(String[] args) {
		String pinYin = PinyinUtils.getPinYin("我不好");
		System.out.println(pinYin);
	}
}
