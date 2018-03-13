package com.airintelli.ssm.utils;

import java.util.ArrayList;
import java.util.List;

import com.airintelli.ssm.pojo.TableColumnInfo;
import com.mysql.fabric.xmlrpc.base.Array;

public class ColumnContentCheckUtils {
	
	
	public static  List<String[]>    ColumnContentCheck(List<TableColumnInfo> columnInfo,String[] excleName,List<String[]> Content) throws Exception{
		      //数据库中的列字段
		      String[] tableName= new String[columnInfo.size()];
		      //新内容
		     
		      //新内容集合
		      List<String[]> newContents=new ArrayList<String[]>();
		      //对上传的内容进行调整
		      for(Integer i=0;i<columnInfo.size();i++){
		    	  //取出集合中的列字段
		    	  tableName[i]=columnInfo.get(i).getColumnName();
		      }
		      // 验证列字段和EXCLE的标题内容个数是否一致
		      if(tableName.length==excleName.length){
		    	  for(Integer i=0;i<Content.size();i++){
		    		  String[] newContent= new String[columnInfo.size()];
		    		  //验证列字段和EXCLE的标题内容是否一致
		    		  Integer count=0;
		    		  for(Integer m=0;m<tableName.length;m++){
		    			  
		    			  for(Integer n=0;n<excleName.length;n++){
			    			  if(tableName[m].equals(excleName[n])){
			    				  //根据比较获得相同的字段匹配并将内容进行调整
			    				  newContent[m]=Content.get(i)[n];
			    				  //记录内容相同的个数
			    				  count=count+1;
			    			  }
			    			  
			    		  } 
		    		  }
		    		  //内容相同时执行将调整后的内容加入新集合中
		    		  if(count==columnInfo.size()){
		    			  
		    			  newContents.add(newContent);
		    		  }
		    		  else{
		    				throw new Exception("EXCLE表头和数据库中字段名称存在不对应"); 
		    		  }
		    		  
		    	  }
		    	  
		    	  
		      }
		      else{
		    	  
		    		throw new Exception("字段数量不一致");
		      }
		    
		
		return newContents;
	}

}
