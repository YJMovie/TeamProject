package movie.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import movie.dto.MovieCodeDTO;
import movie.dto.MovieDTO;
import sqlMap.MybatisManager;

public class MovieDAO {
	public List<MovieDTO> movieList(int start, int end) {
		SqlSession session = MybatisManager.getInstance().openSession();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		List<MovieDTO> list = session.selectList("movie.movieList",map);
		session.close();
		return list;
	}
	public List<MovieDTO> movieRandom(int start, int end) {
		SqlSession session = MybatisManager.getInstance().openSession();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		List<MovieDTO> list = session.selectList("movie.movieRandom",map);
		session.close();
		return list;
	}
	public List<MovieDTO> movieListScore(int start, int end) {
		SqlSession session = MybatisManager.getInstance().openSession();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		List<MovieDTO> list = session.selectList("movie.movieListScore",map);
		session.close();
		return list;
	}
	
	public List<MovieDTO> movieListGenre(String grcode) {
		SqlSession session = MybatisManager.getInstance().openSession();
		List<MovieDTO> list = session.selectList("movie.movieListGenre", grcode);
		session.close();
		return list;
	}
	
	public List<MovieDTO> movieListUserGenre(String userid) {
		SqlSession session = MybatisManager.getInstance().openSession();
		List<MovieDTO> list = session.selectList("movie.movieListUserGenre", userid);
		session.close();
		return list;
	}
	
	
	public MovieDTO movieInfo(String grcode) {
		SqlSession session = MybatisManager.getInstance().openSession();
		MovieDTO dto = session.selectOne("movie.movieInfo",grcode);
		session.close();
		return dto;
	}
	
	public List<MovieDTO> movieSearch(String keyword, int start, int end) {
		SqlSession session = MybatisManager.getInstance().openSession();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", "%"+keyword+"%");
		map.put("start", start);
		map.put("end", end);
		List<MovieDTO> list = session.selectList("movie.movieSearch",map);
		System.out.println(list);
		session.close();
		return list;
	}
	public String moviecodeMax() {
		SqlSession session = MybatisManager.getInstance().openSession();
		String mvcodeMax = session.selectOne("movie.moviecodeMax");
		session.close();
		return mvcodeMax;
	}
	public void movieInsert(MovieDTO dto) {
		SqlSession session = MybatisManager.getInstance().openSession();
		System.out.println(dto);
		session.insert("movie.movieInsert",dto);
		session.commit();
		session.close();
	}
	public void moviecodeInsert(MovieCodeDTO dto) {
		SqlSession session = MybatisManager.getInstance().openSession();
		session.insert("movie.moviecodeInsert",dto);
		session.commit();
		session.close();
	}
	public MovieDTO movieTitle(String title) {
		SqlSession session = MybatisManager.getInstance().openSession();
		MovieDTO dto = session.selectOne("movie.movieTitle",title);
		session.close();
		return dto;
	}
	public int movieCount() {
		SqlSession session = MybatisManager.getInstance().openSession();
		int result = session.selectOne("movie.movieCount");
		session.close();
		return result;
	}
	public List<MovieCodeDTO> moviecodeGrcode(String mvcode) {
		SqlSession session = MybatisManager.getInstance().openSession();
		List<MovieCodeDTO> list = session.selectList("movie.moviecodeGrcode",mvcode);
		session.close();
		return list;
	}
	public String movieGenre(String grcode) {
		SqlSession session = MybatisManager.getInstance().openSession();
		String genrename = session.selectOne("movie.movieGenre",grcode);
		session.close();
		return genrename;
	}
	public List<MovieCodeDTO> moviecodePscode(String mvcode) {
		SqlSession session = MybatisManager.getInstance().openSession();
		List<MovieCodeDTO> list = session.selectList("movie.moviecodePscode",mvcode);
		session.close();
		return list;
	}
	public String moviePerson(String pscode) {
		SqlSession session = MybatisManager.getInstance().openSession();
		String personname = session.selectOne("movie.moviePerson",pscode);
		session.close();
		return personname;
	}
	public void movieDelete(String moviecode) {
		SqlSession session = MybatisManager.getInstance().openSession();
		session.delete("movie.movieDelete",moviecode);
		session.commit();
		session.close();
	}
	
}

