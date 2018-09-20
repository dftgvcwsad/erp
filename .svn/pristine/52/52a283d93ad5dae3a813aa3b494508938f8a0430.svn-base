package cn.sxt.bus.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.sxt.bus.domain.Goods;
import cn.sxt.bus.domain.Provider;
import cn.sxt.bus.service.GoodsService;
import cn.sxt.bus.service.ProviderService;
import cn.sxt.bus.utils.DataGridView;
import cn.sxt.bus.utils.RandomUtil;
import cn.sxt.bus.vo.GoodsVo;
import cn.sxt.bus.vo.ProviderVo;
import cn.sxt.sys.constast.SYS_Constast;
import cn.sxt.bus.utils.JsonIdDispose;

@RequestMapping("goods")
@Controller
public class GoodsController {
	
	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private ProviderService providerService;
	
	@RequestMapping("toGoodsManager")
	public String toProviderManager() {
		return "busness/goods/goodsManager";
	}
	
	@RequestMapping("toGoodsLeft")
	public String toGoodsLeft() {
		return "busness/goods/goodsLeft";
	}
	
	@RequestMapping("toGoodsRight")
	public String toGoodsRight() {
		
		return "busness/goods/goodsRight";
	}
	
	@RequestMapping("getGoodsByProviderId")
	@ResponseBody
	public List<Goods> getGoodsByProviderId(GoodsVo goodsVo) {
		return goodsService.getGoodsByProviderId(goodsVo);
	}
	
	@RequestMapping("queryAllGoods")
	@ResponseBody
	public DataGridView queryAllGoods(GoodsVo goodsVo) {
		DataGridView gridView = goodsService.queryAllGoods(goodsVo);
		return gridView;
	}
	
	@RequestMapping("toAddGoods")
	public String toAddGoods(Model model) {
		ProviderVo providerVo=new ProviderVo(); 
		providerVo.setAvailable(SYS_Constast.MENU_AVAILABLE_YES);
		List<Provider> providerList = providerService.queryAllProviderForList(providerVo);
		model.addAttribute("providerList", providerList);
		return "busness/goods/addGoods";
	}
	
	@RequestMapping("deleteOldGoodsImg")
	@ResponseBody
	public void deleteOldGoodsImg(GoodsVo goodsVo,HttpSession session) {
		String oldUpdateimg = JsonIdDispose.removeTwoSymbol(goodsVo.getGoodsimg());
		String pathdele = session.getServletContext().getRealPath("");
		System.out.println("路径："+pathdele+"/"+oldUpdateimg);
		File file = new File(pathdele + "/" + oldUpdateimg);
		// 删除文件
		try {
			if(file.exists()){
				file.delete();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("updateGoodsImg")
	@ResponseBody
	public Map<String, Object> updateGoodsImg(MultipartFile fm, HttpSession session) {
		Map<String, Object> map=new HashMap<>();
		// 得到文件上传的保存路径
				String path = session.getServletContext().getRealPath("/upload/");
				// 得到老文件的名字
				String oldName = fm.getOriginalFilename();
				// 获得管理文件夹的名字
				String dirName = RandomUtil.getDirNameUseTime();
				// 判断管理文件夹是否已经创建了
				File dir = new File(path, dirName);
				if (!dir.exists()) {
					dir.mkdirs();// 创建管理文件夹
				}
				// 根据老名字生成新名字
				String newName = RandomUtil.createFileNewNameUseTime(oldName);
				// 组装文件 参数1：父文件夹的路径 ，参数2：文件保存的名字（新名字）
				File fileNew = new File(dir, newName);
				// 保存文件到file
				try {
					fm.transferTo(fileNew);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				map.put("path", "upload/" + dirName + "/" + newName);
				map.put("code", 0);
				return map;
	}
	
	@RequestMapping("addGoods")
	@ResponseBody
	public Map<String, Object> addGoods(GoodsVo goodsVo) {
		Map<String, Object> map=new HashMap<>();
		int i = goodsService.addGoods(goodsVo);
		if(i>0){
			map.put("msg", "添加成功");
		}else{
			map.put("msg", "添加失败");
		}
		return map;
	}
	
	@RequestMapping("toUpdateGoods")
	public String toUpdateGoods(GoodsVo goodsVo,Model model) {
		ProviderVo providerVo=new ProviderVo(); 
		providerVo.setAvailable(SYS_Constast.MENU_AVAILABLE_YES);
		List<Provider> providerList = providerService.queryAllProviderForList(providerVo);
		model.addAttribute("providerList", providerList);
		Goods goods = goodsService.queryGoodsById(goodsVo.getId());
		model.addAttribute("goods", goods);
		return "busness/goods/updateGoods";
	}
	
	@RequestMapping("updateGoods")
	@ResponseBody
	public Map<String, Object> updateGoods(GoodsVo goodsVo) {
		Map<String, Object> map=new HashMap<>();
		int i = goodsService.updateGoods(goodsVo);
		if(i>0){
			map.put("msg", "修改成功");
		}else{
			map.put("msg", "修改失败");
		}
		return map;
	}
	
	@RequestMapping("deleteGoods")
	@ResponseBody
	public Map<String, Object> deleteGoods(GoodsVo goodsVo) {
		int i = goodsService.deleteGoods(goodsVo.getId());
		Map<String, Object> map=new HashMap<>();
		if(i>0){
			map.put("msg", "删除成功");
		}else{
			map.put("msg", "删除失败");
		}
		return map;
	}
	@RequestMapping("batchDeleteGoods")
	@ResponseBody
	public Map<String, Object> batchDeleteGoods(GoodsVo goodsVo) {
		 Integer[] goodsIds = JsonIdDispose.disposeJsonString(goodsVo.getGoodsIds());
		for (Integer infoId : goodsIds) {
			goodsService.deleteGoods(infoId);
		}
		Map<String, Object> map=new HashMap<>();
			map.put("msg", "删除成功");
		return map;
	}
}
