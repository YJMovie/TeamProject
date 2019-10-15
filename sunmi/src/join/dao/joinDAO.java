package join.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.apache.ibatis.session.SqlSession;

import join.dto.joinDTO;
import sqlMap.mybatisManager;

public class joinDAO {
	public void insertJoin(joinDTO dto) {
	   SqlSession session = mybatisManager.getInstance().openSession();
	   
	   session.insert("join.insert", dto);
	   session.commit();
	   session.close();
	}
	
	public int confirmID(String userid) {
		int result = -1;
		SqlSession session = mybatisManager.getInstance().openSession();
		String rs = session.selectOne("join.confirmID",userid);
		System.out.println(rs);
		if (rs != null ) {
			result = 1;
		} else {
			result = -1;
		}
		session.close();
		return result;
	}
}





