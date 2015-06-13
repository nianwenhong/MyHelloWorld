package com.asiainfo.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * @author wenhong
 */
public class BaseDao {
	static Connection conn;
	protected PreparedStatement st;
	protected ResultSet rs;

	/**
	 * 1、获取数据的连接
	 * @return
	 */
	public static Connection getConnection() {
		try {
			//加载驱动
			Class.forName("com.mysql.jdbc.Driver");
			try {
				//创建连接
				conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/myztreedemo", "root", "root");
				System.out.println("---------------- 打开连接 -----------------");
			} catch (Exception e) {
				System.out.println("---------------- 连接失败 -----------------");
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			System.out.println("---------------- 驱动加载失败 -----------------");
			e.printStackTrace();
		}
		return conn;
	}
	
	/**
	 * 2、关闭连接的方法
	 * @param rs
	 * @param st
	 * @param conn
	 */
	public static void closeConnection(ResultSet rs, Statement st, Connection conn) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (st != null) {
				st.close();
			}
			if (conn != null && !conn.isClosed()) {
				conn.close();
			}
			System.out.println("---------------- 关闭连接 -----------------");
		} catch (SQLException e) {
			System.out.println("---------------- 关闭连接失败 -----------------");
			e.printStackTrace();
		}
	}
}
