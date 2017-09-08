package com.kh.web.model.upload;

import java.sql.SQLException;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class FileDAO {
	@Autowired
	private SqlSession query;
	public void saveImage(Map<String, Object> hmap) throws SQLException{
		query.insert("upload.saveImage", hmap);
	}
}
