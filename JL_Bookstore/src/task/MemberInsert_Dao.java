package task;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;

import db.connection.DBConnection;

/************************************************************
 * @author 이정렬(Jeongryeol Lee)
 * @email duxbellorn@gmail.com
 * @GitHub https://github.com/Jeongryeol
 * @last 2018.08.02
 * @comment
 * 			회원에 대하여 입력업무를 처리하는 Data Access Object
 ************************************************************/
public class MemberInsert_Dao {

	// 로그준비
	Logger logger = Logger.getLogger(MemberInsert_Dao.class);

	// MyBatis 커넥션풀 불러오기
	DBConnection dbcon = null; // DB연결 공통클래스

	SqlSession sqlSes = null; // 연결에 대한 모든 정보가 담긴 객체

	/********************************************************
	 * [[ INSERT :: 입력업무 기본꼴 ]]
	 * 
	 * @param (Map<String,Object>)pMap
	 *            : Front(Web|App)에서 입력한 데이터
	 *            WebContent/task/SignUp.jsp로부터 넘어옴
	 * 
	 * @return (int)result : 입력 성공시 1, 실패시0
	 *         WebContent/task/result.jsp로 넘어감
	 ********************************************************/
	public int memeberInsert(Map<String, Object> pMap) {

		logger.info("MemberInsert_Dao : memberInsert() 호출성공");// 확인용
		logger.info("pMap = " + pMap);
		// 넘어와야하는 값 :

		// 연결정보생성
		dbcon = new DBConnection(); // DB연결 공통클래스 인스턴스변수
		sqlSes = dbcon.getConnection();// 연결객체 생성

		int result = 0;// 반환용 숫자변수 준비
		try {
			result = sqlSes.insert("insert_Mem", pMap);
		} catch (Exception e) {
			e.printStackTrace();
			logger.info(e.toString());
		}

		return result;
	}
}
