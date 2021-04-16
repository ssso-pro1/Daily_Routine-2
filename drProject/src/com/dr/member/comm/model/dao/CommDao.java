package com.dr.member.comm.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class CommDao {
	
	private Properties prop = new Properties(); 
	
	public CommDao() {
		
		String fileName = CommDao.class.getResource("/sql/comm/comm-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	
}
