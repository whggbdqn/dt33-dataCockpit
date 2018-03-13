/**
 * 
 */
package com.airintelli.ssm.utils;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import com.opencsv.CSVReader;

import jxl.Cell;
import jxl.CellType;
import jxl.DateCell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

/**
 * 读取excel和CSV文件的工具类
 * 
 * @author xp
 *
 */
public class ReadExcelAndCSVUtils {

	/*
	 * 获取上传文件的后缀，判断是否是xls或者是csv文件 fileName:文件所在的路径
	 */
	public static boolean isFileType(String fileName) {
		String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
		if (suffix.equals("xls") || suffix.equals("csv")) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 获取上传文件的标题
	 * 
	 * @return
	 * @throws Exception
	 */
	public static String[] getUploadFileTitle(String fileName) throws Exception {
		String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
		String[] titles = null;
		if (suffix.equals("xls")) {
			titles = getExcelTitle(fileName);
		} else if (suffix.equals("csv")) {
			String characterName = codeString(fileName);
			titles = getCSVTitle(fileName, characterName);
		} else {
			throw new Exception("文件格式不正确，无法读取，必须为xls或CSV文件");
		}
		return titles;
	}

	/**
	 * 读取上传文件的内容
	 * 
	 * @param fileName
	 * @return
	 * @throws Exception
	 */
	public static List<String[]> getUploadFileContent(String fileName) throws Exception {
		String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
		List<String[]> contents = null;
		if (suffix.equals("xls")) {
			contents = getExcelContent(fileName);
		} else if (suffix.equals("csv")) {
			String characterName = codeString(fileName);
			contents = getCSVContent(fileName, characterName);
		}
		return contents;
	}

	/**
	 * 获取上传文档excel文件中内容的标题
	 * 
	 */
	public static String[] getExcelTitle(String fileName) throws BiffException, IOException {
		Workbook workbook = Workbook.getWorkbook(new File(fileName));
		// 获取excel的第一个工作薄
		Sheet sheet = workbook.getSheet(0);
		// 得到所有的行
		int rows = sheet.getRows();
		// 得到所有的列
		int cols = sheet.getColumns();
		String[] title = new String[cols];
		if (rows > 0 && cols > 0) {
			for (int i = 0; i < cols; i++) {
				title[i] = sheet.getCell(i, 0).getContents().trim();
				System.out.print(title[i].length());
			}
		}
		return title;
	}

	/**
	 * 获取上传的csv文件内容中的标题
	 * 
	 * @param fileName
	 *            文件路径
	 * @param characterName
	 *            字符编码
	 * @return
	 * @throws IOException
	 */
	public static String[] getCSVTitle(String fileName, String characterName) throws Exception {
		File file = new File(fileName);
		InputStreamReader inputStreamReader = null;
		BufferedReader bufferedReader = null;
		// FileReader fileReader = null;
		CSVReader csvReader = null;
		String[] title = null;

		try {
			if (characterName.equalsIgnoreCase("GBK")) {
				inputStreamReader = new InputStreamReader(new FileInputStream(file), "gbk");
			} else if (characterName.equalsIgnoreCase("utf-8")) {
				inputStreamReader = new InputStreamReader(new FileInputStream(file), "utf-8");
			} else if (characterName.equalsIgnoreCase("Unicode")) {
				inputStreamReader = new InputStreamReader(new FileInputStream(file), "Unicode");
			} else {
				throw new Exception("文件编码格式错误!");
			}

			bufferedReader = new BufferedReader(inputStreamReader);
			// fileReader = new FileReader(file);
			// 读取CSV字符流
			csvReader = new CSVReader(bufferedReader);
			title = csvReader.readNext();
			// String[] newTitle=new String[title.length];
			if (title != null && title.length > 0) {
				// 去掉空格
				for (int i = 0; i < title.length; i++) {
					title[i] = title[i].trim();
					System.out.print(title[i].length());
				}
			}
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		} finally {
			if (csvReader != null) {
				csvReader.close();
			}
		}
		return title;
	}

	/**
	 * 判断文件的编码格式,以便于正确读取文件，防止乱码
	 * 
	 * @param args
	 * @throws Exception
	 */
	public static String codeString(String fileName) throws Exception {

		BufferedInputStream bin = null;
		String code = null;
		try {
			bin = new BufferedInputStream(new FileInputStream(new File(fileName)));
			int p = (bin.read() << 8) + bin.read();
			switch (p) {
			case 0xefbb:
				code = "UTF-8";
				break;
			case 0xfffe:
				code = "Unicode";
				break;
			case 0xfeff:
				code = "UTF-16BE";
				break;
			default:
				code = "GBK";
			}
		} catch (FileNotFoundException e) {
			throw new Exception(e.getMessage());
		} finally {
			if (bin != null) {
				try {
					bin.close();
				} catch (IOException e) {
					throw new Exception(e.getMessage());
				}
			}
		}

		return code;
	}

	/**
	 * 读取excel文件的内容（标题除外）
	 * 
	 * @param fileName
	 * @return
	 */
	public static List<String[]> getExcelContent(String fileName) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<String[]> list = new ArrayList<String[]>();
		Workbook workbook = Workbook.getWorkbook(new File(fileName));
		Sheet sheet = workbook.getSheet(0);
		// 得到所有的列
		int cols = sheet.getColumns();
		// 得到所有的行
		int rows = sheet.getRows();

		for (int i = 1; i < rows; i++) {
			String[] excels = new String[cols];
			for (int j = 0; j < cols; j++) {
				// 第一个是列数，第二个是行数
				Cell cell = sheet.getCell(j, i);
				// 判断单元格类型，如果是日期型，那么就转换成日期字符串
				if (cell.getType() == CellType.DATE) {
					DateCell dc = (DateCell) cell;
					Date date = dc.getDate();
					// 调整时区
					TimeZone zone = TimeZone.getTimeZone("GMT");
					sdf.setTimeZone(zone);
					excels[j] = sdf.format(date);
				} else {
					excels[j] = sheet.getCell(j, i).getContents().trim();
				}
			}
			list.add(excels);
		}
		return list;
	}

	/**
	 * 读取csv文件的内容（标题除外）
	 * 
	 * @return
	 * @throws IOException
	 */
	public static List<String[]> getCSVContent(String fileName, String characterName) throws Exception {
		File file = new File(fileName);
		InputStreamReader inputStreamReader = null;
		BufferedReader bufferedReader = null;
		CSVReader csvReader = null;
		List<String[]> listAll = new ArrayList<>();
		try {
			if (characterName.equalsIgnoreCase("GBK")) {
				inputStreamReader = new InputStreamReader(new FileInputStream(file), "gbk");
			} else if (characterName.equalsIgnoreCase("utf-8")) {
				inputStreamReader = new InputStreamReader(new FileInputStream(file), "utf-8");
			} else if (characterName.equalsIgnoreCase("Unicode")) {
				inputStreamReader = new InputStreamReader(new FileInputStream(file), "Unicode");
			} else {
				new Exception("文件编码格式错误!");
			}

			bufferedReader = new BufferedReader(inputStreamReader);
			// 读取CSV字符流
			csvReader = new CSVReader(bufferedReader);
			List<String[]> list = list = csvReader.readAll();
			// String[] newTitle=new String[title.length];
			if (list != null && list.size() > 0) {
				// 去掉空格
				for (int m = 1; m < list.size(); m++) {
					String[] newStrs = new String[list.get(m).length];
					for (int n = 0; n < list.get(m).length; n++) {
						newStrs[n] = list.get(m)[n].trim();
					}
					listAll.add(newStrs);
				}
			}
		} catch (UnsupportedEncodingException e) {
			throw new Exception(e.getMessage());
		} catch (FileNotFoundException e) {
			throw new Exception(e.getMessage());
		} catch (IOException e) {
			throw new Exception(e.getMessage());
		} finally {
			if (csvReader != null) {
				csvReader.close();
			}
		}

		return listAll;
	}

}
