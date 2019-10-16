package member.dao;

import org.apache.ibatis.session.SqlSession;

import member.dto.MemberDTO;
import sqlMap.MybatisManager;


public class MemberDAO {
	public void insertJoin(MemberDTO dto) {
	   SqlSession session = MybatisManager.getInstance().openSession();
	   
	   session.insert("member.insert", dto);
	   session.commit();
	   session.close();
	}
	
	public int confirmID(String userid) {
		int result = -1;
		SqlSession session = MybatisManager.getInstance().openSession();
		String rs = session.selectOne("member.confirmID",userid);
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





