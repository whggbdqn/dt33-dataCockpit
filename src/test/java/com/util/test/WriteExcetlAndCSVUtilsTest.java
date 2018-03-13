/**
 * 
 */
package com.util.test;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Before;
import org.junit.Test;

import com.airintelli.ssm.pojo.Inform;
import com.airintelli.ssm.utils.WriteExcetlAndCSVUtils;

/**
 * @author xp
 *
 */
public class WriteExcetlAndCSVUtilsTest {

	/**
	 * @throws java.lang.Exception
	 */
	@Before
	public void setUp() throws Exception {
	}

	/**
	 * Test method for
	 * {@link com.airintelli.ssm.utils.WriteExcetlAndCSVUtils#exportDataFile(java.lang.String, java.lang.String, java.util.List, java.lang.String)}
	 * .
	 * @throws Exception 
	 */
	@Test
	public void testExportDataFile() throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String fileName = "F:/MySQL/MySQL/11.xls";
		String fileName1 = "F:/MySQL/MySQL/22.xls";
		String csvFileName = "F:/MySQL/MySQL/csv2.csv";

		Inform inform = new Inform();
		inform.setId(1);
		inform.setTitle("这是标题一");
		inform.setPublishdate(new Date());
		inform.setPublisher("标题一");
		inform.setDetails("标题一中什么也没有");

		Inform inform1 = new Inform();
		inform1.setId(1);
		inform1.setTitle("这是标题一");
		inform1.setPublishdate(new Date());
		inform1.setPublisher("标题一");
		inform1.setDetails("标题一中什么也没有");

		List<Inform> list1 = new ArrayList<>();
		list1.add(inform1);
		list1.add(inform);
		List<String[]> listStrs = new ArrayList<>();

		for (Inform in : list1) {
			String[] strs = new String[] { in.getId().toString(), in.getTitle().toString(),
					sdf.format(in.getPublishdate()) + "\t", in.getDetails(), in.getPublisher() };
			listStrs.add(strs);
		}
		WriteExcetlAndCSVUtils.exportDataFile("csv",csvFileName, listStrs,"标题列表");
		System.exit(0);
	}

}
