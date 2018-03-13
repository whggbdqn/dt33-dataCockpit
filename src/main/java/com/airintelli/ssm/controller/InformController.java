/**
 * @author yanjun
 */
package com.airintelli.ssm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.airintelli.ssm.pojo.Inform;
import com.airintelli.ssm.pojo.PageBean;
import com.airintelli.ssm.pojo.QueryCondition;
import com.airintelli.ssm.service.impl.InformServiceImpl;

@Controller
@RequestMapping("/noticeInfo")
public class InformController {
	@Autowired
	private InformServiceImpl informServiceImpl;
	//分页查询
	  @RequestMapping("page")
	  public String  page (PageBean pagebean,QueryCondition querycondition,HttpServletRequest req) throws Exception{
	    	Integer  pagesize=10;
	    	
	    	pagebean.setQuerycondition(querycondition);
	    	if(pagebean.getPageSize()!=null)
	    	{
	    	
	    	}
	    	else{
	    		pagebean.setPageSize(pagesize);
	    		
	    	}
	  	if(pagebean.getIndex()==null){
	  		pagebean.setIndex(1);
	  		pagebean.setPageRowes(0);
	  	}
	  	else{
	  		
	  		pagebean.setPageRowes((pagebean.getIndex()-1)*pagebean.getPageSize());
	  		
	  	}
	  	pagebean.setTotalCount(informServiceImpl.getCount(pagebean)); 
	  	Integer  totalCount=pagebean.getTotalCount(); 
	  	   double tc=totalCount;
	 		Double num=Math.ceil(tc/pagebean.getPageSize());
	 		pagebean.setTotalPage(num.intValue());
	 		if(tc==0){
	 		    pagebean.setTotalPage(1);
	 		}
	 	 List<Inform> list=informServiceImpl.showInform(pagebean);
	 	 pagebean.setList(list);
	 	 req.getSession().setAttribute("page", pagebean);
	 	 
	 	 //回显记录数
	 	 Integer[] size={1,5,10};
	    req.getSession().setAttribute("size",size );	
	  	return "/sysadmin_board_jsp/notice_list";
	  }
	  
	  //获取点击编辑对象的值,将值传入model中
	  @RequestMapping("/editNoticeShow")
	  public String  editNoticeShow(Inform inform,Model model){
		  Inform noticeInfo = informServiceImpl.selectById(inform.getId());
		  model.addAttribute("noticeInfo", noticeInfo);
		  return"/sysadmin_board_jsp/edit_notice";
	  }
	  //修改通知
	  @RequestMapping("/updateNoticeInfo")
	  public String updateNoticeInfo(Inform inform){
		  informServiceImpl.updateInform(inform);
		  return"redirect:/noticeInfo/page.action";
	  }
	  //删除通知
	  @RequestMapping("/delNotice")
	  public String delNotice(Inform inform){
		  informServiceImpl.deleteInform(inform);
		  return"redirect:/noticeInfo/page.action";
	  }
	  //添加通知
	  @RequestMapping("/addNotice")
	  public String addNotice(Inform inform){
		  informServiceImpl.addInform(inform);
		  return"redirect:/noticeInfo/page.action";
	  }
	  //通知详情
	  @RequestMapping("showNotice")
	  public String showNotice(Integer id,Model model){
		  Inform inform= informServiceImpl.selectById(id);
		  model.addAttribute("inform", inform);
		  return "/sysadmin_board_jsp/show_notice";
	  }
}
