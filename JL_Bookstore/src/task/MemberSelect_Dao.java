package task;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;

import db.connection.DBConnection;

/************************************************************
 * 	@author 이정렬(Jeongryeol Lee)
 *  @email	duxbellorn@gmail.com
 *  @GitHub	https://github.com/Jeongryeol
 * 	@last	2018.08.03
 * 	@comment
 * 	조회업무를  처리하는 Data Access Object
 * 	
 ************************************************************/
public class MemberSelect_Dao {
	//로그를 찍는 loj4j의 로거 사용하기
	Logger logger = Logger.getLogger(BookSelect_Dao.class);
	//DB연결하기
	DBConnection dbcon	= null; //DB연결 공통클래스
	SqlSession	 sqlSes	= null;	//연결에 대한 모든 정보가 담긴 객체

	/********************************************************
	 * [[ loginTry :: 회원정보조회 ]]
	 * @param pMap : memberServlet.jaga[서블릿]에서 분기 후 넘어온 Map자료
	 * @return boolean : 로그인 승인 가/부 리턴
	 * 	
	 ********************************************************/
	public boolean loginTry(Map<String,Object> pMap){
		logger.info("getDataList 호출 성공");//확인용 로그
		//넘어온 Map으로부터 userInput의 값 확인하기
		//logger.info("pMap.get('userInput') = "+pMap.get("userInput"));
		List<Map<String,Object>> rlist = null;//DB조회결과를 담을 List
		boolean isApproval = false;//로그인 승인여부를 반환할 Boolean
		System.out.println(pMap);
		try {
			//단위테스트
			pMap = new HashMap<String,Object>();
			pMap.put("userInput","자");//rlist=2 확인완료
			rlist = sqlSes.selectList("select_Nm_Au",pMap);
			logger.info("[1]rlist = "+rlist.size());//확인용 로그
			//결과확인 후 로그인 승인
			if(rlist.size()==1) {
				isApproval = true;
				logger.info("isApproval = "+isApproval);//확인용 로그
				return isApproval;//반환
			}
		} catch (Exception e) {
			e.printStackTrace();//에러추적
			logger.info("getDataList 에러발생");//확인용 로그
		}
		logger.info("getDataList 종료");//확인용 로그
		return isApproval;//반환
	}
}
