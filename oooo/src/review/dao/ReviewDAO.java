package review.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import review.dto.ReviewDTO;
import sqlMap.MybatisManager;

public class ReviewDAO {
	public void reviewInsert(ReviewDTO rdto) {
		SqlSession session = MybatisManager.getInstance().openSession();
		session.insert("review.insert",rdto);
		session.commit();
		session.close();
	}
	public List<ReviewDTO> reviewRead(int movie_num, int start, int end) {
		SqlSession session = MybatisManager.getInstance().openSession();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("movie_num", movie_num);
		map.put("start", start);
		map.put("end",end);
		List<ReviewDTO> list = session.selectList("review.read",map);
		session.close();
		return list;
	}
}
