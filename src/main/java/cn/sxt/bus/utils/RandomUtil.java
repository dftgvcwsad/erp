package cn.sxt.bus.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

public class RandomUtil {
	private static SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMddHHmmssSSS");
	private static SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
	private static SimpleDateFormat sdf3 = new SimpleDateFormat("yyyyMMdd_HHmmss_SSS");
	private static Random random = new Random();

	
	//使用时间+四位随机数获得新文件名
	

	public static String createFileNewNameUseTime(String oldName) {
		// 取出旧文件名的后缀名
		String suffix = oldName.substring(oldName.lastIndexOf("."), oldName.length());
		// 生成yyyyMMddHHmmssSSS时间字符串
		String time = sdf1.format(new Date());
		// 生成四位随机数
		Integer num = (random.nextInt(9000) + 1000);
		return time + num + suffix;
	}

	// 是用UUID生成新文件名
	public static String createFileNewNameUseUUID(String oldName) {
		// 取出旧文件名的后缀名
		String suffix = oldName.substring(oldName.lastIndexOf("."), oldName.length());
		// 生成UUID
		String uuid = UUID.randomUUID().toString().replaceAll("-", "");
		return uuid + suffix;
	}

	// 根据当前时间得到管理文件夹的名字
	public static String getDirNameUseTime() {
		return sdf2.format(new Date());
	}

	//使用时间+五位随机数获得新的出租单号ID
	public static String getPrefixRandom(String prefix) {
		return prefix+sdf3.format(new Date())+"_"+(random.nextInt(90000) + 10000);
	}
	
}
