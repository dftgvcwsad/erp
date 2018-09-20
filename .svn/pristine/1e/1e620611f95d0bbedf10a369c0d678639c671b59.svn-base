package cn.sxt.bus.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.sxt.bus.domain.Goods;
import cn.sxt.bus.domain.Inport;
import cn.sxt.bus.service.GoodsService;
import cn.sxt.bus.service.InportService;
import cn.sxt.bus.utils.DataGridView;
import cn.sxt.bus.vo.GoodsVo;
import cn.sxt.bus.vo.InportVo;
import cn.sxt.sys.domain.User;
import cn.sxt.bus.utils.JsonIdDispose;

@RequestMapping("inport")
@Controller
public class InportController {
	
	@Autowired
	private InportService inportService;
	
	@Autowired
	private GoodsService goodsService;
	
	@RequestMapping("toInportManager")
	public String toProviderManager() {
		return "busness/inport/inportManager";
	}
	
	@RequestMapping("toInportLeft")
	public String toInportLeft() {
		return "busness/inport/inportLeft";
	}
	
	@RequestMapping("toInportRight")
	public String toInportRight() {
		
		return "busness/inport/inportRight";
	}
	
	@RequestMapping("queryAllInport")
	@ResponseBody
	public DataGridView queryAllInport(InportVo inportVo) {
		DataGridView gridView = inportService.queryAllInport(inportVo);
		return gridView;
	}
	
	@RequestMapping("toAddInport")
	public String toAddInport(Model model) {
		return "busness/inport/addInport";
	}
	
	
	@RequestMapping("addInport")
	@ResponseBody
	public Map<String, Object> addInport(InportVo inportVo,HttpSession session) {
		Map<String, Object> map=new HashMap<>();
		User user = (User) session.getAttribute("loginUser");
		inportVo.setInporttime(new Date());
		inportVo.setOperateperson(user.getName());
		int i = inportService.addInport(inportVo);
		if(i>0){
			Goods oldGodds = goodsService.queryGoodsById(inportVo.getGoodsid());
			Integer number = oldGodds.getNumber();
			GoodsVo goodsVo=new GoodsVo();
			goodsVo.setId(oldGodds.getId());
			goodsVo.setNumber(number+inportVo.getNumber());
			int j = goodsService.updateGoods(goodsVo);
			if(j>0) {
				map.put("msg", "添加成功");
			}else {
				map.put("msg", "添加失败");
			}
		}else{
			map.put("msg", "添加失败");
		}
		return map;
	}
	
	@RequestMapping("toUpdateInport")
	public String toUpdateInport(InportVo inportVo,Model model) {
		Inport inport = inportService.queryInportById(inportVo.getId());
		model.addAttribute("inport", inport);
		return "busness/inport/updateInport";
	}
	
	@RequestMapping("updateInport")
	@ResponseBody
	public Map<String, Object> updateInport(InportVo inportVo,HttpSession session) {
		Map<String, Object> map=new HashMap<>();
		User user = (User) session.getAttribute("loginUser");
		inportVo.setInporttime(new Date());
		inportVo.setOperateperson(user.getName());
		int i = inportService.updateInport(inportVo);
		if(i>0){
			Goods oldGodds = goodsService.queryGoodsById(inportVo.getGoodsid());
			Integer number = oldGodds.getNumber();
			GoodsVo goodsVo=new GoodsVo();
			goodsVo.setId(oldGodds.getId());
			goodsVo.setNumber(number+inportVo.getNumber()-inportVo.getOldumber());
			int j = goodsService.updateGoods(goodsVo);
			if(j>0) {
				map.put("msg", "修改成功");
			}else {
				map.put("msg", "修改失败");
			}
		}else{
			map.put("msg", "修改失败");
		}
		return map;
	}
	
	@RequestMapping("deleteInport")
	@ResponseBody
	public Map<String, Object> deleteInport(InportVo inportVo) {
		Inport inport = inportService.queryInportById(inportVo.getId());
		Integer inportNumber=inport.getNumber();
		Goods oldGodds = goodsService.queryGoodsById(inport.getGoodsid());
		Integer number = oldGodds.getNumber();
		GoodsVo goodsVo=new GoodsVo();
		goodsVo.setId(oldGodds.getId());
		goodsVo.setNumber(number-inportNumber);
		int i = goodsService.updateGoods(goodsVo);
		Map<String, Object> map=new HashMap<>();
		if(i>0){
			int j = inportService.deleteInport(inportVo.getId());
			if(j>0) {
				map.put("msg", "删除成功");
			}else {
				map.put("msg", "删除失败");
			}
		}else{
			map.put("msg", "删除失败");
		}
		return map;
	}
	@RequestMapping("batchDeleteInport")
	@ResponseBody
	public Map<String, Object> batchDeleteInport(InportVo inportVo) {
		 Integer[] inportIds = JsonIdDispose.disposeJsonString(inportVo.getInportIds());
		for (Integer infoId : inportIds) {
			Inport inport = inportService.queryInportById(infoId);
			Integer inportNumber=inport.getNumber();
			Goods oldGodds = goodsService.queryGoodsById(inport.getGoodsid());
			Integer number = oldGodds.getNumber();
			GoodsVo goodsVo=new GoodsVo();
			goodsVo.setId(oldGodds.getId());
			goodsVo.setNumber(number-inportNumber);
			goodsService.updateGoods(goodsVo);
			inportService.deleteInport(infoId);
		}
		Map<String, Object> map=new HashMap<>();
			map.put("msg", "删除成功");
		return map;
	}
}
