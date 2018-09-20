package cn.sxt.bus.utils;
/**
 * 专门处理页面传过来的json数据
 * 
 * @author Administrator
 *
 */
public class JsonIdDispose {
	/**
	 * 处理页面传过来的json字符串包含的是id的集合
	 * @param jsonStr字符串包含的是id的集合
	 * @return
	 */
	public static Integer [] disposeJsonString(String jsonStr) {
		String substring = jsonStr.substring(1, jsonStr.length()-1);
		if(substring.contains(",")) {
			String[] idsStr = substring.split(",");
			 Integer []ids=new Integer[idsStr.length];
	 		 for (int i = 0; i < idsStr.length; i++) {
	 			ids[i]=Integer.valueOf(idsStr[i]);
			}
	 		 return ids;
		}else {
			 Integer []ids=new Integer[1];
			 ids[0]=Integer.valueOf(substring);
			 return ids;
		}
	}
	
	/**
	 * 去掉json字符串的双引号
	 * @return
	 */
	public static String removeTwoSymbol(String jsonStr) {
		return jsonStr.substring(1, jsonStr.length()-1);
	}
}
