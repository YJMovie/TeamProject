package member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<MemberDTO> list(int start, int end){ //회원리스트
		SqlSession session = MybatisManager.getInstance().openSession();
	
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("start", start);
		map.put("end",end);
		
		List<MemberDTO> list = session.selectList("member.memlist",map);
		System.out.println("sssss;"+list.get(0));
		
		session.close();
		return list;	
	}
	public void memUpdate(MemberDTO dto) {
		SqlSession session = MybatisManager.getInstance().openSession();
		
		session.update("member.memUpdate",dto);
		session.commit();
		session.close();

	}
	public void memDelete(String userid) {
		SqlSession session = MybatisManager.getInstance().openSession();
		
		System.out.println(userid);
		session.delete("member.delete",userid);
		session.commit();
		session.close();
	}
	public MemberDTO memGet(MemberDTO dto) { //회원정보 가져오기
		SqlSession session = MybatisManager.getInstance().openSession();
		System.out.println("././././.");
		MemberDTO result = session.selectOne("member.memGet",dto);
		System.out.println(result);
		session.commit();
		session.close();
		
		return result;
	}
	public int recordCount() {
		SqlSession session = MybatisManager.getInstance().openSession();
		
		int recordCount = session.selectOne("member.recordCount");
		session.close();
		
		return recordCount;
	}
	
}





