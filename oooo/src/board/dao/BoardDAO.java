package board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import board.dto.BoardDTO;
import sqlMap.MybatisManager;

public class BoardDAO {
	public List<BoardDTO> list() {
		SqlSession session = MybatisManager.getInstance().openSession();
		List<BoardDTO> list = session.selectList("board.list");
		session.close();
		
		return list;
	}
	public List<BoardDTO> list_random(int start, int end) {
		SqlSession session = MybatisManager.getInstance().openSession();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		List<BoardDTO> list = session.selectList("board.listRandom",map);
		session.close();
		return list;
	}
	public BoardDTO info(int num) {
		SqlSession session = MybatisManager.getInstance().openSession();
		BoardDTO dto = session.selectOne("board.info", num);
		session.close();
		return dto;
	}
}
