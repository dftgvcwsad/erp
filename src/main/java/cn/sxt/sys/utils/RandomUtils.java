package cn.sxt.sys.utils;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

 //随机字符串工具
public class RandomUtils {

	 // 生成一个UUID
	public static String createRandomUUID() {
		return UUID.randomUUID().toString().replace("-", "").toUpperCase();
	}
	
	/*public static void main(String[] args) {
		List<String> list=new ArrayList<>();
		for (int i = 0;; i++) {
			String string = UUID.randomUUID().toString();
			if(list.contains(string)) {
				System.out.println(string);
				return;
			}
			list.add(string);
		}
	}*/
}
