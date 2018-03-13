/**
 * @author yanjun
 */
package com.airintelli.ssm.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.airintelli.ssm.pojo.CompanyInfo;
import com.airintelli.ssm.pojo.DataRelation;
import com.airintelli.ssm.pojo.PageBean;
import com.airintelli.ssm.pojo.QueryCondition;
import com.airintelli.ssm.pojo.TableColumnInfo;
import com.airintelli.ssm.pojo.TableInfo;
import com.airintelli.ssm.pojo.TableRelationColumn;
import com.airintelli.ssm.pojo.TempTablePagingData;
import com.airintelli.ssm.service.CompanyInfoService;
import com.airintelli.ssm.service.DataRelationService;
import com.airintelli.ssm.service.TableColumnInfoService;
import com.airintelli.ssm.service.TableInfoService;
import com.airintelli.ssm.service.impl.DataRelationServiceImpl;
import com.google.gson.Gson;

@Controller
@RequestMapping("/tableInfo")
public class TableInfoController {
    @Autowired
    private TableInfoService tableInfoServiceImpl;
    @Autowired
    private CompanyInfoService companyInfoServiceImpl;
    // 数据表管理，数据表展示
    @Autowired
    private TableColumnInfoService tableColumnInfoServiceImpl;
    @Autowired
    private DataRelationService DataRelationServiceImpl;

    @RequestMapping("tablelist")
    public String tablelist() {
        return "/sysadmin_board_jsp/data_table";
    }

    // 分页查询
    @RequestMapping("page")
    public String page(PageBean pagebean, QueryCondition querycondition, HttpServletRequest req) throws Exception {
        Integer pagesize = 10;

        pagebean.setQuerycondition(querycondition);
        if (pagebean.getPageSize() != null) {

        } else {
            pagebean.setPageSize(pagesize);

        }
        if (pagebean.getIndex() == null) {
            pagebean.setIndex(1);
            pagebean.setPageRowes(0);
        } else {

            pagebean.setPageRowes((pagebean.getIndex() - 1) * pagebean.getPageSize());

        }
        pagebean.setTotalCount(tableInfoServiceImpl.getPageCount(pagebean));
        Integer totalCount = pagebean.getTotalCount();
        double tc = totalCount;
        Double num = Math.ceil(tc / pagebean.getPageSize());
        pagebean.setTotalPage(num.intValue());
        List<TableInfo> list = tableInfoServiceImpl.getPage(pagebean);
        pagebean.setList(list);
        req.getSession().setAttribute("page", pagebean);

        // 回显记录数
        Integer[] size = { 1, 5, 10 };
        req.getSession().setAttribute("size", size);

        return "/sysadmin_board_jsp/data_table";
    }

    // 根据公司的cid查询公司的数据表显示到data_table页面
    @RequestMapping("/showCompanyTable")
    public String showCompanyTable(Model model, TableInfo ti,HttpServletRequest request) {
        CompanyInfo cdt = companyInfoServiceImpl.selectById(ti.getCid());
        List<TableInfo> ctilist = tableInfoServiceImpl.selectByCid(ti);
        model.addAttribute("ctilist", ctilist);
        model.addAttribute("cdt", cdt);
        request.getSession().setAttribute("company", cdt);
        // return"redirect:/tableInfo/page.action";分页
        
        return "/sysadmin_board_jsp/data_table";
    }

    // 显示表头的信息
    @RequestMapping("/showEditTableHeader")
    public @ResponseBody List<TableColumnInfo> showEditTableHeader(Model model, Integer did) {
        List<TableColumnInfo> tcilist = tableColumnInfoServiceImpl.selectTableColumnInfo(did);
        return tcilist;
    }

    // 新增表头信息
    @RequestMapping("/addTableAndCell")
    public String addTableAndCell(TableInfo ti, String[] columnName, String[] columnType, Integer cid) {
        ti.setCid(cid);
       /* String name= ti.getName().replaceAll(" ", "");
        ti.setName(name);
        for(int i=1;i<columnName.length;i++){
        	columnName[i].replaceAll(" ", "");
        }*/
        tableInfoServiceImpl.addTableInfo(ti, columnName, columnType);
        return "redirect:/tableInfo/showCompanyTable.action?cid=" + cid;
    }
    
    @RequestMapping("/checkRelationName")
    @ResponseBody
    public boolean checkRelationName(DataRelation dr)throws Exception{
    	DataRelation relationlist  = DataRelationServiceImpl.selectByName(dr);
    	if(relationlist==null){
    	  return true;   	
    	}else{
		  return false;
		}
	}

    //通过添加的表名判断是否存在同名的表
    @RequestMapping("/checkAddTableName")
    @ResponseBody
    public boolean checkAddTableName(TableInfo ti)throws Exception{
    	System.out.println(ti.getName()+"sdddsds"+ti.getCid());
    	boolean OK =tableInfoServiceImpl.selectByTnameAndCid(ti);
    	System.out.println(OK);
    	if(OK){
			//表示没有查询到该表名，可以保存
			return true;
		}
		 return false;
    }
    
    
    //通过添加的表关系名判断是否存在同名的关系
    @RequestMapping("/checkTableReName")
    @ResponseBody
    public boolean checkTableReName(DataRelation datarelation)throws Exception{    	
    	DataRelation dr = DataRelationServiceImpl.selectByName(datarelation);
    	if(dr==null){
			//表示没有查询到该表名，可以保存
			return true;
		}
		  return false;
    }
    
    //查看两个关系表是否存在状态为启动的表关系
    
    @RequestMapping("/checkTableReState")
    @ResponseBody
    public boolean checkTableReState(DataRelation datarelation)throws Exception{    	
    	List<DataRelation> dr = DataRelationServiceImpl.selectByCidState(datarelation);
    	if(dr==null){
			//表示没有此两个表关系为启用状态的
			return true;
		}
		  return false;
    }
    // 修改表头的信息
    @RequestMapping("/changeTableColumn")
    public String changeTableColumn(String columnName, String tcid, String cid) {
    	/*columnName = columnName.replaceAll(" ", "");
    	tcid = tcid.replaceAll(" ", "");
    	cid = cid.replaceAll(" ", "");*/
        tableColumnInfoServiceImpl.updateTableColumnInfo(columnName, tcid);
        return "redirect:/tableInfo/showCompanyTable.action?cid=" + cid;
    }

    // 显示用户倒入的数据表的具体信息
    @RequestMapping("/showTableCompanyInfo")
    public String showTableCompanyInfo(Model model, Integer tid, TempTablePagingData data) throws Exception {
        TempTablePagingData ttpd = tableInfoServiceImpl.getTempTablePagingData(data, tid);
        return "";
    }

    // 改变表格的状态
    @RequestMapping("/tableInfoStateChange")
    public String tableInfoStateChange(TableInfo ti) {
        tableInfoServiceImpl.updateTableInfo(ti);
        TableInfo ti2 = tableInfoServiceImpl.selectById(ti);
        Integer cid = ti2.getCid();
        return "redirect:/tableInfo/showCompanyTable.action?cid=" + cid;
    }

    // 新增表数据关系
    @RequestMapping("/bluidNewTableRelation")
    public String bluidNewTableRelation(DataRelation dataRelation, Integer cid, Model model) {
/*        System.out.println(dataRelation.getName() + dataRelation.getCid() + dataRelation.getCol1()
                + dataRelation.getCol2() + dataRelation.getTid1() + dataRelation.getTid2());*/
        DataRelationServiceImpl.addDataRelation(dataRelation);
        return "redirect:/tableInfo/showTableRelation.action?cid=" + cid;
    }

    // 数据关系管理页面显示所需要的所有数据
    @RequestMapping("showTableRelation")
    public String tableRelationManage(Integer cid, Model model, TableInfo ti) {
        List<TableRelationColumn> tableRelationColumnlist = DataRelationServiceImpl.selectByCid(cid);
        model.addAttribute("tableRelationColumnlist", tableRelationColumnlist);
        // 获取所有该公司的表的集合
        List<TableInfo> tinfoCidlist = new ArrayList<TableInfo>();
        tinfoCidlist = tableInfoServiceImpl.selectByCid(ti);
        model.addAttribute("tinfoCidlist", tinfoCidlist);
        return "/sysadmin_board_jsp/data_relation_manage";
    }

    // 建立两个表之间的关系中显示表的具体字段
    @RequestMapping("/getColumnByid")
    public @ResponseBody List<TableColumnInfo> getColumnByid(Integer did) throws Exception {
        List<TableColumnInfo> tableClist = tableColumnInfoServiceImpl.selectTableColumnInfo(did);
        // 转换为json格式的字符串
        return tableClist;
    }
    //数据表关系状态（0，1）改变
    @RequestMapping("/dataRelationStateChange")
    public String dataRelationStateChange(DataRelation dataRelation, TableInfo ti) {
        DataRelationServiceImpl.updateDataRelation(dataRelation);
        return "redirect:/tableInfo/showTableRelation.action?cid=" + dataRelation.getCid();
    }

    // 分析任务管理
    @RequestMapping("tableAnalysisManage")
    public String tableAnalysisManage() {
        return "/sysadmin_board_jsp/data_Analysis_manage";
    }

    // 分析任务列表
    @RequestMapping("tableAnalysisList")
    public String tableAnalysisList() {
        return "/sysadmin_board_jsp/data_Analysis_list";
    }
}