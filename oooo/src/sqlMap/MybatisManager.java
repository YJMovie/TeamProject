package sqlMap;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MybatisManager {
	private MybatisManager() {}; // 생성자
	
	// SqlSession객체를 만들어내는 SqlSessionFactory참조변수
	// mybatis query를 수행하는 객체
	private static SqlSessionFactory instance;
	public static SqlSessionFactory getInstance() {
		Reader reader = null;
		if(reader == null) {
			try {
				// SqlMapConfig.xml(mybatis환경설정) 파일의 정보 읽어들이는 코드
				String resource = "sqlMap/SqlMapConfig.xml";
				reader = Resources.getResourceAsReader(resource);
				
				// SqlSessionFactory객체 생성
				instance = new SqlSessionFactoryBuilder().build(reader);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally {
				try {
					if(reader!=null)reader.close();
				} catch (Exception e2) {
					// TODO: handle exception
					e2.printStackTrace();
				}
			}
		}
		return instance;
	}
}
