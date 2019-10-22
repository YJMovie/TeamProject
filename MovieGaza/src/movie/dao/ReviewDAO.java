package movie.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import movie.dto.ReviewDTO;
import sqlMap.MybatisManager;

public class ReviewDAO {
	public List<ReviewDTO> reviewList(String moviecode) {
		SqlSession session = MybatisManager.getInstance().openSession();
		List<ReviewDTO> list = session.selectList("movie.reviewList",moviecode);
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

}
