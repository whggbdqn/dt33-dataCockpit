package com.airintelli.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.airintelli.ssm.dao.InformMapper;
import com.airintelli.ssm.pojo.Inform;
import com.airintelli.ssm.pojo.PageBean;
import com.airintelli.ssm.service.InformService;

@Service
public class InformServiceImpl implements InformService {
	@Autowired
	private InformMapper informMapper;

	// 添加通知
	@Override
	public void addInform(Inform info) {
		informMapper.insertSelective(info);
	}

	// 删除通知
	@Override
	public void deleteInform(Inform info) {
		informMapper.deleteByPrimaryKey(info.getId());

	}

	// 通过主键查询
	@Override
	public Inform selectById(Integer id) {

		return informMapper.selectByPrimaryKey(id);
	}

	// 倒序查询分页
	@Override
	public List<Inform> showInform(PageBean pagebean) {

		return informMapper.getpage(pagebean);
	}

	// 修改通知
	@Override
	public void updateInform(Inform info) {

		informMapper.updateByPrimaryKeySelective(info);
	}
	//获得总页数
	@Override
	public Integer getCount(PageBean pagebean) {
		
		return informMapper.pagecount(pagebean);
	}
	
}
