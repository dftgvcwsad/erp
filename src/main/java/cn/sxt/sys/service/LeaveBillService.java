package cn.sxt.sys.service;

import cn.sxt.sys.domain.LeaveBill;
import cn.sxt.sys.utils.DataGridView;
import cn.sxt.sys.vo.LeaveBillVo;

public interface LeaveBillService {

	DataGridView queryAllLeaveBill(LeaveBillVo leaveBillVo);

	int addLeaveBill(LeaveBillVo leaveBillVo);
	
	LeaveBill queryLeaveBillById(Integer id);

	int updateLeaveBill(LeaveBillVo leaveBillVo);

	int deleteLeaveBill(Integer leaveBillId);
}
