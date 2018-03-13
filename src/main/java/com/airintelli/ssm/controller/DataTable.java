package com.airintelli.ssm.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.airintelli.ssm.dao.TempTableDao;
import com.airintelli.ssm.pojo.PageBean;
import com.airintelli.ssm.pojo.QueryCondition;
import com.airintelli.ssm.pojo.TableColumnInfo;
import com.airintelli.ssm.pojo.TableInfo;
import com.airintelli.ssm.pojo.TempTablePagingData;
import com.airintelli.ssm.service.DataRelationService;
import com.airintelli.ssm.service.TableColumnInfoService;
import com.airintelli.ssm.service.TableInfoService;
import com.google.gson.Gson;

@Controller
public class DataTable {
	@Autowired
	private TableInfoService tableInfoService;
	
	@Autowired
	private DataRelationService dataRelationService;
	
	@Autowired
	private TableColumnInfoService tableColumnInfoService;
	
	@Autowired
	private TempTableDao tempTableDao;
	//根据用户编号查数据关系表 
	@RequestMapping(value="cid_dataRelation")
	public String cid_dataRelation(TableInfo ti,HttpSession session) throws Exception{
		List<TableInfo> list = tableInfoService.selectByCid(ti);
		session.setAttribute("cdr",list);
		return "/sysboard_jsp/data_relation";
	}


	//分页查询
	  @RequestMapping("pages")
	  public String  page1 (String cid,PageBean pagebean,QueryCondition querycondition,HttpServletRequest req) throws Exception{
	    	Integer  pagesize=10;
	    	String firstCondition = cid;
	    	querycondition.setFirstcondition(firstCondition);
	    	querycondition.setSecondcondition("1");
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
	  	pagebean.setTotalCount(tableInfoService.getPageCount(pagebean)); 
	  	Integer  totalCount=pagebean.getTotalCount(); 
	  	   double tc=totalCount;
	 		Double num=Math.ceil(tc/pagebean.getPageSize());
	 		pagebean.setTotalPage(num.intValue());
	 		List<TableInfo> list=tableInfoService.getPage(pagebean);
	 	 pagebean.setList(list);
	 	 req.getSession().setAttribute("pages", pagebean);
	 	 
	 	 //回显记录数
	 	 Integer[] size={1,5,10};
	    req.getSession().setAttribute("size",size );	
	  	return "/sysboard_jsp/data_table";
	  }
	
	//根据表编号查询一张表的关联表
	@RequestMapping(value="tid_dataRelation")
	public String tid_dataRelation(Model model,Integer tid) throws Exception{
		//List<DataRelation> list = dataRelationService.selectByTid(tid);	
		List<TableInfo> list = dataRelationService.selectByTid(tid);
		model.addAttribute("tdr",list);
		//System.out.println(list.get(0).getName());
		return "/sysboard_jsp/data_relation";
	}
	
	//上传数据
	@RequestMapping("uploadexcel")
	public String uploadExcel(String cdr_id,MultipartFile myfile,HttpServletRequest req) throws Exception{
		//获得磁盘文件条目工厂  
        DiskFileItemFactory factory = new DiskFileItemFactory();  
		
		String filename = myfile.getOriginalFilename();
		//设置文件路径
		Calendar date = Calendar.getInstance();
		String year = date.get(Calendar.YEAR)+"";
		String month = date.get(Calendar.MONTH)+1+"";
		String day= date.get(Calendar.DATE)+"";
		String d = year+month+day;
		String path = req.getRealPath("/upload/"+d);
		//创建文件路径
		File uploadDir = new File(path);
		if(!uploadDir.exists()){
			uploadDir.mkdirs();
		}		
		//设置UUID文件名称
		String newfilename = UUID.randomUUID()+filename.substring(filename.lastIndexOf("."));
		//创建物理文件
		String newPath = path+"/"+newfilename;
		File file = new File(path + "/" + newfilename);
		myfile.transferTo(file);
		
		Integer tid = Integer.parseInt(cdr_id);
		
		//往数据库写入当前时间
		Date nowDate = new Date();
		TableInfo ti = new TableInfo();
		ti.setId(tid);
		ti.setUpdatetime(nowDate);
		tableInfoService.updateTableInfo(ti);
		
		tableInfoService.upload(newPath,tid);
		return "redirect:/pages.action?cid="+cdr_id;
	}
	
	//查看数据
	@RequestMapping("showdata")
	public String showData(TempTablePagingData data,Integer id,Model model,HttpSession session) throws Exception{
		//data.setPageNow(1);
		data.setPageSize(10);
		TempTablePagingData tempTablePagingData = tableInfoService.getTempTablePagingData(data, id);
		List<TableColumnInfo> list = tableColumnInfoService.selectTableColumnInfo(id);
		Gson gson = new Gson();
		String jsonStr = gson.toJson(tempTablePagingData.getResult());
		String colName = gson.toJson(list);
		session.setAttribute("tid", id);
		session.setAttribute("tableColumnName", list);
		session.setAttribute("p_colName", colName);
		session.setAttribute("jsonStr", jsonStr);
		session.setAttribute("id", id);
		session.setAttribute("data", tempTablePagingData);
		
		return "/sysboard_jsp/data_show";
	}
	
	//文件导出
	@RequestMapping(value="download",produces="application/octet-stream;charset=UTF-8")
	public ResponseEntity<byte[]> downLoad(Integer tid,String fileType,HttpServletRequest req) throws Exception{
		//设置文件路径
		Calendar date = Calendar.getInstance();
		String year = date.get(Calendar.YEAR)+"";
		String month = date.get(Calendar.MONTH)+1+"";
		String day= date.get(Calendar.DATE)+"";
		String d = year+month+day;
		String fileName = req.getRealPath("/download/"+d);
		//创建文件路径
		File uploadDir = new File(fileName);
		if(!uploadDir.exists()){
			uploadDir.mkdirs();
		}
		String tableName="123";
		fileName+="/"+UUID.randomUUID().toString();
		if(fileType.equals("xls")){
			fileName+=".xls";
		}else{
			fileName+=".csv";
		}
		tableInfoService.download(fileType, fileName, tableName, tid);
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		String name=fileName.substring(fileName.lastIndexOf("/")+1);
		headers.setContentDispositionFormData("attachment", name);
		File file=new File(fileName);
		ResponseEntity<byte[]> re = new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers,HttpStatus.CREATED);
		return re;
	  }
	}

