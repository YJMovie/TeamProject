package movie.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import movie.dto.ReviewDTO;
import sqlMap.MybatisManager;

public class ReviewDAO {
	public List<ReviewDTO> reviewList(String moviecode) {
		SqlSession session = MybatisManager.getInstance().openSession();
		List<ReviewDTO> list = session.selectList("movie.reviewList",moviecode);
		System.out.println(list);
		session.close();
		return list;
	}
	public void reviewInsert(ReviewDTO dto) {
		SqlSession session = MybatisManager.getInstance().openSession();
		session.insert("movie.reviewInsert",dto);
		session.commit();
		session.close();
	}
}
