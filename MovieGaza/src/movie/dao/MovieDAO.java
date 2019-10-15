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
	public List<MovieDTO> movieListScore() {
		SqlSession session = MybatisManager.getInstance().openSession();
		List<MovieDTO> list = session.selectList("movie.movieListScore");
		session.close();
		return list;
	}
	
	public MovieDTO movieInfo(String moviecode) {
		SqlSession session = MybatisManager.getInstance().openSession();
		MovieDTO dto = session.selectOne("movie.movieInfo",moviecode);
		session.close();
		return dto;
	}
	public List<MovieDTO> movieSearch(String keyword) {
		SqlSession session = MybatisManager.getInstance().openSession();
		List<MovieDTO> list = session.selectList("movie.movieSearch","%"+keyword+"%");
		System.out.println(list);
		session.close();
		return list;
	}
	
}

