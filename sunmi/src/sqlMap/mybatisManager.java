package sqlMap;

import java.io.Reader;

import org.apache.ibatis.builder.SqlSourceBuilder;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class mybatisManager {
	private mybatisManager() { //생성자
	}
	//SQLSession객체를 만들어내는 SQLSessionFactory 참조변수
	//mybatis query를 수행하는 객체
	private static SqlSessionFactory instance; //sql실제 명령을 수행하는 객체
	public static SqlSessionFactory getInstance() {
		Reader reader = null;
		if(reader ==null) {
			try {
				//sqlmapconfig.xml(마이바티스 환경설정)파일 정보를 읽음
				String resource = "sqlMap/SQLMapconfig.xml";
				reader = Resources.getResourceAsReader(resource);
				
				instance = new SqlSessionFactoryBuilder().build(reader);
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}finally {
				try {
					if(reader != null) {
						reader.close();
					}
				} catch (Exception e2) {
					// TODO: handle exception
					e2.printStackTrace();
				}
			}
		}
		return instance;
	}
	public static SqlSessionFactory getSqlMapconfig() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
