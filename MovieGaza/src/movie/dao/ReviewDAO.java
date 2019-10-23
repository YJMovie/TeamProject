package movie.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import movie.dto.ReviewDTO;
import sqlMap.MybatisManager;

public class ReviewDAO {
	public List<ReviewDTO> reviewList(String moviecode, int start, int end) {
		SqlSession session = MybatisManager.getInstance().openSession();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("moviecode", moviecode);
		map.put("start", start);
		map.put("end", end);
		List<ReviewDTO> list = session.selectList("movie.reviewList",map);
		session.close();
		return list;
	}
	public void reviewInsert(ReviewDTO dto) {
		SqlSession session = MybatisManager.getInstance().openSession();
		session.insert("movie.reviewInsert",dto);
		session.commit();
		session.close();
	}

	public double makeStar(String moviecode) {
	        SqlSession session = MybatisManager.getInstance().openSession();
	        double star_result = session.selectOne("movie.moviescore", moviecode);
	         session.commit();
	         session.close();
	         return star_result;
	}
	   
	public void insertreviewscore(ReviewDTO dto) {
	   SqlSession session = MybatisManager.getInstance().openSession();
	   session.insert("movie.insertreviewscore",dto);
	   session.commit();
	   session.close();
	}
	public int reviewCount() {
		SqlSession session = MybatisManager.getInstance().openSession();
		int result = session.selectOne("movie.reviewCount");
		session.close();
		return result;
	}

}
