package task;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;

import db.connection.DBConnection;

/************************************************************
 * @author 이정렬(Jeongryeol Lee)
 * @email duxbellorn@gmail.com
 * @GitHub https://github.com/Jeongryeol
 * @last 2018.07.30
 * @comment
 * 			조회업무를 처리하는 Data Access Object
 * 
 ************************************************************/
public class BookSelect_Dao {

	// 로그를 찍는 loj4j의 로거 사용하기
	Logger logger = Logger.getLogger(BookSelect_Dao.class);

	// DB연결하기
	DBConnection dbcon = null; // DB연결 공통클래스

	SqlSession sqlSes = null; // 연결에 대한 모든 정보가 담긴 객체

	/********************************************************
	 * [[ SELECT :: 조회업무 기본꼴 ]]
	 * 
	 * @param pMap
	 *            : Front(Web|App)에서 입력한 데이터
	 *            위 파라미터 데이터는 아래 경로의 jsp파일로부터 넘어옴
	 *            WebContent/_task/user/BookAction_List.jsp
	 * @return rlist : Back(DB)에서 조회한 데이터
	 *         List타입에 각 로우 정보가 Map<알라어스컬럼명,로우값>으로 저장)
	 *         리턴된 데이터는 아래 경로의 jsp파일에서 사용됨
	 *         WebContent/_task/user/BookAction_List.jsp
	 ********************************************************/
	public List<Map<String, Object>> getDataList(Map<String, Object> pMap) {

		logger.info("getDataList 호출 성공");// 확인용 로그
		// 넘어온 Map으로부터 userInput의 값 확인하기
		// logger.info("pMap.get('userInput') = "+pMap.get("userInput"));

		dbcon = new DBConnection();// DB연결 공통클래스 인스턴스변수
		sqlSes = dbcon.getConnection();// 연결객체 갱성

		List<Map<String, Object>> rlist = null;// DB조회결과 반환하는 List
		System.out.println(pMap);
		try {
			// 단위테스트
			// pMap = new HashMap<String,Object>();
			// pMap.put("userInput","자");//rlist=2 확인완료
			rlist = sqlSes.selectList("select_Nm_Au", pMap);
			// logger.info("[1]rlist = "+rlist.size());//확인용 로그
		} catch (Exception e) {
			e.printStackTrace();// 에러추적
			logger.info("getDataList 에러발생");// 확인용 로그
		}
		logger.info("getDataList 종료");// 확인용 로그
		return rlist;// 반환
	}
}
