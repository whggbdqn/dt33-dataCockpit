/**
 * 
 */
package com.airintelli.ssm.utils;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import com.opencsv.CSVWriter;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;

/**
 * 根据Lis集合存储的数据写入到excel或csv文件中
 * 
 * @author xp
 *
 */
public class WriteExcetlAndCSVUtils {
	/**
	 * 导出文件
	 * 
	 * @param fileType
	 *            导出是csv文件
	 * @param fileName
	 *            导出文件全路径名
	 * @param list
	 *            导出的数据集合数组
	 * @param tableName
	 *            导出为excel时，给工作溥的名称
	 * @return
	 * @throws Exception
	 */
	public static void exportDataFile(String fileType, String fileName, List<String[]> list, String tableName)
			throws Exception {
		if (fileType != null && fileType.length() > 0) {
			if (list != null && list.size() > 0) {
				if (fileType.equalsIgnoreCase("xls")) {
					writeDataToExcel(fileName, list, tableName);
				} else if (fileType.equalsIgnoreCase("csv")) {
					writeCSV(fileName, list);
				}
			} else {
				throw new Exception("导出的数据内容不能为空 ");
			}
		} else {
			throw new Exception("请确认您想要导出的文件格式");
		}
		
	}

	/**
	 * 把数据库中获取到的数据写入到指定的csv文件中
	 * 
	 * @param fileName
	 * @param list
	 * @throws Exception
	 */
	public static void writeCSV(String fileName, List<String[]> list) throws Exception {
		File file = new File(fileName);
		OutputStreamWriter outputStreamWriter = null;
		BufferedWriter bufferedWriter = null;
		CSVWriter csvWriter = null;
		try {
			outputStreamWriter = new OutputStreamWriter(new FileOutputStream(file), "utf-8");
			bufferedWriter = new BufferedWriter(outputStreamWriter);
			csvWriter = new CSVWriter(bufferedWriter, ',');
			if (list != null && list.size() > 0) {
				csvWriter.writeAll(list, true);
			}
		} catch (UnsupportedEncodingException | FileNotFoundException e) {
			throw new Exception(e.getMessage());
		} finally {
			try {
				if (csvWriter != null) {
					csvWriter.flush();
					csvWriter.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}

		}
	}

	/**
	 * 把数据库中获取到的数据写入到指定的excel文件中
	 * 
	 * @param fileName
	 *            文件写入的路径和名称
	 * @param list
	 *            从数据库读取的数据转换为《数组集合》
	 * @param tableName
	 *            写入excel文件中工作溥的名称
	 * @throws Exception
	 */
	public static void writeDataToExcel(String fileName, List<String[]> list, String tableName) throws Exception {
		if (list.size() > 0) {
			File file = new File(fileName);
			// 创建excel表格
			WritableWorkbook workbook = null;
			try {
				workbook = Workbook.createWorkbook(file);
				// 创建sheet
				WritableSheet sheet = workbook.createSheet(tableName, 1);
				for (int i = 0; i < list.size(); i++) {
					for (int j = 0; j < list.get(i).length; j++) {
						// 创建label对象
						Label label1 = new Label(j, i, list.get(i)[j]);
						// 添加到sheet中
						sheet.addCell(label1);
					}
				}
				// sheet写入到excel中
				workbook.write();
			} catch (Exception e) {
				throw new Exception(e.getMessage());
			} finally {
				try {
					if (workbook != null) {
						workbook.close();
					}
				} catch (WriteException | IOException e) {
					throw new Exception(e.getMessage());
				}
			}

		} else {
			throw new Exception("读取的数据不能为空");
		}
	}

}
