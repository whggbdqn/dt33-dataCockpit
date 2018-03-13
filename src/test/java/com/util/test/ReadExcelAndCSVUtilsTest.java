/**
 * 
 */
package com.util.test;

import static org.junit.Assert.*;

import java.util.Arrays;

import org.junit.Before;
import org.junit.Test;

import com.airintelli.ssm.utils.ReadExcelAndCSVUtils;

/**
 * @author xp
 *
 */
public class ReadExcelAndCSVUtilsTest {

	/**
	 * @throws java.lang.Exception
	 */
	@Before
	public void setUp() throws Exception {
	}

	/**
	 * Test method for
	 * {@link com.airintelli.ssm.utils.ReadExcelAndCSVUtils#getUploadFileContent(java.lang.String)}
	 * .
	 * @throws Exception 
	 */
	@Test
	public void testGetUploadFileContent() throws Exception {
		// System.out.println(isFileType("sdfs.xls"));
		String fileName1 = "F:/MySQL/MySQL/22.xls";
		String fileName = "F:/MySQL/MySQL/csv1.csv";
		String characterName = ReadExcelAndCSVUtils.codeString(fileName);
		System.out.println(characterName);
		// System.out.println(Arrays.toString(getExcelTitle(fileName1)));
		// System.out.println(Arrays.toString(getCSVTitle(fileName,
		// characterName)));
		/*
		 * List<String[]> list = getExcelContent(fileName1); for (String[] strs
		 * : list) { System.out.println(Arrays.toString(strs)); }
		 * 
		 * List<String[]> listCSV = getCSVContent(fileName, characterName); for
		 * (String[] strings : listCSV) {
		 * System.out.println(Arrays.toString(strings)); }
		 */

		System.out.println(Arrays.toString(ReadExcelAndCSVUtils.getUploadFileTitle(fileName1)));
		System.out.println(Arrays.toString(ReadExcelAndCSVUtils.getUploadFileContent(fileName1).get(0)));
		System.exit(0);
	}

}
