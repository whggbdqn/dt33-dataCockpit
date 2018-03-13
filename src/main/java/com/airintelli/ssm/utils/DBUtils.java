package com.airintelli.ssm.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * 数据库访问类
 * @author zengjia
 *
 */
public class DBUtils {
	private static String classPath = "com.mysql.jdbc.Driver";
	private static String connstr = "jdbc:mysql://localhost:3306/datacockpit?characterEncoding=utf-8";
	private static String user = "root";
	private static String password = "root";
	private static Connection conn = null;
	private static PreparedStatement ps = null;
	
	public static int executeUpdate(String sql, Object[] paras) throws Exception {
		int rows =0;
		Class.forName(classPath);
		
		if(conn == null) {
			conn = DriverManager.getConnection(connstr, user, password);
		}
		ps = conn.prepareStatement(sql);

		if (paras != null) {
			for (int i = 0; i < paras.length; i++) {
				ps.setObject(i + 1, paras[i]);
			}
		}
		rows = ps.executeUpdate();
		return rows;
	}
	
	public static ResultSet executeQuery(String sql, Object[] paras) throws Exception {
		ResultSet rs = null;
		Class.forName(classPath);
		
		if(conn == null) {
			conn = DriverManager.getConnection(connstr, user, password);
		}
		ps = conn.prepareStatement(sql);

		if (paras != null) {
			for (int i = 0; i < paras.length; i++) {
				ps.setObject(i + 1, paras[i]);
			}
		}
		rs = ps.executeQuery();
		
		return rs;
	} 
	
	/**
	 * 关闭ResultSet,PreparedStatement及Connection
	 * @param rs
	 */
	public static void closeAll(ResultSet rs) {
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				rs = null;
			}
		}
		if(ps != null){
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				ps = null;
			}
		}
		
		if(conn != null){
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				conn = null;
			}
		}
	}
	
}
