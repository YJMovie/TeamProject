package member.dao;

import java.util.List;

import javax.websocket.Session;

import org.apache.ibatis.session.SqlSession;

import member.dto.MemberDTO;
import sqlMap.MybatisManager;

public class logDAO {
	public String log(MemberDTO dto) {
		SqlSession session = MybatisManager.getInstance().openSession();//
		String result = session.selectOne("log.login",dto);
		System.out.println("결과?"+result);
		
		session.close();
		
		return result;
	}
	public int memberGrade(String result) {
		SqlSession session = MybatisManager.getInstance().openSession();
		int grade = session.selectOne("log.memberGrade",result);
		session.close();
		return grade;
	}

}
