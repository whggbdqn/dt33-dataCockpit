package com.airintelli.ssm.utils;

import java.util.ArrayList;
import java.util.List;

import com.airintelli.ssm.pojo.TableColumnInfo;

/**
 * Excel数据转化校验
 * 
 * @author zengjia
 *
 */
public class ParseUtils {
	
	public static final String textType = "文本";
	public static final String intType = "整数";
	public static final String floatType = "浮点数";
	

	/**
	 * 单个数据的转化
	 * @param origin
	 * @param type
	 * @return
	 * @throws NumberFormatException
	 */
	public static Object parseSingle(String origin,String type) throws NumberFormatException{
		Object dest = null;
		
		//if(origin == null) throw new Exception("");
		//String[] s = {null,"aa"};
		if(textType.equals(type)){
			dest = origin;
		}else if(intType.equals(type)){
			dest = Integer.parseInt(origin);
		}else if(floatType.equals(type)){
			dest = Float.parseFloat(origin);
		}
		
		return dest;
	}
	
	/**
	 * excel整体数据转化
	 * @param xlsList
	 * @param typeList
	 * @return
	 * @throws Exception
	 */
	public static List<Object[]> parseAll(List<String[]> xlsList,List<TableColumnInfo> typeList) throws Exception {
		List<Object[]> list = new ArrayList<Object[]>();
		Object[] objArr = null;
		TableColumnInfo column = null;
		for(int i = 0;i < xlsList.size();i++) {
			String[] textArr = xlsList.get(i);
			objArr = new Object[textArr.length];
			for(int j = 0;j < typeList.size(); j++){
				column = typeList.get(j);
				String text =  textArr[j];
				if(text == null){
					throw new Exception("第"+i+"行第"+j+"列数据为空");
				}
				Object obj = null;
				try {
					obj = parseSingle(text,column.getColumnType());
					
				} catch (NumberFormatException e) {
					throw new Exception("第"+i+"行第"+j+"列数据类型不匹配");
				}
				
				objArr[j] = obj;
			}
			list.add(objArr);
		}
		return list;
	}
}
