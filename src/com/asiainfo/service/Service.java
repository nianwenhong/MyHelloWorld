package com.asiainfo.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.asiainfo.dao.BaseDao;
import com.asiainfo.model.Competence;

/**
 * @author wenhong
 */
public class Service extends BaseDao {
	/**
	 * 获取List
	 * @return
	 */
	public List<Competence> getAllAuthorize() {
		List<Competence> authorizesList = new ArrayList<Competence>();
		Connection conn = BaseDao.getConnection();
		try {
			st = conn.prepareStatement("select * from TreeNode");
			rs = st.executeQuery();
			while (rs.next()) {
				Competence authorize = new Competence();
				authorize.setId(rs.getInt("ID"));
				authorize.setpId(rs.getInt("PID"));
				authorize.setName(rs.getString("NAME"));
				authorize.setIsParent(rs.getInt("ISPARENT"));
				authorize.setOpen(rs.getInt("OPEN"));
				authorizesList.add(authorize);
			}
		} catch (SQLException e) {
			System.out.println("---------------- 查询authorize失败 -----------------");  
			e.printStackTrace();
		} finally{
			closeConnection(rs, st, conn);
		}
		return authorizesList;
	}
	
	/**
	 * 拼接成json类型
	 */
	public String getJSONData() {
		Service service = new Service();
		List<Competence> list = service.getAllAuthorize();
		StringBuffer json = new StringBuffer("[");
		String data = "";
		for (int i = 0; i < list.size(); i++) {
			json.append("{id:" + list.get(i).getId() + ",");
			json.append("pId:" + list.get(i).getpId() + ",");
			json.append("name:\"" + list.get(i).getName() + "\",");
			// isParent为1表示该节点作为父节点
			if (list.get(i).getIsParent() != 0) {
				json.append("isParent:" + list.get(i).getIsParent() + ",");
			}
			// open为1表示该节点要展开显示
			if (list.get(i).getOpen() != 0) {
				json.append("open:" + list.get(i).getOpen() + ",");
			}
			data = json.substring(0, json.lastIndexOf(",")) + "},";
			json = new StringBuffer(data);
		}
		data = json.substring(0, json.length() - 1) + "]";
		System.out.println(data);
		System.out.println("---------------- JSON数据获取成功 -----------------");
		return data;
	}
}
