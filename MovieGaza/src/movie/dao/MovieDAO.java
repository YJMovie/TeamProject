package movie.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import movie.dto.MovieDTO;
import sqlMap.MybatisManager;

public class MovieDAO {
	public List<MovieDTO> movieList() {
		SqlSession session = MybatisManager.getInstance().openSession();
		List<MovieDTO> list = session.selectList("movie.movieList");
		session.close();
		return list;
	}
}
