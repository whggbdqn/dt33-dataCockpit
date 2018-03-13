package com.zengjia.test;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.airintelli.ssm.dao.TableColumninfoMapper;
import com.airintelli.ssm.dao.TempTableDao;
import com.airintelli.ssm.pojo.TableColumnInfo;
import com.airintelli.ssm.pojo.TempTablePagingData;
import com.airintelli.ssm.utils.MD5Utils;

public class Mytest {

    @Test
    public void test1() throws Exception {
	// 数据
	List<String[]> source = new ArrayList<String[]>();
	source.add(new String[] { "zengjia", "2011-2012", "5000000" });
	source.add(new String[] { "chenyan", "2011-2012", "3000000" });
	source.add(new String[] { "xiaopeng", "2011-2012", "4000000" });
	source.add(new String[] { "gaomingmei", "2011-2012", "6000000" });
	source.add(new String[] { "lixiao", "2011-2012", "4500000" });
	source.add(new String[] { "xiaoerge", "2011-2012", "7000000" });
	ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
	// List<TableColumnInfo> columns = new ArrayList<TableColumnInfo>();
	// columns.add(new TableColumnInfo())
	TempTableDao dao = context.getBean("tempTableDao", TempTableDao.class);
	TableColumninfoMapper mapper = context.getBean("tableColumninfoMapper", TableColumninfoMapper.class);
	List<TableColumnInfo> columns = mapper.selectColumnNames(1);
	String tableName = "xiaoshoubiao";
	dao.insert(source, tableName, columns);
    }

    @Test
    public void test2() throws Exception {
	ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
	TempTableDao dao = context.getBean("tempTableDao", TempTableDao.class);
	TempTablePagingData data = new TempTablePagingData();
	data.setPageNow(1);
	data.setTableName("xiaoshoubiao");
	data.setPageSize(20);
	TableColumninfoMapper mapper = context.getBean("tableColumninfoMapper", TableColumninfoMapper.class);
	List<TableColumnInfo> columns = mapper.selectColumnNames(1);
	dao.findByPage(data, columns);
	List<Map<String, Object>> result = data.getResult();
	for (Map<String, Object> map : result) {
	    System.out.print(map.get("xingming") + ",");
	    System.out.print(map.get("shijianqujian") + ",");
	    System.out.print(map.get("xiaoshoue"));
	    System.out.println();
	}
    }

    @Test
    public void test3() {
	MD5Utils md5 = new MD5Utils();
	System.out.println(md5.MD5("123456"));
    }
}
