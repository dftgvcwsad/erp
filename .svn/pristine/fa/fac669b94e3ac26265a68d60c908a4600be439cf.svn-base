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
import cn.sxt.bus.domain.Outport;
import cn.sxt.bus.service.GoodsService;
import cn.sxt.bus.service.OutportService;
import cn.sxt.bus.utils.DataGridView;
import cn.sxt.bus.vo.GoodsVo;
import cn.sxt.bus.vo.OutportVo;
import cn.sxt.sys.domain.User;
import cn.sxt.bus.utils.JsonIdDispose;

@RequestMapping("outport")
@Controller
public class OutportController {
	
	@Autowired
	private OutportService outportService;
	
	@Autowired
	private GoodsService goodsService;
	
	@RequestMapping("toOutportManager")
	public String toProviderManager() {
		return "busness/outport/outportManager";
	}
	
	@RequestMapping("toOutportLeft")
	public String toOutportLeft() {
		return "busness/outport/outportLeft";
	}
	
	@RequestMapping("toOutportRight")
	public String toOutportRight() {
		
		return "busness/outport/outportRight";
	}
	
	@RequestMapping("queryAllOutport")
	@ResponseBody
	public DataGridView queryAllOutport(OutportVo outportVo) {
		DataGridView gridView = outportService.queryAllOutport(outportVo);
		return gridView;
	}
	
	@RequestMapping("toAddOutport")
	public String toAddOutport(Model model) {
		return "busness/outport/addOutport";
	}
	
	
	@RequestMapping("addOutport")
	@ResponseBody
	public Map<String, Object> addOutport(OutportVo outportVo,HttpSession session) {
		Map<String, Object> map=new HashMap<>();
		User user = (User) session.getAttribute("loginUser");
		outportVo.setOutporttime(new Date());
		outportVo.setOperateperson(user.getName());
		int i = outportService.addOutport(outportVo);
		if(i>0){
			Goods oldGodds = goodsService.queryGoodsById(outportVo.getGoodsid());
			Integer number = oldGodds.getNumber();
			GoodsVo goodsVo=new GoodsVo();
			goodsVo.setId(oldGodds.getId());
			goodsVo.setNumber(number-outportVo.getNumber());
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
	
	@RequestMapping("toUpdateOutport")
	public String toUpdateOutport(OutportVo outportVo,Model model) {
		Outport outport = outportService.queryOutportById(outportVo.getId());
		model.addAttribute("outport", outport);
		return "busness/outport/updateOutport";
	}
	
	@RequestMapping("updateOutport")
	@ResponseBody
	public Map<String, Object> updateOutport(OutportVo outportVo,HttpSession session) {
		Map<String, Object> map=new HashMap<>();
		User user = (User) session.getAttribute("loginUser");
		outportVo.setOutporttime(new Date());
		outportVo.setOperateperson(user.getName());
		int i = outportService.updateOutport(outportVo);
		if(i>0){
			Goods oldGodds = goodsService.queryGoodsById(outportVo.getGoodsid());
			Integer number = oldGodds.getNumber();
			GoodsVo goodsVo=new GoodsVo();
			goodsVo.setId(oldGodds.getId());
			goodsVo.setNumber(number-outportVo.getNumber()+outportVo.getOldumber());
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
	
	@RequestMapping("deleteOutport")
	@ResponseBody
	public Map<String, Object> deleteOutport(OutportVo outportVo) {
		Outport outport = outportService.queryOutportById(outportVo.getId());
		Integer outportNumber=outport.getNumber();
		Goods oldGodds = goodsService.queryGoodsById(outport.getGoodsid());
		Integer number = oldGodds.getNumber();
		GoodsVo goodsVo=new GoodsVo();
		goodsVo.setId(oldGodds.getId());
		goodsVo.setNumber(number+outportNumber);
		int i = goodsService.updateGoods(goodsVo);
		Map<String, Object> map=new HashMap<>();
		if(i>0){
			int j = outportService.deleteOutport(outportVo.getId());
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
	@RequestMapping("batchDeleteOutport")
	@ResponseBody
	public Map<String, Object> batchDeleteOutport(OutportVo outportVo) {
		 Integer[] outportIds = JsonIdDispose.disposeJsonString(outportVo.getOutportIds());
		for (Integer infoId : outportIds) {
			Outport outport = outportService.queryOutportById(infoId);
			Integer outportNumber=outport.getNumber();
			Goods oldGodds = goodsService.queryGoodsById(outport.getGoodsid());
			Integer number = oldGodds.getNumber();
			GoodsVo goodsVo=new GoodsVo();
			goodsVo.setId(oldGodds.getId());
			goodsVo.setNumber(number+outportNumber);
			goodsService.updateGoods(goodsVo);
			outportService.deleteOutport(infoId);
		}
		Map<String, Object> map=new HashMap<>();
			map.put("msg", "删除成功");
		return map;
	}
}
