package board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import board.dto.BoardDTO;
import sqlMap.MybatisManager;

public class BoardDAO {
	public List<BoardDTO> list(String cat, int start, int end) {
		SqlSession session = MybatisManager.getInstance().openSession();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cat", cat);
		map.put("start", start);
		map.put("end", end);
		List<BoardDTO> list = session.selectList("board.list",map);
		session.close();
		
		return list;
	}
	public List<BoardDTO> list_random(int start, int end) { //영화리스트 5개 랜덤순
		SqlSession session = MybatisManager.getInstance().openSession();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		List<BoardDTO> list = session.selectList("board.listRandom",map);
		session.close();
		return list;
	}
	public List<BoardDTO> list_mark(int start, int end) { //영화리스트 5개 평점순
		SqlSession session = MybatisManager.getInstance().openSession();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		List<BoardDTO> list = session.selectList("board.listMark",map);
		session.close();
		return list;
	}
	public List<BoardDTO> searchList(String keyword, int start, int end) {
		SqlSession session = MybatisManager.getInstance().openSession();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("keyword", "%"+keyword+"%");
		List<BoardDTO> list = session.selectList("search.list",map);
		session.close();
		return list;
	}
	public int TotMovieCount() {
		SqlSession session = MybatisManager.getInstance().openSession();
		int result = Integer.parseInt(session.selectOne("board.TotMovieCount"));
		session.close();
		return result;
	}
	public int TotalSearchCount(String keyword) {
		SqlSession session = MybatisManager.getInstance().openSession();
		int result = Integer.parseInt(session.selectOne("search.TotSearchCount","%"+keyword+"%"));
		session.close();
		return result;
	}
	public BoardDTO info(int num) {
		SqlSession session = MybatisManager.getInstance().openSession();
		BoardDTO dto = session.selectOne("board.info", num);
		session.close();
		return dto;
	}
	
}
